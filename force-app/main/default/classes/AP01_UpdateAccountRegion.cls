/**
 * @File Name          : AP01_UpdateAccountRegion.cls
 * @Description        : Initialize with VSCode
 * @Author             : Spoon Consulting Limited
 * @Group              :
 * @Last Modified By   : Jason Ramjaya
 * @Last Modified On   : 10-25-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-10-2022      JRA      Initial Version
 **/

public with sharing class AP01_UpdateAccountRegion {
  /**
   * @description Method to output a message
   * @author Jason Ramjaya | 19/10/2022
   * @return None
   **/
  public static void notHelloWorld() {
    Account acc = new Account();
    acc.Name = 'Toto Polo';
    acc.Phone = '985632145';
    acc.BillingStreet = 'Royal Rd';
    acc.BillingCity = 'Moka';
    acc.BillingCountry = 'Mauritius';
    acc.Region__c = 'East';
    insert acc;
  }

  /**
   * @description Method to update account
   * @author Jason Ramjaya | 19/10/2022
   * @return None
   **/
  public static void updateAccount() {
    Account acc = new Account(Id = '0017S00000FWX8AQAX', Phone = '14736587');
    update acc;
  }

  /**
   * @description Method to delete account
   * @author Jason Ramjaya | 19/10/2022
   * @return None
   **/
  public static void deleteAccount() {
    Account acc = new Account(Id = '0017S00000FWX8AQAX');
    delete acc;
  }

  /**
   * @description Method to output account with region north
   * @author Jason Ramjaya | 19/10/2022
   * @return None
   **/
  public static void northRegionAccount() {
    List<Account> lstAccs = [
      SELECT Name
      FROM Account
      WHERE Region__c = 'North'
    ];

    for (Account acc : lstAccs) {
      System.debug(acc.Name);
    }
  }

  /**
   * @description Method to query vehicles matching given colour
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void queryVehicleOfColour(String color) {
    List<Vehicles__c> lstVeh = [
      SELECT Make__c, Model__c, Mileage__c
      FROM Vehicles__c
      WHERE Colour__c = :color
    ];

    if (lstVeh.size() > 0) {
      for (Vehicles__c veh : lstVeh) {
        System.debug(veh);
      }
    }
  }

  /**
   * @description Method to update Vehicles to colour specified
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void updateVehicleColourToWhite() {
    Schema.DescribeFieldResult objFieldDescribe = Vehicles__c.Colour__c.getDescribe();
    List<Schema.PicklistEntry> lstPickListValues = objFieldDescribe.getPickListValues();

    List<Vehicles__c> lstVeh = [
      SELECT Colour__c, InsuredTo__c
      FROM Vehicles__c
      LIMIT 200
    ];

    Integer indexSizeOfList = lstPickListValues.size() - 1;

    for (Vehicles__c veh : lstVeh) {
      Integer randomIndex = Integer.valueOf(indexSizeOfList * Math.random());
      veh.Colour__c = lstPickListValues[randomIndex].getValue();
      if (veh.InsuredTo__c == null) {
        veh.InsuredTo__c = '0017S00000FWYhsQAH';
      }
    }

    update lstVeh;
  }

  /**
   * @description Method to query vehicles matching given colour from set
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void queryVehicleinSetColour() {
    Set<String> setColour = new Set<String>{ 'White', 'Red' };
    List<Vehicles__c> lstVeh = [
      SELECT Make__c, Model__c, YearOfVehicle__c
      FROM Vehicles__c
      WHERE Colour__c IN :setColour
    ];

    if (lstVeh.size() > 0) {
      for (Vehicles__c veh : lstVeh) {
        System.debug(veh);
      }
    }
  }

  /**
   * @description Method to manipulate map
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void testMap() {
    Map<String, String> mapRegNumMake = new Map<String, String>();

    //add items
    mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
    mapRegNumMake.put('78 OC 98', 'Toyota Supra');
    mapRegNumMake.put('1 JN 22', 'BMW X6 M');
    mapRegNumMake.put('678 DC 00', 'Honda Civic EK3');

    if (mapRegNumMake.size() > 0) {
      //print the values
      System.debug('My Cars and their make: mapRegNumMake: ' + mapRegNumMake);

      //print map size
      System.debug('Map Size: mapRegNumMake: ' + mapRegNumMake.size());
    }
  }

  /**
   * @description Method map list of employees to colour of their clothes
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void mapClothesToEmployees() {
    Map<String, List<String>> mapClothesOfEmployees = new Map<String, List<String>>();

    // List<String> lstEmployees1 = new List<String>{'Ashita1', 'Deekshita1', 'Fad1'};
    // List<String> lstEmployees2 = new List<String>{'Ashita2', 'Deekshita2', 'Fad2'};
    // List<String> lstEmployees3 = new List<String>{'Ashita3', 'Deekshita3', 'Fad3'};

    mapClothesOfEmployees.put(
      'Red',
      new List<String>{ 'Ashita1', 'Deekshita1', 'Fad1' }
    );
    mapClothesOfEmployees.put(
      'White',
      new List<String>{ 'Ashita2', 'Deekshita2', 'Fad2' }
    );
    mapClothesOfEmployees.put(
      'Yellow',
      new List<String>{ 'Ashita3', 'Deekshita3', 'Fad3' }
    );

    if (mapClothesOfEmployees.size() > 0) {
      System.debug(
        'Colour and their list of employees: ' + mapClothesOfEmployees
      );
      System.debug(
        'Size of map of clothes to list of employees: ' +
        mapClothesOfEmployees.size()
      );
      System.debug('Different colors: ' + mapClothesOfEmployees.keySet());
      System.debug(
        'ALL SUPER HAPPY employee names: ' + mapClothesOfEmployees.Values()
      );

      for (String key : mapClothesOfEmployees.keySet()) {
        //if(mapClothesOfEmployees.containsKey(key))
        System.debug(
          'Happy employees wearing ' +
          key +
          ' colour: ' +
          mapClothesOfEmployees.get(key)
        );
      }
    }

    Integer numOfEmployees = 0;

    for (String colour : mapClothesOfEmployees.keySet()) {
      numOfEmployees += mapClothesOfEmployees.get(colour).size();
    }

    System.debug('Number of extremely happy employees: ' + numOfEmployees);
  }

  /**
   * @description Method to query account where region is null
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void queryAccountRegionNotNull() {
    System.debug('AP01_UpdateAccountRegion: queryAccountRegionNotNull START');
    //Map to map list of accounts to region
    Map<String, List<Account>> mapRegionAccount = new Map<String, List<Account>>();

    //Retrieve account where region is not null and add to a list
    List<Account> lstAcc = [
      SELECT Region__c
      FROM Account
      WHERE Region__c != NULL
      LIMIT 200
    ];
    System.debug('Size of account list retrieved: ' + lstAcc.size());

    if (lstAcc.size() > 0) {
      for (Account acc : lstAcc) {
        //create key mapping to list if it is not existant
        if (!mapRegionAccount.containsKey(acc.Region__c)) {
          mapRegionAccount.put(acc.Region__c, new List<Account>());
        }
        //all account is added to the list after verifying that the key exist
        mapRegionAccount.get(acc.Region__c).add(acc);
      }
      //splitting the display into the 4 regions
      for (String region : mapRegionAccount.keySet()) {
        System.debug(mapRegionAccount.get(region));
      }
    }
  }

  /**
   * @description Method to create a map to store country as Key and corresponding states as Values.
   * @author Jason Ramjaya | 20/10/2022
   * @return None
   **/
  public static void countryKeysStatesValues() {
    Map<String, List<String>> mapCountryStates = new Map<String, List<String>>();

    mapCountryStates.put(
      'United States',
      new List<String>{ 'Connecticut', 'Nebraska', 'New Jersey' }
    );
    mapCountryStates.put('Germany', new List<String>{ 'Berlin', 'Hamburg' });

    System.debug('Map: ' + mapCountryStates);
  }

  
}