/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

/**
 * @File Name          : <ClassName>.cls
 * @Description        : Visualisation with VS Code
 * @Author             : MJH (Spoon Consulting)
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    DD-MMM-YYYY, HH:MM:SS      MJH (Spoon Consulting)     Initial Version
**/

public with sharing class AP01_UpdateAccount {

    /**
     * @description Method to update account
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/
    public static void name()
    {
        System.debug('Hello World');
    }
    /**
     * @description Method to insert in account
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/

    public static void insertAccount()
    {
        Account acct = new Account();
        acct.Name = 'Toto Polo';
        acct.BillingStreet = 'Royal Rd';
        acct.BillingCity = 'Moka';
        acct.BillingCountry = 'Mauritius';
        acct.Phone = '985632145';
        acct.Region__c = 'East';
        Insert acct;
    }

    /**
     * @description Method to update in account
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/

    public static void updateFieldInAccount()
    {

        Account acct = new Account();
        acct.Id = '0014H00004Ck14UQAR';
        acct.Phone='000000';

        Update acct;
    }


     /**
     * @description Method to delete in account
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/
    public static void deleteAccountById()
    {
        Account acct = new Account();
        acct.Id = '0014H00004Ck14UQAR';
        Delete acct;
    }


     /**
     * @description Method to create a list with account region north and debug the name
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/


    public static void listExample()
    {
        List<Account> lstAcc = [SELECT Region__c, Id, Name FROM Account WHERE Region__c = 'North'];

        for(Account acct: lstAcc)
        {
            System.debug(acct.Name);
        }
    }

     /**
     * @description Method to Insert 10 accounts (RecordType: Customer and all the required fields need to be filled) and for each account, insert a contact (Address and phone must contain the same corresponding data as the account).
    Note: RecordTypeId must not be hardcoded
     * @author MJH | 26/08/2021
     * @return String The managed object's name.
     **/

  

    public static void listExample2()
    {

        List<Account> lstAccount = new List<Account>();
        List<Contact> lstContact = new List<Contact>();
        
        String recordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        Integer i;
        for(i=0; i<10; i++)
        {
            Account acc = new Account();
            acc.RecordTypeId= recordTypeId;
            acc.Name = 'Mehreen Jhummun' + i;
            acc.BillingStreet = 'Royal Rd';
            acc.BillingCity = 'Moka';
            acc.BillingCountry = 'Mauritius';
            acc.Phone = '985632145';
            acc.Region__c = 'East';
            lstAccount.add(acc);
        }


        if(lstAccount.size()>0)
        {
            Insert lstAccount;
        }

        for(Account acc: lstAccount)
        {
            Contact con = new Contact(
                AccountId= acc.Id,
                LastName=acc.Name,
                OtherStreet = acc.BillingStreet,
                OtherCity =  acc.BillingCity,
                OtherCountry =  acc.BillingCountry,
                Phone = acc.Phone

            );

            lstContact.add(con);
                
        }
        
        if(lstContact.size()>0)
            
        {
            Insert lstContact;
        }
        

    }




     /**
     * @description Method that takes as input as string color and query all vehicles whose color match the colour passed as parameter to the method.
     * @author MJH | 20/10/2022
     * @return make model mileage
     **/

    public static void apexMethodParameter(String color)
    {
        
        List<Vehicle__c> listVeh = [SELECT Name, Make__c, Mileage__c, Model__c FROM Vehicle__c WHERE Colour__c =: color];

        System.debug('The list of vehicle '+ listveh);

        /** for(Vehicle__c veh: listVeh)
        {
            system.debug('The list of vehicle '+ veh);
        }*/
        

    }


    /**
     * @description Method that declare a string set of black and blue 
     * @author MJH | 20/10/2022
     * @return make model mileage
     **/


    public static void apexMethodParameterSet()
    {
        
        Set<String> colorVeh = new Set<String>{'Black', 'Blue'};
        
        List<Vehicle__c>listVeh = [SELECT Name, Make__c, Mileage__c, Model__c, Colour__c FROM Vehicle__c WHERE Colour__c IN: colorVeh];

    
        System.debug('The list of vehicle '+ listVeh);

    }


    /**
     * @description Method  
     * @author MJH | 20/10/2022
     * @return make model mileage
     **/


     public static void mapExample1()
     {
        Map<String, String> mapRegNumMake = new Map<String, String>();

        //add items
        mapRegNumMake.put('12 JN 94', 'Toyota Glanza');
        mapRegNumMake.put('78 OC 94', 'Toyota Supra');
        mapRegNumMake.put('1 JN 22', 'BMW X6 M');
        mapRegNumMake.put('678 JN 00', 'honda Civic EK3');

        //print the values
        System.debug('My Cars amd their make: mapRegNumMake: '+ mapRegNumMake);

        //print map size
        System.debug('Map size: magRegNumMake: ' + mapRegNumMake.size());
     }


     /**
     * @description Method   that map clothes colour and list of nice and happy employee names
     * @author MJH | 26/08/2021
     * @return make model mileage
     **/

    public static void mapExample2()
    {
       Map<String, List<String>> colorEmployee = new Map<String, List<String>>();
      
       List<String> employeeName = new List<String>{'Tom','sara','mila','ali'};

       colorEmployee.put('Black', employeeName);
       colorEmployee.put('Blue', employeeName);
       colorEmployee.put('Black', employeeName);
       colorEmployee.put('Black', employeeName);

       System.debug('My clothes colour and list of nice employee: '+ colorEmployee);


       //get element by passing a key

       if(colorEmployee.containsKey('Blue'))
       {
        System.debug('Happy Employees wearing blue color: ' + colorEmployee.get('Blue'));
       }

       if(colorEmployee.containsKey('Black'))
       {
        System.debug('Happy Employees wearing black color: ' + colorEmployee.get('Black'));
       }

       //find all different colors

       System.debug('Different colors: '+colorEmployee.keySet());

       //print all employee name
       System.debug('All super Happy employee name: ' +  colorEmployee.values());


       //find total number of employees contained by the map

       Integer numOfEmployees = 0;
       for(String colour :  colorEmployee.keySet())
       {


        numOfEmployees += colorEmployee.get(colour).size();
       }
       System.debug('Number of extremely happy employees: ' + numOfEmployees);


    }

    /**
     * @description Method   that map clothes colour and list of nice and happy employee names another way
     * @author MJH | 26/08/2021
     * @return make model mileage
     **/

    public static void usingMapToGetEmployeesWithASpecificColourClothes()
    {
        Map<String, List<String>> mapLstOfEmployeesWithSpecificClothColour = new Map<String, List<String>>();

        mapLstOfEmployeesWithSpecificClothColour.put('Black', new list<String>{'Tom', 'Sam', 'Sara', 'John'});
        mapLstOfEmployeesWithSpecificClothColour.put('White', new list<String>{'Danny', 'Johnny'});
    

        System.debug('Cloth Colour and Employee: mapLstOfEmployeesWithSpecificClothColour: ' + mapLstOfEmployeesWithSpecificClothColour);
        System.debug('Map Size: mapLstOfEmployeesWithSpecificClothColour: ' + mapLstOfEmployeesWithSpecificClothColour.size());


        Integer numOfEmployees = 0;
        for(String colour :  mapLstOfEmployeesWithSpecificClothColour.keySet())
        {
 
         
         numOfEmployees=+ mapLstOfEmployeesWithSpecificClothColour.get(colour).size();
        }
        System.debug('Number of extremely happy employees: ' + numOfEmployees);
    }



  /**
     * @description Method   that map clothes colour and list of nice and happy employee names another way
     * @author MJH | 26/08/2021
     * @return make model mileage
     **/

    public static void mapExample3()
    {
       List<Account> lstAcc = [SELECT Name, Id, Region__c FROM Account WHERE Region__c != NULL];

       //query donn tw 1 laliste lerla store li dan 1 liste

       Map<String, List<Account>> mapRegion = new Map<String, List<Account>>();

       //sa mo map cot li pou store string region ek list account dan variable mapRegion

       for(Account acc:  lstAcc)
        {//loop dan mo account list
                
                if(mapRegion.containsKey(acc.Region__c))
                {//si ena key la
                    //azoute li dan existing
                    //si deza ena region la..li zis azoute li dan acc

                    mapRegion.get(acc.Region__c).add(acc);
                }
                else 
                {
                    mapRegion.put(acc.Region__c, new List<Account>{acc});
                }//si pena key la
                // li azoute dan nuvo laliste
                //si perna region la..li azoute region ek met li dan la liste account la
            
        }

         

       System.debug('The map region of account are: '+ mapRegion);
       /**
        * 
        for(Account acc:  lstAcc)
        {

            if(acc.Region__c == 'North')
            {
                
                if(mapRegion.containsKey('North')) @
                {

                    mapRegion.get('North').add(acc);
                }
                else 
                {
                    mapRegion.put('North', new List<Account>{acc});
                }

                @ li vin 3 account si nou ena 3 cour east
                aster si pa ti pou met if contains key...lerla li ti pou override ban premier la. 
                li ti pou prnd dernier la

            }

            if(acc.Region__c == 'East')
            {
                
                if(mapRegion.containsKey('East'))
                {

                    mapRegion.get('East').add(acc);
                }
                else 
                {
                    mapRegion.put('East', new List<Account>{acc});
                }

            }


            if(acc.Region__c == 'South')
            {
                
                if(mapRegion.containsKey('South'))
                {

                    mapRegion.get('South').add(acc);
                }
                else 
                {
                    mapRegion.put('South', new List<Account>{acc});
                }

            }


            if(acc.Region__c == 'West')
            {
                
                if(mapRegion.containsKey('West'))
                {

                    mapRegion.get('West').add(acc);
                }
                else 
                {
                    mapRegion.put('West', new List<Account>{acc});
                }

            }

        */
   
       
       
    }




      /**
     * @description Method Create a map to store country as Key and corresponding states as Values.
            United States -> Connecticut , Nebraska, New Jersey
            Germany -> Berlin, Hamburg
     * @author MJH | 26/08/2021
     * @return make model mileage
     **/

     public static void mapExample4()
     {
        Map<String, List<String>> colorMapState = new Map<String, List<String>>();

        colorMapState.put('United States', new list<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        colorMapState.put('Germany', new list<String>{'Berlin', 'Hamburg'});

        System.debug('The state are: '+ColorMapState);
     }




     /**
     * @description Method for cse study 1
            Germany -> Berlin, Hamburg
     * @author MJH | 26/08/2021
     * @return query
     **/
public static void caseStudy1(){
    List<Case> lstCase = [SELECT Vehicle__r.Name, Vehicle__r.RegistrationNumber__c, DamageType__c FROM Case WHERE DamageType__c != NULL ORDER BY DamageType__c];
    

    for(Case cas: lstCase)
        {
            system.debug('The list of vehicle '+ cas);
        }   
}


/**
     * @description Method for cse study 2
            Germany -> Berlin, Hamburg
     * @author MJH | 26/08/2021
     * @return query
     **/

    //UseCase 02
    public static void caseStudy22()
    {
        List<Case> lstCas = [SELECT Account.Name, Account.RecordType.Name FROM Case WHERE AccountId != NULL];

        Set<String> setaccountId = new Set<String>();

        for(Case newcases : lstCas){
            setaccountId.add(newcases.Account.Id);

        }

        List<Account> lstAcc = [SELECT Name,RecordType.DeveloperName From Account WHERE Account.Id IN:setaccountId];
    
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
        
        




    

/**
     * @description Method for cse study 3
            
     * @author MJH | 26/08/2021
     * @return query
     **/


public static void caseStudy3()
{
    List<Account> acclist = [SELECT Id, OwnerId FROM Account WHERE Region__c = 'North' AND RecordType.DeveloperName='Individual'];
    List<User> manager = [SELECT Id FROM User WHERE Profile.Name='Manager'];

    for(Account acc: acclist)
    {
        acc.OwnerId = manager[0].Id;

    }
    if(acclist.size()>0){

        Update(acclist);

}


}






   
}