/**
 * @File Name          : AP02_CaseStudy.cls
 * @Description        : Case Study
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : Akhilesh Ramchurn
 * @Last Modified On   : 08/11/2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    20/10/2022      ARA      Initial Version
 **/
public with sharing class AP02_CaseStudy {
    /**
     * @description US_APEX_01: All Damaged vehicles list by damage type.
     * @author Akhilesh Ramchurn | 19/10/2022
     **/
    public static void damageVehicle() {
        List<Case> lstVeh = [SELECT Vehicle__r.Name, Damage__c FROM Case WHERE Damage__c != NULL ORDER BY Damage__c];
        System.debug(lstVeh);
    }

    /**
     * @description US_APEX_02: All accounts having a case and display by recordType.
     * @author Akhilesh Ramchurn | 19/10/2022
     **/
    public static void accountCase() {
        List<Case> lstCase = [SELECT AccountId FROM Case WHERE AccountId != NULL];
        Set<String> setAccountId = new Set<String>();
        for (Case cse : lstCase) {
            setAccountId.add(cse.AccountId);
        }

        List<Account> lstAcc = [SELECT Name, RecordType.DeveloperName FROM Account WHERE Id IN :setAccountId AND RecordType.DeveloperName != NULL];

        Map<String, List<Account>> mapAccount = new Map<String, List<Account>>();

        for (Account acc : lstAcc) {
            //if key does not exist, initialise key to an empty list of type Account
            // if(!mapAccount.containsKey(acc.RecordType.DeveloperName)){
            //     mapAccount.put(acc.RecordType.DeveloperName, new List<Account>());
            // }

            // mapAccount.get(acc.RecordType.DeveloperName).add(acc);

            if (mapAccount.containsKey(acc.RecordType.DeveloperName)) {
                mapAccount.get(acc.RecordType.DeveloperName).add(acc);
            } else {
                mapAccount.put(acc.RecordType.DeveloperName, new List<Account>{ acc });
            }
        }
        System.debug(mapAccount);
    }

    /**
     * @description US_APEX_03:  Assign all accounts of region “North” having recordType ‘Customer’
     * and their related contacts to the manager.
     * @author Akhilesh Ramchurn | 19/10/2022
     **/
    public static void assignManagerAccountContact() {
        List<USER> lstManager = [SELECT Id FROM USER WHERE Profile.Name = 'Manager'];
        Id managerId = lstManager[0].Id;

        List<Account> lstAcct = [SELECT Id FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual'];
        set<String> setAccId = new Set<String>();

        for (Account acc : lstAcct) {
            setAccId.add(acc.Id);
            acc.OwnerId = managerId;
        }

        List<Contact> lstContact = [SELECT Id FROM Contact WHERE AccountId IN :setAccId];

        for (Contact cont : lstContact) {
            cont.OwnerId = managerId;
        }

        if (lstAcct.size() > 0) {
            update lstAcct;
        }

        if (lstContact.size() > 0) {
            update lstContact;
        }
    }

    /**
     * @description US_APEX_04:  Insert 10 accounts
     * (RecordType: Customer(Individual) and all the required fields need to be filled) and for each account,
     * insert a contact (Address and phone must contain the same corresponding data as the account).
     * @author Akhilesh Ramchurn | 19/10/2022
     **/
    public static void insert10AccountContactRecords() {
        List<Account> lstAcct = new List<Account>();
        List<Contact> lstContact = new List<Contact>();
        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

        for (Integer i = 0; i < 10; i++) {
            Account acct = new Account(RecordTypeId = recordTypeId, Name = 'AccName' + i, BillingStreet = 'pl', Phone = '1234', Region__c = 'South');
            lstAcct.add(acct);
        }

        if (lstAcct.size() > 0) {
            insert lstAcct;

            for (Integer i = 0; i < 10; i++) {
                Contact con = new Contact(
                    AccountId = lstAcct[i].Id,
                    FirstName = 'ContactFirstName' + i,
                    LastName = 'ContactLastName' + i,
                    Phone = lstAcct[i].Phone,
                    MailingStreet = lstAcct[i].BillingStreet
                );
                lstContact.add(con);
            }

            if (lstContact.size() > 0) {
                insert lstContact;
            }
        }

        /**
         * for(Integer i=0; i<10; i++){
            Account acct = new Account();
            acct.RecordTypeId = recordTypeId;
            acct.Name='TestAccountName'+i;
            acct.BillingStreet='flacq';
            acct.Phone = i+'';
            acct.Region__c = 'North';
            lstAcct.add(acct);
        }
    
        if(lstAcct.size()>0){

            insert lstAcct;

            Integer count =0;
            for(Account acc : lstAcct){
                Contact cont = new Contact();
                cont.AccountId = acc.Id;
                cont.FirstName = 'TestContactFirstName' +count;
                cont.LastName = 'TestContactLastName' +count;
                cont.Phone = lstAcct[count].Phone;
                cont.MailingStreet = lstAcct[count].BillingStreet;
                lstContact.add(cont);
                count++;
            }

            if(lstContact.size()>0){
                insert lstContact;
            }

        }
         */
    }

    /**
     * @description US_APEX_05: Delete all accounts and contacts created today
     * @author Akhilesh Ramchurn | 19/10/2022
     **/
    public static void deleteAccountsContacts() {
        List<Account> lstAcc = [SELECT Id FROM Account WHERE CreatedDate = TODAY];
        List<Contact> lstContact = [SELECT Id FROM Contact WHERE CreatedDate = TODAY];

        if (lstContact.size() > 0) {
            delete lstContact;
        }

        if (lstAcc.size() > 0) {
            delete lstAcc;
        }
    }
}