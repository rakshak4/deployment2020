public with sharing class LWC01_DetailScreen {

    @AuraEnabled
    public static Vehicle__c customerVehicle(Id recordId){
        Case myCase = [SELECT Vehicle__c FROM Case WHERE Id =: recordId];
        Vehicle__c customerVehicle = [SELECT Colour__c, Description__c,EndDate__c,StartDate__c,
        Make__c,EngineCapacity__c, Mileage__c, Model__c,
        RegistrationNumber__c, status__c, TotalLoss__c,
        Name, Warranty__c, YearVehicle__c FROM Vehicle__c WHERE Id =: myCase.Vehicle__c
        AND Recordtype.Name = 'Customer Vehicle'];
        return customerVehicle;
    }

    @AuraEnabled
    public static Vehicle__c loanedVehicle(Id recordId){
        Case myCase = [SELECT ContactId FROM Case WHERE Id =: recordId];
        Vehicle__c loanedVehicle = [SELECT Colour__c, Description__c,
         Make__c, EngineCapacity__c,Mileage__c, Model__c,
         RegistrationNumber__c,EndDate__c,StartDate__c,status__c,TotalLoss__c,
        Name, Warranty__c, YearVehicle__c FROM Vehicle__c WHERE Contact__c =: myCase.ContactId
        AND Recordtype.Name = 'Loaned Vehicle'];
        return loanedVehicle;
    }
}