/**
 * @File Name          : AP01_UpdateAccount.cls
 * @Description        : Initialisation with VS Code
 * @Author             : Spoon Consulting
 * @Group              : 
 * @Last Modified By   : ARA
 * @Last Modified On   : 10-21-2022
 * @Modification Log   : 
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0    19/10/2022      ARA      Initial Version
**/
public with sharing class AP01_UpdateAccount {
    /**
         * @description Display Name.
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
    public static void displayName(){
        System.debug('AKhilesh');
    }

    /**
         * @description Method to create an account.
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
        public static void createAccount(){
            Account acct = new Account();
            acct.Name = 'Acmetest';
            acct.Phone = '(415)555-1212';
            acct.NumberOfEmployees = 100;
            acct.Region__c = 'South';
            acct.BillingStreet= 'Flacq street';

            insert acct;
        }

         /**
         * @description Method to update an account.
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
        public static void updateAccount(){
        
            Account acct = new Account();
            acct.Id = '0017S00000GtdefQAB';
            acct.Name = 'Acmetestupdate';

            update acct;
        }
        /**
         * @description Method to delete an account.
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
        public static void deleteAccount(){
        
            Account acct = new Account();
            acct.Id = '0017S00000GtdefQAB';

            delete acct;
        }

        /**
         * @description Method Display name of contacts with region north.
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
        public static void displayContactsNorth(){
        
            List<Contact> lstContacts = [SELECT FirstName, LastName FROM Contact WHERE Account.Region__c='North'];
           

            for(Contact con : lstContacts){
                System.debug(con.FirstName +' '+ con.LastName);
            }

        }

        /**
         * @description Method Insert 10 accounts (RecordType: Customer and all the required fields need to be filled) and for each account, insert a contact (Address and phone must contain the same corresponding data as the account).
                        Note: RecordTypeId must not be hardcoded
         * @author Akhilesh Ramchurn | 19/10/2022 
         **/
        public static void insert10Records(){
            List<Account> lstAcct = new List<Account>();
            List<Contact> lstContact= new List<Contact>();
           
           

            String recordTypeId =Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
            
            
            for(Integer i=0; i<10; i++){
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

           
        }

        /**
         * @description Method takes as input a String (Color) and query all vehicles whose color match
         * @author Akhilesh Ramchurn | 20/10/2022 
         **/

         public static void fetchVehicleByColor(String color){
                List<Vehicle__c> lstVehicles =[SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE Colour__c =: color];

                if(lstVehicles.size()>0){
                    System.debug(lstVehicles);
                }
                

         }

         /**
         * @description Method takes as input two String (Color) and query all vehicles whose color match
         * @author Akhilesh Ramchurn | 20/10/2022 
         **/

        public static void fetchVehicleByTwoColor(String color1, String color2){
           // 

           Set<String>  setColor = new Set<String>{color1,color2};
           List<Vehicle__c> lstVehicles =[SELECT Make__c, Model__c, Mileage__c FROM Vehicle__c WHERE colour__c  IN :setColor];


           if(lstVehicles.size()>0){
                System.debug(lstVehicles);
            }
            

     }
     /**
         * @description Method map of car registration number and Make Model
         * @author Akhilesh Ramchurn | 20/10/2022 
         **/
     public static void mapExample(){
        Map<String, String> mapRegNumMake = new Map<String, String>();

        //add items
        mapRegNumMake.put('12 JN 94','Toyota Glanza');
        mapRegNumMake.put('78 OC 98','Toyota Supra');
        mapRegNumMake.put('1 JN 22','BMW X6 M');
        mapRegNumMake.put('678 DC 00','Honda Civic EK3');

        //print the values
        System.debug('My Cars and their make: mapRegNumMake: '+ mapRegNumMake);

        //print map size
        System.debug('Map Size: mapRegNumMake ' + mapRegNumMake.size());
     }

     public static void mapClothesColour(){

        Map<String, List<String>> mapClothesColour= new Map<String, List<String>>();

      
        mapClothesColour.put('Red', new List<String>{'Jane','Akhi'});
        mapClothesColour.put('Black', new List<String>{'Sam','Tom'});

        //print the values
        //System.debug('Clothes colour and lisr of employee: '+  mapClothesColour);

        //print map size
        //System.debug('Map Size: mapRegNumMake ' + mapClothesColour.size());


        for(String key : mapClothesColour.keySet()){
            System.debug('Happy employees wearing ' + key+ ' color:' + mapClothesColour.get(key));
        }
        

        // if(mapClothesColour.containsKey('Black')){
        //     System.debug('Happy employees wearing black color:' + mapClothesColour.get('Black'));
        // }

        // if(mapClothesColour.containsKey('Red')){
        //     System.debug('Happy employees wearing Red color:' + mapClothesColour.get('Red'));
        // }

        System.debug('Different colors: '+  mapClothesColour.keySet());
        System.debug('All Super happy employee names: '+  mapClothesColour.Values());

        // Integer numOfEmployees = 0;

        // for(String colour : mapColorEmployee.keySet()){
        //     numOfEmployees += mapClothesColour.get(colour).size();
        // }

        // System.debug(numOfEmployees);


     }

     public static void mapCountryState(){
        Map<String, List<String>> mapCountryState= new Map<String, List<String>>();

        mapCountryState.put('United States', new List<String>{'Connecticut' , 'Nebraska', 'New Jersey'});
        mapCountryState.put('Germany', new List<String>{' Berlin', 'Hamburg'});

        System.debug( mapCountryState);

     }

     /**
         * @description Query all account where region is not full
         * Build a map of region and list of accounts outpur map
         * @author Akhilesh Ramchurn | 20/10/2022 
         **/


     public static void mapAccountRegion(){

        List<Account> lstAcct = [SELECT Name, Region__c FROM Account WHERE Region__c<>NULL];
        Map<String, List<Account>> mapAccountRegion= new Map<String, List<Account>>();
        
        for(Account acc :lstAcct){
             //if key does not exist
            //Initialise key to an empty list of type account    
           if(!mapAccountRegion.containsKey(acc.Region__c)){
                mapAccountRegion.put(acc.Region__c, new List<Account>());
           }
           mapAccountRegion.get(acc.Region__c).add(acc);
        }
        System.debug(mapAccountRegion);

     }





     

     

}