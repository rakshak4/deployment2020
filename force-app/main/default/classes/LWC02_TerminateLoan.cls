public with sharing class LWC02_TerminateLoan {

    @AuraEnabled
    public static Vehicle__c terminateLoan(Id recordId){
        Case myCase = [SELECT ContactId FROM Case WHERE Id =: recordId];
        Vehicle__c loanVehicle = [SELECT Contact__c,EndDate__c,Status__c,StartDate__c FROM
        Vehicle__c WHERE Contact__c =: myCase.ContactId
        AND Recordtype.Name = 'Loaned Vehicle'];
        Contact customer = [SELECT Loaned_Vehicle__c FROM Contact WHERE Id =: loanVehicle.Contact__c];

        customer.Loaned_Vehicle__c = null;
        update customer;

       loanVehicle.StartDate__c = null;
       loanVehicle.EndDate__c = null;
        loanVehicle.Contact__c = null;
        loanVehicle.status__c = 'available';
        update loanVehicle;

        return loanVehicle;
    }

}