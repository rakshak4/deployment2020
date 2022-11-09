/**
 * @File Name          : AP01_UpdateAccount.cls
 * @Description        : Initialisation with VS Code
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : CBO
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0         19-10-2022               CBO         Initial Version
**/

public with sharing class AP01_UpdateAccount {

    /**
     * @description Method to display name.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void displayName() {
        System.debug('Chavis');
    }

    /**
     * @description Method to create an account.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void createAccount() {
        Account acct = new Account();
        acct.Name = 'Acme';
        acct.Phone = '(415)555-1212';
        acct.Region__c = 'North';
        acct.BillingStreet = 'aaa';

        insert acct;
    }

    /**
     * @description Method to update an account.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void updateAccount() {
        Account acct = new Account();
        acct.Id = '0017S00000FWJa4QAH';
        acct.Name = 'WWWWW';
        acct.Phone = '5467';

        update acct;
    }

    /**
     * @description Method to delete an account.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void deleteAccount() {
        Account acct = new Account();
        acct.Id = '0017S00000FWJa4QAH';

        delete acct;
    }

    /**
     * @description Method to fetch and display contacts with region North.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void displayContactsNorth() {
        List<Contact> lstCon = [SELECT FirstName, LastName from Contact WHERE Account.Region__c = 'North'];
        for (Contact con : lstCon) {
            System.debug(con.FirstName + ' ' + con.LastName);
        }
    }

    /**
     * @description Method to insert 10 accounts.
     * @author Chevish Boodhun | 19/10/2022
     **/

    public static void insertMultipleAccounts() {
        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        List<Account> lstAcc = new List<Account>();
        for (Integer i=0; i<10; i++) {
            Account acc = new Account(
                RecordTypeId = recordTypeId,
                Name = 'TestAcc ' + i,
                Phone = i+'',
                BillingStreet = 'llll',
                Region__c = 'South'
            );
            lstAcc.add(acc);
        }
        insert lstAcc;

        List<Contact> lstCon = new List<Contact>();
        for (Integer i=0; i<lstAcc.size(); i++) {
            Contact con = new Contact(
                AccountId = lstAcc[i].Id,
                FirstName = 'ConFName ' + i,
                LastName = 'ConLName ' + i,
                Phone = lstAcc[i].Phone,
                MailingStreet = lstAcc[i].BillingStreet
            );
            lstCon.add(con);
        }
        insert lstCon;

    }

    /**
     * @description Method to fetch vehicles based on color.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void fetchVehicleByColor(String color) {

        List<Vehicle__c> lstVeh = [SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c =: color];
        
        if (lstVeh.size() > 0) {
            System.debug(lstVeh);
        }

    }

    /**
     * @description Method to fetch vehicles matching two colors.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void fetchVehicleByTwoColor(String color1, String color2) {

        Set<String> setColors = new Set<String>();
        setColors.add(color1);
        setColors.add(color2);
        
        List<Vehicle__c> lstVeh = [SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c IN :setColors];
        
        if (lstVeh.size() > 0) {
            System.debug(lstVeh);
        }

    }

    /**
     * @description Method - Map example.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void mapExample() {

        Map<String, String> mapRegNumMake = new Map<String, String>();

        //add items
        mapRegNumMake.put('11 JN 99', 'Toyota Glanza');
        mapRegNumMake.put('23 OC 78', 'Toyota Supra');
        mapRegNumMake.put('67 JN 80', 'BMW X6 M');
        mapRegNumMake.put('34 DC 89', 'Honda Civic EK3');

        //print the values
        System.debug('My cars and their make: mapRegNumMake: ' + mapRegNumMake);

        //print the map size
        System.debug('Map Size: mapRegNumMake: ' + mapRegNumMake.size());

    }

    /**
     * @description Method - Map example 2.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void mapExample2() {

        Map<String, List<String>> mapClothesColorEmployee = new Map<String, List<String>>();

        List<String> lstWhite = new List<String>{'aaa, bbb, ccc'};
        List<String> lstBlack = new List<String>{'eee, fff, nnn'};
        List<String> lstBlue = new List<String>{'lll, ppp, ooo'};

        mapClothesColorEmployee.put('White', lstWhite);
        mapClothesColorEmployee.put('Black', lstBlack);
        mapClothesColorEmployee.put('Blue', lstBlue);

        // if (mapClothesColorEmployee.containsKey('White')) {
        //     System.debug('Happy employees wearing White : ' + mapClothesColorEmployee.get('White'));
        // }
        // if (mapClothesColorEmployee.containsKey('Black')) {
        //     System.debug('Happy employees wearing Black : ' + mapClothesColorEmployee.get('Black'));
        // }
        // if (mapClothesColorEmployee.containsKey('Blue')) {
        //     System.debug('Happy employees wearing Blue : ' + mapClothesColorEmployee.get('Blue'));
        // }

        for (String key : mapClothesColorEmployee.keySet()) {
            System.debug('Happy employees wearing ' + key + ' : ' + mapClothesColorEmployee.get(key));
        }

        System.debug('Different colors: ' + mapClothesColorEmployee.keySet());
        System.debug('All SUPER HAPPY employee names: ' + mapClothesColorEmployee.values());

        Integer numOfEmployees = 0;
        for (String colour : mapClothesColorEmployee.keySet()) {
            numOfEmployees += mapClothesColorEmployee.get(colour).size();
            System.debug(mapClothesColorEmployee.get(colour).size());
        }
        System.debug('Number of extremely happy employees: ' + numOfEmployees);

    }

    /**
     * @description Method - Map example 2.5.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void mapExample2_5() {

        Map<String, List<String>> mapCountryStates = new Map<String, List<String>>();
        mapCountryStates.put('United States', new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        mapCountryStates.put('Germany', new List<String>{'Berlin', 'Hamburg'});

        System.debug(mapCountryStates);

    }

    /**
     * @description Method - Map example 3.
     * @author Chevish Boodhun | 20/10/2022
     **/

    public static void mapExample3() {

        List<Account> lstAcc = [SELECT Name, Region__c FROM Account WHERE Region__c != null];
        Map<String, List<Account>> mapAccountRegion = new Map<String, List<Account>>();

        for (Account acc : lstAcc) {
            if (!mapAccountRegion.containsKey(acc.Region__c)) {
                mapAccountRegion.put(acc.Region__c, new List<Account>());
            }
            mapAccountRegion.get(acc.Region__c).add(acc);
        }

        System.debug(mapAccountRegion);

    }
    
}