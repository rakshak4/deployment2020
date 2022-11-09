public with sharing class LWC03_DisplayVehicles {
    public LWC03_DisplayVehicles() {

    }

    
	@AuraEnabled
    public static List<Vehicle__c> queryVehicles(String contactId){
        List<Vehicle__c> lstVehicles = new List<Vehicle__c>();
        lstVehicles = [ Select Name,Colour__c, Model__c, Make__c, RegistrationNumber__c, InsuranceStartDate__c, InsuranceEndDate__c
                        From Vehicle__c 
                        Where Contact__c = :contactId and recordtype.developerName ='Customer_Vehicle'];

        return lstVehicles;
    }
}