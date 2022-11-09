/**
 * @File Name          : <AP01_UpdateAccount>.cls
 * @Description        : <initialisation with VS code>
 * @Author             : <Spoon Consulting>
 * @Group              :
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-21-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-10-2022, HH:MM:SS      <SJO>      Initial Version
 **/

public with sharing class AP01_UpdateAccount {
  /**
   * @description Method to identify the managed object.
   * @author Rakshak Rajjoo | 26/08/2021
   * @return String The managed object's name.
   **/
  public static void UpdateAcc() {
    Account acct = new Account();
    acct.Name = 'Toto Polo';
    acct.BillingStreet = 'Royal Rd';
    acct.BillingCity = 'Moka';
    acct.BillingCountry = 'Mauritius';
    acct.Phone = '985632145';
    acct.Region__c = 'East';

    insert acct;
  }

  public static void UpdatePhoneInAccount() {
    Account acct = new Account();
    acct.id = '0017S00000GGSHTQA5';
    acct.Phone = '1234567890';

    update acct;
  }

  public static void DeleteRecordInAccount() {
    Account acct = new Account();
    acct.id = '0017S00000GGSHTQA5';

    delete acct;
  }

  public static void DisplayName() {
    List<Account> lstAccountNames = [
      SELECT name
      FROM Account
      WHERE Region__c = 'North'
    ];
    for (Account acc : lstAccountNames) {
      System.debug(acc.name);
    }
  }

  public static void addMultipleAccounts() {
    List<Account> lstMutilpleAccounts = new List<Account>();

    String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName()
      .get('Individual')
      .getRecordTypeId();

    for (Integer i = 0; i < 10; i++) {
      Account acct1 = new Account();
      acct1.RecordTypeId = recordTypeId;
      acct1.name = 'abc' + i;
      acct1.BillingStreet = 'Rosehill';
      acct1.region__c = 'East';
      lstMutilpleAccounts.add(acct1);
    }

    if (!lstMutilpleAccounts.isEmpty()) {
      insert lstMutilpleAccounts;
    }

    List<Contact> lstMutilpleContacts = new List<Contact>();

    for (Account acct12 : lstMutilpleAccounts) {
      Contact con = new Contact();
      con.AccountId = acct12.Id;
      con.LastName = 'Sou';
      con.mailingStreet = 'q.b';
      con.phone = '1245';
      lstMutilpleContacts.add(con);
    }

    if (!lstMutilpleContacts.isEmpty()) {
      insert lstMutilpleContacts;
    }
  }

  public static void getVehicle(String Color) {
    List<Vehicle__c> lstVeh = [
      SELECT Make__c, Model__c, Mileage__c
      FROM Vehicle__c
      WHERE Color__c = :Color
    ];

    if (!lstVeh.isEmpty()) {
      System.debug(lstVeh);
    }
  }

  public static void getVehicleWithColor() {
    Set<String> set1 = new Set<String>{ 'White', 'Blue' };

    List<Vehicle__c> lstVeh2 = [
      SELECT Make__c, Model__c, Mileage__c
      FROM Vehicle__c
      WHERE Color__c IN :set1
    ];

    if (!lstVeh2.isEmpty()) {
      System.debug(lstVeh2);
    }
  }

  public static void mapReg() {
    Map<String, String> mapRegNumMake = new Map<String, String>();

    // add items
    mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
    mapRegNumMake.put('78 OC 98', 'Toyota Supra');
    mapRegNumMake.put('1 JN 22', 'BMW X6 M');
    mapRegNumMake.put('678 DC 00', 'Honda Civic Ek3');

    // Print Values
    System.debug('My cars and their make: mapRegNumMake: ' + mapRegNumMake);

    // print map size
    System.debug('Map Size: mapRegNumMake: ' + mapRegNumMake.size());
  }

  public static void mapClothes() {
    List<String> lstString1 = new List<String>();
    List<String> lstString2 = new List<String>();
    List<String> lstString3 = new List<String>();
    List<String> lstString4 = new List<String>();
    List<String> lstString5 = new List<String>();
    lstString1.add('Sou');
    lstString2.add('Narmeen');
    lstString3.add('Bhavish');
    lstString4.add('Yaseen');
    lstString5.add('Salma');

    Map<string, List<String>> strMap = new Map<string, List<String>>();
    strMap.put('ID1', lstString1);
    strMap.put('ID2', lstString2);
    strMap.put('ID3', lstString3);
    strMap.put('ID4', lstString4);
    strMap.put('ID5', lstString5);

    // Print Values
    System.debug('My Happy Client: strMap: ' + strMap);

    if (strMap.containsKey('ID2')) {
      // Checking if the key is available
      System.debug(
        'Happy Employees Wearing X color: strMap: ' + strMap.get('ID2')
      );
    }

    if (strMap.containsKey('ID4')) {
      System.debug(
        'Happy Employees Wearing X color: strMap: ' + strMap.get('ID4')
      );
    }

    // Printing all different key
    System.debug('All different Keys' + strMap.keySet());

    // print all values
    System.debug('All different Values' + strMap.values());

    // Find total number of employees contained in thr map

    Integer numOfemployees = 0;

    for (String color : strMap.keySet()) {
      // mapColorEmployee.get(color) return list of employess wearing color x

      numOfemployees += strMap.get(color).Size();
    }
    System.debug('Number oif employess ' + numOfEmployees);

    // print map size
    System.debug('Map Size: strMap: ' + strMap.size());
  }

  public static void createMap() {
    List<String> lstState1 = new List<String>();
    List<String> lstState2 = new List<String>();
    lstState1.add('Connecticut');
    lstState1.add('Nebraska');
    lstState1.add('New Jersey');

    lstState2.add('Berlin');
    lstState2.add('Hamburg');

    Map<string, List<String>> mapCountryStates = new Map<string, List<String>>();
    mapCountryStates.put('United States', lstState1);
    mapCountryStates.put('Germany', lstState2);

    // Print Values

    System.debug(
      'Country and their states: :mapCountryStates ' + mapCountryStates
    );
  }

  /*
 
 Query all accoounts where Region is not Null
 Build a map of region and list of accounts
 Output map
 */
  /*
        public static void Ex3(){
            List<Account> lstAcc3= [SELECT Id, Name, region__c FROM Account WHERE Region__c != NULL];
            Map <string,List<Account>> mapEx3 = new Map <string,List<Account>>();
            for(Account acc3 : lstAcc3 ){
                
                if(acc3.Region__c == 'North'){
                   if(mapEx3.containsKey('North')){

                        mapEx3
                   }
                    List<Account> lstNewAccN = new List<Account>(); 
                    lstNewAccN.add(acc3);
                    mapEx3.put('North', lstNewAccN);
                }
                
                if(acc3.Region__c == 'South'){
                    List<Account> lstNewAccS = new List<Account>(); 
                    lstNewAccS.add(acc3);
                    mapEx3.put('South', lstNewAccS);
                }

                if(acc3.Region__c == 'East'){
                    List<Account> lstNewAccE = new List<Account>(); 
                    lstNewAccE.add(acc3);
                    mapEx3.put('East', lstNewAccE);
                }

                if(acc3.Region__c == 'West'){
                    List<Account> lstNewAccW = new List<Account>(); 
                    lstNewAccW.add(acc3);
                    mapEx3.put('West', lstNewAccW);
                }
                

            }

            System.debug('Account with specifc region:  ' + mapEx3); 
            
} */

  public static void Ex3Optimised() {
    List<Account> lstAccounts = [
      SELECT Id, Region__c
      FROM Account
      WHERE Region__c != NULL
    ];

    Map<String, List<Account>> mapRegionAccount = new Map<String, List<Account>>();

    for (Account acc : lstAccounts) {
      if (mapRegionAccount.containsKey(acc.Region__c)) {
        mapRegionAccount.get(acc.Region__c).add(acc);
      } else {
        mapRegionAccount.put(acc.Region__c, new List<Account>{ acc });
      }
    }
    System.debug('Account with specifc regions:' + mapRegionAccount);
  }

  /*
public static void getDamageVehicles(){
    List<Case> lstDamageVeh = new List<Case>([SELECT Vehicle__c, DamageType__c FROM Case WHERE DamageType__c!=NULL ORDER BY DamageType__c]);
    Map<String, List<Case>> mapDamagedVeh = new Map<String, List<Case>>();

    for (Case cse: lstDamageVeh){
        if(mapDamagedVeh.containsKey(cse.DamageType__c)){
            mapDamagedVeh.get(cse.DamageType__c).add(cse);
        }
        else{
            mapDamagedVeh.put(cse.DamageType__c, new List<Case>{cse});
        }
        
    }
    System.debug('List of damaged vehicles:' +lstDamageVeh);
}
*/

  public static void getDamageVehicles() {
    List<Case> lstDamageVeh = [
      SELECT Vehicle__c, DamageType__c
      FROM Case
      WHERE DamageType__c != NULL
      ORDER BY DamageType__c
    ];

    System.debug(lstDamageVeh);
  }

  public static void accountWithCase() {
    List<Case> lstCse = [SELECT AccountId FROM Case WHERE AccountId != NULL];
    Set<String> setAccountId = new Set<String>();

    for (Case cse : lstCse) {
      setAccountId.add(cse.AccountId);
    }

    List<Account> lstAcc4 = [
      SELECT Name, RecordTypeId, RecordType.DeveloperName
      FROM Account
      WHERE Id IN :setAccountId AND RecordTypeId != NULL
    ];
    Map<String, List<Account>> mapAccount = new Map<String, List<Account>>();
    for (Account Acc7 : lstAcc4) {
        System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
        if (mapAccount.containsKey(Acc7.RecordTypeId)) {
            mapAccount.get(Acc7.RecordTypeId).add(Acc7);
            System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
        } else {
          System.debug('>>>> acc4: ' + acc7.RecordType.DeveloperName);
        mapAccount.put(Acc7.RecordTypeId, new List<Account>{ Acc7 });
      }
    }
    System.debug('Map Account: ' + mapAccount);
  }
}