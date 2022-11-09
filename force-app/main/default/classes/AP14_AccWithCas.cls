/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-08-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP14_AccWithCas {

    public static Map<String,List<String>> findAccWithCse(){
        String RecordIdIndividual=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Individual').getRecordTypeId();
        String RecordIdBusiness=Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('Business').getRecordTypeId();

        List<Case> lstAcc = [SELECT Account.Name, Account.RecordTypeId FROM Case];

        Map<String,List<String>> mapAcc = new Map<String,List<String>>();

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
        return mapAcc;
        
    }
}