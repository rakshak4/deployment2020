/**
 * @description       : 
 * @author            : Mehreen Jhummun
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Mehreen Jhummun
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   03/11/2022   Mehreen Jhummun   Initial Version
**/
public with sharing class AP01_SelectDetailLoan {
    @AuraEnabled(cacheable=true)
    public static List<Case> displayDetailsLoan(String caseid) {
    

        List<Case> lstcaseAllVehicle=[SELECT Id,Vehicle__c,
                                    Vehicle__r.Engine_capacity__c,
                                    Vehicle__r.Name,   
                                    Vehicle__r.InsuranceEndDate__c, 
                                    Vehicle__r.InsuranceStartDate__c, 
                                    Vehicle__r.InsuredTo__c, 
                                    Vehicle__r.InsuredTo__r.Active__c,
                                    Vehicle__r.RecordType.DeveloperName
                                    FROM Case 
                                    WHERE Vehicle__c !=NULL AND Id=:caseid AND Vehicle__r.RecordType.Name='Loaned Vehicle'];
        return lstcaseAllVehicle;
    

}
}