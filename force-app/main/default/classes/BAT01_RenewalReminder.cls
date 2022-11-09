/**
 * This class create reminders (task) for customer agents (account owner) one month
 * before the expiry date of their insured vehicles
 * @author            : VMU
 * @group             : SC
 * @last modified on  : 10-10-2022
 * @last modified by  : VMU
**/
global without sharing class BAT01_RenewalReminder implements Database.Batchable<sObject> , Database.Stateful, Schedulable{
    global Date dtExec;//target date of execution
    global Date dtExpiry;
    global String strErrors;
    global integer numberOfError;
    /**
    * Default constructor use the current execution day as execution date
    **/
    public BAT01_RenewalReminder() {
        dtExec = System.today();
        init();     
    }
    /**
    * Use user provider date as execution date
    * @param dt 
    **/
    public BAT01_RenewalReminder(Date dt) {
        dtExec = dt;
        init();        
    }
    /**
    * Method that will initialise all variables required
    **/
    public void init(){        
        strErrors = '';
        numberOfError = 0;
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        system.debug('## START BAT01_RenewalReminder start method');

        dtExpiry = dtExec.addDays(30);
        String query = 'Select RegistrationNumber__c,InsuredTo__c,InsuredTo__r.OwnerId from Vehicle__c where InsuranceEndDate__c =:dtExpiry and InsuredTo__c != null order by InsuredTo__c';
        system.debug('### query : ' + query);

        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Vehicle__c> lstVehicles) {
        system.debug('## execute the batch method');
        //group the vehicle by owner
        map<Id,list<String>> mapOwnerVehicles = new map<Id,list<String>>();
        map<Id,Id> mapCustomerAgent = new map<Id,Id>();
        list<Task> lstNewTsk = new list<Task>();

        for(Vehicle__c v : lstVehicles){
            //step1  : group vehicle by owner
            //owner already has a vehicle processed
            if(mapOwnerVehicles.containskey(v.InsuredTo__c)){
                mapOwnerVehicles.get(v.InsuredTo__c).add(v.RegistrationNumber__c);                
            }
            //owner does not previoulsy has a vehicle processed
            else mapOwnerVehicles.put(v.InsuredTo__c,new list<String>{v.RegistrationNumber__c});

            //map customer to agent
            mapCustomerAgent.put(v.InsuredTo__c,v.InsuredTo__r.OwnerId);           
        }
        //process vehicle for each customer and create task to their respective agents
        for(Id IdCustomer : mapOwnerVehicles.keySet()){
            system.debug('## processing customer ' + IdCustomer);
            Task t = new task();
            t.Subject = Label.BAT01_Task_Subject;
            t.WhatId = IdCustomer;
            t.OwnerId = mapCustomerAgent.get(IdCustomer);
            t.ActivityDate = dtExec.addDays(7);
            //get the list of registration number 
            String strRegLst = String.join( mapOwnerVehicles.get(IdCustomer), ',' ); 
            List<String> lstParam = new List<String>();
            system.debug('## registration numbers : ' + strRegLst);
            lstParam.add(strRegLst);
            DateTime dt = datetime.newInstance(dtExpiry, Time.newInstance(0,0,0,0));
            lstParam.add(dt.format('dd-MM-yyyy'));
            system.debug('## expiry date : ' + lstParam[1]);
            t.Description = String.format(Label.BAT01_Task_Comment, lstParam);
            lstNewTsk.add(t);
        }

        list<Database.SaveResult> results = Database.insert(lstNewTsk,false);
        //now insert to task
        for (Integer i = 0; i < lstNewTsk.size(); i++) {
            Database.SaveResult sr = results[i];
            if(!sr.isSuccess()){
                numberOfError++;
                //create a CSV from the errors to be sent via email
                strErrors += 'Task for customer Id ' + lstNewTsk[i].WhatId + ' could not be created for the following reason : ' + sr.getErrors()[0] + '\r\n';
            }
        }
    }
    global void finish(Database.BatchableContext BC) {
        system.debug('## finish with ' + numberOfError + ' errors');

        if(numberOfError > 0){
			//craete an email message	
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();		
            email.setSubject(Label.BAT01_Error_Mail_subject);
            email.setPlainTextBody(Label.BAT01_Error_Mail_Body);            
            email.setToAddresses((Label.BAT01_Email_Destination).split(','));
            //craete an attachment from the error msg
            Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
            attachment.setFileName('error.log');
            attachment.setBody(blob.valueOf(strErrors));
            attachment.setContentType('text/plain');
            list<Messaging.EmailFileAttachment> attachments;
            attachments = new list<Messaging.EmailFileAttachment>();
            email.setFileAttachments(attachments);//add the attachment to the email message
            //send the email
            if(!Test.isRunningTest()) Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});	
		}
    }
    /**
    * Allow to schedule this batch
    * @param sc 
    **/
    global void execute (SchedulableContext sc){
        BAT01_RenewalReminder batchObj = new BAT01_RenewalReminder();
        database.executeBatch(batchObj);
    }

}