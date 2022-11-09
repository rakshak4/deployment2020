/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 10-25-2022
 * @last modified by  : Jason Ramjaya
**/
public with sharing class AP02_ApexBasicsAndDatabase {
    /**
   * @description Method to implement use case 1
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void useCase1() {
    List<Case> lstCase = [
      SELECT DamageType__c, LoanedVehicle__c, LoanedVehicle__r.Name
      FROM Case
      WHERE DamageType__c != NULL
      ORDER BY DamageType__c
    ];

    //print name
    System.debug('Vehicles list: ' + lstCase);
  }

  /**
   * @description Method to implement use case 2
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void useCase2() {
    List<Account> lstAcc = [
      SELECT Name, RecordType.DeveloperName
      FROM Account
      WHERE
        Id IN (SELECT AccountId FROM Case)
        AND RecordType.DeveloperName != NULL
      LIMIT 200
    ];

    Map<String, List<Account>> mapAccounts = new Map<String, List<Account>>();

    if (lstAcc.size() > 0) {
      for (Account acc : lstAcc) {
        if (!mapAccounts.containsKey(acc.RecordType.DeveloperName)) {
          mapAccounts.put(acc.RecordType.DeveloperName, new List<Account>());
        }

        mapAccounts.get(acc.RecordType.DeveloperName).add(acc);
      }
      System.debug(mapAccounts);
    }
  }

  /**
   * @description Method to insert 10 accounts in the database
   * @author Jason Ramjaya | 19/10/2022
   * @return None
   **/
  public static void insertListAccount() {
    List<Account> lstAccsToInsert = new List<Account>();
    List<Contact> lstConsToInsert = new List<Contact>();
    String phoneNumber = '2345678';
    String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName()
      .get('Individual')
      .getRecordTypeId();

    for (Integer i = 0; i < 10; i++) {
      Account acc = new Account();

      acc.Name = 'AutoGenAccount' + i;
      acc.Region__c = 'West';
      acc.Phone = phoneNumber;
      acc.BillingStreet = 'Royal Rd';
      acc.BillingCity = 'Moka';
      acc.BillingCountry = 'Mauritius';
      acc.RecordTypeId = recordTypeId;

      lstAccsToInsert.add(acc);
    }
    if (lstAccsToInsert.size() > 0) {
      insert lstAccsToInsert;
    }

    for (Account acc : lstAccsToInsert) {
      Contact con = new Contact();

      con.LastName = 'Your name';
      con.Phone = phoneNumber;
      con.MailingStreet = acc.BillingStreet;
      con.MailingCity = acc.BillingCity;
      con.MailingCountry = acc.BillingCountry;
      con.AccountId = acc.Id;
      lstConsToInsert.add(con);
    }

    if (lstConsToInsert.size() > 0) {
      insert lstConsToInsert;
    }
  }

  /**
   * @description Method to implement use case 3
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void useCase3() {
    List<Account> lstAcc = [
      SELECT OwnerId, (SELECT OwnerId FROM Contacts)
      FROM Account
      WHERE Region__c = 'North' AND RecordType.DeveloperName = 'Individual'
    ];

    List<Contact> lstCon = [
      SELECT OwnerId
      FROM Contact
      WHERE
        Account.Region__c = 'North'
        AND Account.RecordType.DeveloperName = 'Individual'
    ];

    List<User> lstUser = [SELECT Id FROM USER WHERE Profile.Name = 'Manager'];

    if (lstAcc.size() > 0 && lstUser.size() > 0) {
      for (Account acc : lstAcc) {
        acc.OwnerId = lstUser[0].Id;
      }
      update lstAcc;
    }

    if (lstCon.size() > 0 && lstUser.size() > 0) {
      for (Contact con : lstCon) {
        con.OwnerId = lstUser[0].Id;
      }
      update lstCon;
    }
  }

  /**
   * @description Method to implement use case 5
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void useCase5() {
    List<Account> lstAccToDelete = [
      SELECT Id, Name
      FROM Account
      WHERE CreatedDate = TODAY
    ];
    if (lstAccToDelete.size() > 0)
      delete lstAccToDelete;

    List<Contact> lstConToDelete = [
      SELECT Id, Name
      FROM Contact
      WHERE CreatedDate = TODAY
    ];
    if (lstConToDelete.size() > 0)
      delete lstConToDelete;
  }
}