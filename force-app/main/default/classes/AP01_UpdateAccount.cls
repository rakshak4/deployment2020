/**
 * @File Name          : <AP01_UpdateAccount>.cls
 * @Description        : <Class to update Account OBB>
 * @Author             : <Company Name>
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-24-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      <BDH>      Initial Version
**/
public with sharing class AP01_UpdateAccount {
    // public AP01_UpdateAccount() {


    // }

    /**
         * @description Method to identify the managed object.
         * @author Dhomah Bhoovanyu | 19/10/2022
         * @return String The managed object's name.
    **/
    public static void displayName(){
        System.debug('Bhoovanyu');
    }


    /**
     * @description Method to insert an account.
     * @author Dhomah Bhoovanyu | 26/08/2021
     * @return String The managed object's name.
    **/
    public static void insertAccount(){
        // insert an account
        Account acc = new Account(Name = 'Toto Polo',BillingStreet = 'Royal Rd',BillingCity = 'Moka',BillingCountry = 'Mauritius',Phone = '985632145',Region__c = 'East');

        insert acc;
        
    }

    /**
         * @description Method to identify the managed object.
         * @author Dhomah Bhoovanyu | 26/08/2021
         * @return String The managed object's name.
    **/
    public static void upsertAccount(){
        // insert an account
        Account acc = new Account();
        acc.Id = '0017S00000FWX9hQAH';
        acc.Name = 'Toto Polo';
        acc.BillingStreet = 'Royal Rd';
        acc.BillingCity = 'Moka';
        acc.BillingCountry = 'Mauritius';
        acc.Phone = '666666';
        acc.Region__c = 'North';

        // upsert acc Account.fields.Name; (Name should be an externalID(field type))

        upsert acc;
        
    }

    public static void updateAccount(){
        // insert an account
        Account acc = new Account();
        acc.Id = '0017S00000FWX9hQAH';
        acc.Name = 'Toto Polo';
        acc.BillingStreet = 'Royal Rd';
        acc.BillingCity = 'Moka';
        acc.BillingCountry = 'Mauritius';
        acc.Phone = '777777';
        acc.Region__c = 'North';

        update acc;
        
    }

    public static void deleteAcc(){
        Account acc = new Account(Id = '0017S00000FWX9hQAH');
        // acc.;
        delete acc;
    }


    /**
         * @description Method to get the name of all Accounts of region 'North'.
         * @author Dhomah Bhoovanyu | 19/10/2022
         * @return String The managed object's name.
    **/

    public static void getAccountName(){
        List<Account> lstAcc = [SELECT name FROM Account WHERE Region__c = 'North'];
        for(Account acc: lstAcc){
            System.debug(acc.Name);
        }
    }

    public static void createAccounts(){
        
        List <Account> LstAcc = new List<Account>();
        String RecordId=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();

        for(Integer i = 0 ; i<10; i++){
            Account acc = new Account();
            acc.Name = 'Toto Polo'+i;
            acc.BillingStreet = 'Royal Rd';
            acc.BillingCity = 'Moka';
            acc.BillingCountry = 'Mauritius';
            acc.Phone = '985632145';
            acc.Region__c = 'East';
            acc.RecordTypeId=RecordId;
            LstAcc.add(acc); 
        }
        if(LstAcc.size()>0){
            insert(LstAcc);

        }

        

        List <Contact> LstCon = new List<Contact>();
        For (Account acc: LstAcc){
            // String str = acc.Name;
            // List<Account> lstAcc1 = [SELECT Id FROM Account WHERE Name =:str ];
            Contact con = new Contact();
            con.MailingStreet='Royal Rd Moka Mauritius';
            con.Phone=acc.Phone;
            con.AccountId=acc.Id;
            con.FirstName='con';
            con.LastName='con';
            LstCon.add(con);

        }
        if(LstCon.size()>0){
            insert(LstCon);

        }
        

    }

    /**
         * @description Method that takes as inpit a string(Color) and 
         * query all vehicles whose color match the color passed as paranmeter.
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/

    public static void getVehicleByColour(String colour){

        String query = 'SELECT Make__c, Model__C, Mileage__c FROM Vehicle__c WHERE Colour__c = \"'+colour+'\"';
        // query=+(String)colour;
        List<Vehicle__c> lstVeh = Database.query(query);
        // List<Vehicle__c> LstVeh = [SELECT Make__c, Model__C, Mileage__c FROM Vehicle__c WHERE Colour__c=:colour];
        
        if(lstVeh.size()>0){
            for(Vehicle__c veh : lstVeh){
                System.debug(veh.Make__c);
                System.debug(veh.Model__c);
                System.debug(veh.Mileage__c);
            }
        }
    }
    /**
         * @description Method that
         * query all vehicles whose color match the color stored in a Set.
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void getVehicleByColourSets(){
        Set<String> setColours = new Set<String>{'White','Red'};
        List<Vehicle__c> LstVeh = [SELECT Make__c, Model__C, Mileage__c FROM Vehicle__c WHERE Colour__c IN:setColours];
        if(lstVeh.size()>0){
            for(Vehicle__c veh : lstVeh){
                System.debug(veh.Make__c);
                System.debug(veh.Model__c);
                System.debug(veh.Mileage__c);
            }
        }
    }

    /**
         * @description Method that initialise a map with sets of car registration number and make .
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void getcarModel(){
        Map<String, String> mapRegNumMake = new Map<String, String>();
        mapRegNumMake.put('12 JN 94','Toyota Glanza');
        mapRegNumMake.put('12 JN 95','Toyota Glanza2');
        mapRegNumMake.put('12 JN 96','Toyota Glanza3');

        //print the values
        System.debug('car make and reg : ' + mapRegNumMake.get('12 JN 94'));

        //print map size
        System.debug('Map size : ' + mapRegNumMake.size());


        Map<Integer, String> m1 = new Map<Integer, String>();
        m1.put(1, 'First item');
        m1.put(2, 'Second item');
        Map<Integer, String> m2 = new Map<Integer, String>(m1);
        // The map elements of m2 are copied from m1
        System.debug(m2);  
    }
    /**
         * @description Method that takes .
         * @author Dhomah Bhoovanyu | 20/10/2022
         * @return String The managed object's name.
    **/
    public static void getEmployeeNamesFromMap(){
        Map<String, List<String>> mapEmpName = new Map< String, List<String>>();
        List<String> lstNames= new List<String>{'name1','name2'};
        // lstNames.add('name3');
        // lstNames.add('name4');
        mapEmpName.put('Black',lstNames);

        mapEmpName.put('White',new List<String>{'name1','name2'});
        if(mapEmpName.containsKey('White')){
            System.debug(mapEmpName.get('White'));

        }
        
        // System.debug(mapEmpName);List<String> colors = new List<String>();
        System.debug('All Keys: '+mapEmpName.keySet());
        System.debug('All Values: '+mapEmpName.values());

        Integer numOfEmployees  = 0;
        for (String colour: mapEmpName.keySet()){
            numOfEmployees += mapEmpName.get(colour).size();//=+ overwrites numOfEmployees in previous iteration
        }
        System.debug('Number of employees: '+numOfEmployees);



//         Create a map to store country as Key and corresponding states as Values.
// United States -> Connecticut , Nebraska, New Jersey
// Germany -> Berlin, Hamburg

        Map<String,List<String>> mapCountryStates = new Map<String,List<String>>();
        mapCountryStates.put('United States', new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        mapCountryStates.put('Germany', new List<String>{'Berlin', 'Hamburg'});
        System.debug('aac '+mapCountryStates);


        //TODO
        // List<Account> lstAccount = new List<Account>();
        // String query = 'SELECT Name, Region__c FROM Account WHERE Region__c != null';
        
        // lstAccount= Database.query(query);
        // Map<String, List<Account>> mapRegionAccount = new Map<String, List<Account>>();

        // mapRegionAccount.put('North', new List<Account>());
        // mapRegionAccount.put('South', new List<Account>());
        // mapRegionAccount.put('East', new List<Account>());
        // mapRegionAccount.put('West', new List<Account>());

        // // String reg = lstAccount[0].Region__c;
        // // List<Account> lstAccount2 = new List<Account>();
        // for(Account acc : lstAccount){
        //     mapRegionAccount.get(acc.region__c).add(acc);
        // }
        // System.debug('North : '+mapRegionAccount.get('North'));
        // System.debug('East : '+mapRegionAccount.get('East'));
        // System.debug('num key: '+mapRegionAccount.keySize());


        List<Account> lstAccountNew = new List<Account>();
        String queryNew = 'SELECT Name, Region__c FROM Account WHERE Region__c != null ORDER BY Region__c DESC';
        lstAccountNew= Database.query(queryNew);
        System.debug('query result: '+lstAccountNew);

        Map<String, List<Account>> mapRegionAccountNew = new Map<String, List<Account>>();

        String reg = lstAccountNew[0].Region__c;
        System.debug('first region : '+reg);

        List<Account> lstAccount2 = new List<Account>();
        for(Account acc : lstAccountNew ){
            
            if(acc.Region__c != reg || acc == lstAccountNew[lstAccountNew.size()-1]){
                mapRegionAccountNew.put(reg, lstAccount2);
                reg = acc.Region__c;
                lstAccount2 = new List<Account>();
            }
            lstAccount2.add(acc);
        }
        System.debug('North : '+mapRegionAccountNew.get('North'));
        System.debug('South: '+mapRegionAccountNew.get('South'));
        System.debug('East : '+mapRegionAccountNew.get('East'));
        System.debug('West : '+mapRegionAccountNew.get('West'));


        /**
         * version 3
         */
        Map<String,List<Account>> mapAccount = new Map<String,List<Account>>();
        List<Account> lstacc = [SELECT Region__c,Name, Id FROM Account WHERE Region__c != Null];
        for(Account acc: lstacc){
            if(mapAccount.containsKey(acc.Region__c)){
                mapAccount.get(acc.Region__c).add(acc);
            }
            else{
                mapAccount.put(acc.region__c, new List<Account>{acc});
            }
        }
        System.debug('Map Account: '+ mapAccount);
    }

    public static void deleteAccCon(){

        Account acc = new Account(Id = '0017S00000FWX9hQAH');
        // List<Account> lstacc = [SELECT Id FROM Account WHERE ActivationDate__c = System.today()];
        // acc.;
        delete acc;

    }
    public static void findDamagedVeh(){
        List<Case> lstVeh = [SELECT DamagedVehicle__r.Make__c, DamageType__c FROM Case WHERE DamageType__c != NULL ORDER BY DamageType__c ];
        for(Integer i=0; i< lstVeh.size(); i++){
            System.debug(lstVeh[i]);
        }

    }

    public static void findAccWithCse(){
        String RecordIdIndividual=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String RecordIdBusiness=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        

        List<Case> lstAcc = [SELECT Account.Name, Account.RecordTypeId FROM Case];

        Map<String,List<String>> mapAcc = new Map<String,List<String>>();

        // mapAcc.put('RecordIdIndividual', new List<String>());
        // mapAcc.put('RecordIdBusiness', new List<String>());
        // List<String> str = [SELECT Account.Name, Account.RecordTypeId FROM Case];

        for(Case cse: lstAcc){
            // System.debug(cse.Account.Name);
            if(mapAcc.containsKey(cse.Account.RecordTypeId)){
                mapAcc.get(cse.Account.RecordTypeId).add(cse.Account.Name);
            }
            else{
                mapAcc.put(cse.Account.RecordTypeId, new List<String>{cse.Account.Name});
            }


        }
        System.debug(mapAcc);
        
    }




    


}