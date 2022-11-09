/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 10-26-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   10-26-2022   Kanigan Somadoo   Initial Version
**/
public with sharing class AP07_preventUpsertOfCase {
    

    public static void preventUpsert(List<Case> lstCas){

        Set<Id> setVehId = new Set<Id>();

        System.debug('List of cases with loan vehicle not null ' + lstCas );

        for(Case cas : lstCas){

            setVehId.add(cas.LoanVehicle__c);

        }

        System.debug('Set of Vehicle Ids ' + setVehId);

        //build a map iwth ID ek vehicle
        List<Vehicle__c> lstVehLoaned = [SELECT Id, Status__c FROM Vehicle__c WHERE Id IN :setVehId];
        Map<Id,Vehicle__c> mapVehLoaned = new Map<Id,Vehicle__c>(lstVehLoaned);

        System.debug(mapVehLoaned);



        //lstcas compare map.contains
        for( Case cas : lstCas){
            if(mapVehLoaned.get(cas.LoanVehicle__c).Status__c == 'Loaned'){
                cas.addError('Cannot insert/update case record, Vehicle status loaned');
            }
        }

    }
}