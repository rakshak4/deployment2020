/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Rayhaan Beeharry
**/
public with sharing class LWC02_TerminateLoan {
    @AuraEnabled
    public static String removeLoanedVehicle(Id caseId,Vehicles__c loanedVehicle) {
        try {
            Case caseToUpdate = new Case (Id=caseId, LoanedVehicle__c= null);
            update caseToUpdate;
            loanedVehicle.status__c='available';
            loanedVehicle.LoanStartDate__c= null;
            loanedVehicle.LoanEndDate__c= null;
            update loanedVehicle;
            return 'Case: '+caseToUpdate.Id + ' was updated.\nVehicle: '+loanedVehicle.Id+' was updated';
        } catch (Exception e) {
            return 'error';
        }           
    }
}