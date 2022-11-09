/**
 * @File Name          : <AP01_UpdateAccount>.cls
 * @Description        : <Initialisation with VS code>
 * @Author             : <ARU> {Spoon Consulting}
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19-OCT-2022      <ARU>      Initial Version
**/
public with sharing class AP01_UpdateAccount {

/**
     * @description Method to identify the managed object.
     * @author Ayman Rummun | 19/10/2021
     * @return void
     **/

    public static void InsertDataIntoAccount()
    {

        Account acc = new Account(
        Name = 'Toto Polo',
        BillingStreet = 'Royal Rd',
        BillingCity = 'Moka',
        BillingCountry = 'Mauritius',
        Phone = '985632145',
        Region__c = 'East');

        Insert acc;
    }

/**
     * @description Method to update the phone field in account object.
     * @author Ayman Rummun | 19/10/2021
     * @return void
     **/

    public static void updatePhoneFieldInAccount()
    {
        Account acc = new Account(Id= '0014H00004CLvLSQA1', Phone = '57758467');
        Update acc;
    }

/**
     * @description Method to delete a record in account object.
     * @author Ayman Rummun | 19/10/2021
     * @return void
     **/

    public static void deleteAccount()
    {
        Account acc = new Account(Id= '0014H00004CLvLSQA1');
        Delete acc;
    }

/**
     * @description Method to get all account where region equal North.
     * @author Ayman Rummun | 19/10/2021
     * @return void
     **/

    public static void allAccountWithRegionNorth()
    {
        List<Account> lstAcc =[SELECT Name FROM Account WHERE Region__c = 'North'];

        for(Account acc: lstAcc)
        {
            System.debug(acc.Name);
        }
    }
/**
     * @description Method to insert records in Object Account.
     * @author Ayman Rummun | 19/10/2021
     * @return void
     **/

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

    public static void getVehicleWithSpecificColor(String colour)
    {

        List<Vehicle__c> vehLst = [SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c =: colour];

        for(Vehicle__c veh: vehLst)
        {
            System.debug(veh);
        }

    }

    public static void getVehicleWithSpecificColorsUsingSet()
    {
        Set<String> setOfColours = new Set<String>{'Black', 'White'};

        List<Vehicle__c> vehLst = [SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c IN: setOfColours];

        for(Vehicle__c veh: vehLst)
        {
            System.debug(veh);
        }
    }

    public static void usingMap()
    {
        Map<String,String> mapRegNumMake = new Map<String,String>();

        mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
        mapRegNumMake.put('78 OC 98', 'Toyota Supra');

        System.debug('My Cars and their make: mapRegNumMake: ' + mapRegNumMake);
        System.debug('Map Size: mapRegNumMake: ' + mapRegNumMake.size());
    }

    public static void usingMapToGetEmployeesWithASpecificColourClothes()
    {
        Map<String, List<String>> mapLstOfEmployeesWithSpecificClothColour = new Map<String, List<String>>();

        mapLstOfEmployeesWithSpecificClothColour.put('Black', new list<String>{'Tom', 'Sam', 'Sara', 'John'});
        mapLstOfEmployeesWithSpecificClothColour.put('White', new list<String>{'Danny', 'Johnny'});
    

        System.debug('Cloth Colour and Employee: mapLstOfEmployeesWithSpecificClothColour: ' + mapLstOfEmployeesWithSpecificClothColour);
        System.debug('Map Size: mapLstOfEmployeesWithSpecificClothColour: ' + mapLstOfEmployeesWithSpecificClothColour.size());
        
        //get all employees wearing black clothes
        if(mapLstOfEmployeesWithSpecificClothColour.containsKey('Black'))
        {
            System.debug('Happy Employees wearing Black colour: ' + mapLstOfEmployeesWithSpecificClothColour.get('Black'));
        } 

        //get all employees wearing white clothes
        if(mapLstOfEmployeesWithSpecificClothColour.containsKey('White'))
        {
            System.debug('Happy Employees wearing White colour: ' + mapLstOfEmployeesWithSpecificClothColour.get('White'));
        }

        //print all key in a map
        System.debug('Different Colours: ' + mapLstOfEmployeesWithSpecificClothColour.keySet());

        //print all value in a map
        System.debug('All SUPER HAPPY employee names: ' + mapLstOfEmployeesWithSpecificClothColour.values());


        Integer numOfEmp = 0;

        for(String colour: mapLstOfEmployeesWithSpecificClothColour.keySet())
        {
            //mapLstOfEmployeesWithSpecificClothColour.get(colour) returns list of employees wearing colour x
            numOfEmp += mapLstOfEmployeesWithSpecificClothColour.get(colour).size();
        }

        System.debug('Number of employees: '+ numOfEmp);
    }

    /*Create a map to store country as Key and corresponding states as Values.
    United States -> Connecticut , Nebraska, New Jersey
    Germany -> Berlin, Hamburg*/

    public static void mapOfCoutriesWithTheirStates()
    {
        Map<String, List<String>> mapCoutriesWithTheirStates = new Map <String, List<String>>();

        mapCoutriesWithTheirStates.put('United States', new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        mapCoutriesWithTheirStates.put('Germany', new List<String>{'Berlin' , 'Hamburg'});

        if(mapCoutriesWithTheirStates.containsKey('United States'))
        {
            System.debug('States in United States: '+ mapCoutriesWithTheirStates.get('United States'));
        }


        if(mapCoutriesWithTheirStates.containsKey('Germany'))
        {
            System.debug('States in Germany: '+ mapCoutriesWithTheirStates.get('Germany'));
        }
    }

    

    public static void getAllAccountWhereRegionIsNotNull()
    {
        List<Account> lstAcc = [SELECT Name, Region__c FROM Account WHERE Region__c != NULL];

        Map<String, List<Account>> mapAccountWithRegion = new Map<String, List<Account>>();

        for(Account acc: lstAcc)
        {
            if(acc.Region__c == 'East')
            {
                if(mapAccountWithRegion.containsKey('East'))
                {
                    mapAccountWithRegion.get('East').add(acc);
                }
                else {
                    mapAccountWithRegion.put('East', new List<Account>{acc});
                }
            }
            else if(acc.Region__c == 'West')
            {
                if(mapAccountWithRegion.containsKey('West'))
                {
                    mapAccountWithRegion.get('West').add(acc);
                }
                else {
                    mapAccountWithRegion.put('West', new List<Account>{acc});
                }
            }
            else if(acc.Region__c == 'North')
            {
                if(mapAccountWithRegion.containsKey('North'))
                {
                    mapAccountWithRegion.get('North').add(acc);
                }
                else {
                    mapAccountWithRegion.put('North', new List<Account>{acc});
                }
            }
            else if(acc.Region__c == 'South')
            {
                if(mapAccountWithRegion.containsKey('South'))
                {
                    mapAccountWithRegion.get('South').add(acc);
                }
                else {
                    mapAccountWithRegion.put('South', new List<Account>{acc});
                }
            }
        }

        if(mapAccountWithRegion.containsKey('North'))
        {
            System.debug('Account with region North: '+ mapAccountWithRegion.get('North'));
            System.debug('Size: ' + mapAccountWithRegion.get('North').size());
            System.debug('Get: '+ mapAccountWithRegion.get('North'));
        }


        if(mapAccountWithRegion.containsKey('South'))
        {
            System.debug('Account with region South: '+ mapAccountWithRegion.get('South'));
            System.debug('Size: ' + mapAccountWithRegion.get('South').size());
        }

        if(mapAccountWithRegion.containsKey('East'))
        {
            System.debug('Account with region East: '+ mapAccountWithRegion.get('East'));
            System.debug('Size: ' + mapAccountWithRegion.get('East').size());
        }


        if(mapAccountWithRegion.containsKey('West'))
        {
            System.debug('Account with region West: '+ mapAccountWithRegion.get('West'));
            System.debug('Size: ' + mapAccountWithRegion.get('West').size());
        }

    }

    public static void newMethodGetAllAccountWhereRegionIsNotNull()
    {
        List<Account> lstAcc = [SELECT Name, Region__c FROM Account WHERE Region__c != NULL];

        Map<String, List<Account>> mapAccountWithRegion = new Map<String, List<Account>>();

        for(Account acc: lstAcc)
        {  
            if(mapAccountWithRegion.containsKey(acc.Region__c))
            {
                mapAccountWithRegion.get(acc.Region__c).add(acc);
            }
            else {
                mapAccountWithRegion.put(acc.Region__c, new List<Account>{acc});
            }      
        }

        if(mapAccountWithRegion.size()>0)
        {
            for(String region: mapAccountWithRegion.keySet())
            {
                System.debug('Display all Account in Map according to Region '+ region+ ' --> ' + mapAccountWithRegion.get(region));
            }
            
        }

       
    }


}