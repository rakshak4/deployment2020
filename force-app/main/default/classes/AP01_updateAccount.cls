/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
/**
 * @File Name          : AP01_updateAccount.cls
 * @Description        : Initialisation with VSCode
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0       19/10/22                    AGH       Initial Version
 **/
public with sharing class AP01_updateAccount {
  /**
   * @description Method to insert new records into account.
   * @author Asma Ghanty | 19/10/22
   * @return String The managed object's name.
   **/

  public static void updateAcct() {
    Account acct = new Account();
    acct.Name = 'Hans';
    acct.BillingStreet = 'Royal Rd';
    acct.BillingCity = 'Moka';
    acct.BillingCountry = 'Mauritius';
    acct.Phone = '985632145';
    acct.Region__c = 'East';
    insert acct;

    //System.debug('Asma Ghanty');
  }

  /**
   * @description Method to update the Phone number of the Account ID.
   * @author Asma Ghanty | 19/10/22
   * @return String Phone name.
   **/

  public static void updateAcctPhone() {
    Account acct = new Account();
    acct.Id = '0017S00000EkZRFQA3';
    acct.Phone = '3031234';

    update acct;
  }

  public static void deleteAccount() {
    Account acct = new Account();
    acct.Id = '0017S00000EkZRFQA3';

    delete acct;
  }

  /**
   * @description Method to display Account names where field Region = North.
   * @author Asma Ghanty | 19/10/22
   **/

  public static void displayAcctRegionNorth() {
    List<Account> acctList = [
      SELECT Name, Region__c
      FROM Account
      WHERE Region__c = 'North'
    ];

    for (Account acct : acctList) {
      System.debug(acct.Name);
    }
  }

  /**
   * @description Method to insert 10 Accounts for recordType Customer & insert a contact for each account.
   * @author Asma Ghanty | 19/10/22
   * @return String Region.
   **/

  public static void insertIntoIndividual() {
    List<Account> listIndividual = new List<Account>();
    List<Contact> listContact = new List<Contact>();
    Account acct = new Account();
    Contact con = new Contact();

    //fetching record type individual
    String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

    for (Integer i = 0; i<10; i++) {
      acct.Name = 'Aisha' + i;
      acct.BillingStreet = 'Royal Rd';
      acct.BillingCity = 'Moka';
      acct.BillingCountry = 'Mauritius';
      acct.Phone = '985632145';
      acct.Region__c = 'East';
      acct.RecordTypeId = recordTypeId;

      //acct.Address__c = con.OtherAddress;
      acct.Phone = con.Phone;
      listIndividual.add(acct);
    }
    if (listIndividual.size()>0) {
      insert listIndividual;
    }

    for (Account acc : listIndividual) {
      //Contact con = new Contact();
      con.AccountId = acc.Id;
      con.LastName = acc.Name;
      con.MailingStreet = acc.BillingStreet;
      con.MailingCity = acc.BillingCity;
      con.MailingCountry = acc.BillingCountry;
      con.Phone = acc.Phone;
    }

    if (listContact.size() > 0) {
      listContact.add(con);
    }
  }
}