/**
 * @description       : 
 * @author            : VMU
 * @group             : SC
 * @last modified on  : 09-10-2022
 * @last modified by  : VMU
**/
@isTest
private class BAT01_RenewalReminder_TEST {
    static {
        AP_TestDataFactory.generateBasicTestData();
    }
    /**
     * @Prerequisite : At least an account with more than one vehicle with target expiry date
     * @scenerio     : executing the batch with target date set to 1/12/2022 (30 days before 31/12/2022)
     * @result       : Expecting no vehicles been processed
     * 
     */ 
    static testMethod void testGenerateReminders(){
        system.debug('## Starting method testCreationOnInsert');

        System.runAs(AP_TestDataFactory.lstUsers[0]){
            
            Test.startTest();
                Date d = Date.newInstance(2022, 12, 1);
                BAT01_RenewalReminder batchObj = new BAT01_RenewalReminder(d); 
                database.executeBatch(batchObj);         
            Test.stopTest();

            map<Id,Task> mapCustomerTask = new map<Id,Task>();

            for(Task t: [SELECT 
                            WhatId,
                            OwnerId,
                            ActivityDate,
                            Description
                        FROM Task 
                        WHERE Subject =:Label.BAT01_Task_Subject])
            {
                mapCustomerTask.put(t.WhatId,t);
            }

            //now assert
            system.assert(mapCustomerTask.containsKey(AP_TestDataFactory.lstBusinesses[0].Id));
            Task t = mapCustomerTask.get(AP_TestDataFactory.lstBusinesses[0].Id);
            system.assert(t.Description.contains('400ZN20')); 
            system.assert(t.Description.contains('12JN20'));                
        }

    }
    /**
     * @Prerequisite : set the error list on initialisation    
     * @scenerio     : executing the batch with target default date
     * @result       : Expecting no vehicles been processed
     * @result       : sending email for error
     * 
     */ 
    static testMethod void testBatchError(){
        system.debug('## Starting method testBatchError');

        System.runAs(AP_TestDataFactory.lstUsers[0]){
            BAT01_RenewalReminder batchObj;
            Test.startTest();               
                batchObj = new BAT01_RenewalReminder(); 
                batchObj.numberOfError = 1;
                batchObj.strErrors = 'simulating-fake-error';
                database.executeBatch(batchObj);         
            Test.stopTest();
            
            list<Task> lstTask = [SELECT 
                                    WhatId,
                                    OwnerId,
                                    ActivityDate,
                                    Description
                                FROM Task 
                                WHERE Subject =:Label.BAT01_Task_Subject];
            //now assert
            system.assert(lstTask.isEmpty());
                          
        }

    }
}