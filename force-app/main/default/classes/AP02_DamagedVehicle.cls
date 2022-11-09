/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-21-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class AP02_DamagedVehicle {
    
    //UseCase 01
    public static void getDamagedVehicleAccordingToType()
    {
        List<Case> lstCas= [SELECT VehicleId__r.Name, Damage_Type__c FROM Case WHERE Damage_Type__c != NULL ORDER BY Damage_Type__c ];

        for(Case cas: lstCas)
        {
            System.debug(cas);
        }
    }


    //UseCase 02
    public static void getAllAccountWhichHasCaseByRecordType()
    {
        List<Case> lstCas = [SELECT Account.Name, Account.RecordType.DeveloperName FROM Case WHERE  AccountId != NULL AND Account.RecordType.DeveloperName != NULL];

        Set<String> setaccountId = new Set<String>();

        for(Case newcases : lstCas){
            setaccountId.add(newcases.Account.Id);

        }

        List<Account> lstAcc = [SELECT Name,RecordType.DeveloperName From Account WHERE Account.Id IN:setaccountId ];
    
        Map<String,List<Account>> mapAccount = new Map<String,List<Account>>();

           for(Account newAcc: lstAcc){
                if(mapAccount.containsKey(newAcc.RecordType.DeveloperName)){
                    mapAccount.get(newAcc.RecordType.DeveloperName).add(newAcc);  
                }

                else{
                    mapAccount.put(newAcc.RecordType.DeveloperName,new List<Account>{newAcc});

                }
               
           }
           if(mapAccount.size()>0){

                   System.debug(mapAccount);

           }

    }


    //UseCase 03
    public static void UpdateOwnerIdForAccountWithRegionNorth()
    {
        List<Account> lstAcc = [SELECT Name, Id, OwnerId, RecordType.DeveloperName FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Business'];

        List<User> manager = [SELECT Id FROM User WHERE Profile.Name='Manager' ];

        for(Account acc: lstAcc)
        {
            acc.OwnerId = manager[0].Id;
        }

        if(lstAcc.size()>0)
        {
            Update lstAcc;
        }
    }



    //UseCase 04
    public static void insertSeveralRecordIntoAccount()
    {
        List<Account> listAcc = new List<Account>();
        List<Contact> listCon = new List<Contact>();

        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

        for(Integer i=0; i<10; i++)
        {
            Account acc = new Account
            (
                RecordTypeId = recordTypeId,
                Name = 'Toto Polo'+ (i+1),
                BillingStreet = 'Royal Rd',
                BillingCity = 'Moka',
                BillingCountry = 'Mauritius',
                Phone = '985632145',
                Region__c = 'North'
            );

            listAcc.add(acc);

        }

        if (ListAcc.size()>0)
        {
            Insert ListAcc;
        }

        for(Account acc: listAcc)
        {
            Contact con = new Contact
            (
                AccountId = acc.Id,
                LastName = acc.Name,
                OtherStreet = acc.BillingStreet,
                OtherCity = acc.BillingCity,
                OtherCountry = acc.BillingCountry,
                Phone = acc.Phone    
            );
            listCon.add(con);
        }

        if(listCon.size()>0)
        {
            Insert (listCon);
        }
    }

    //UseCase 05

    
}