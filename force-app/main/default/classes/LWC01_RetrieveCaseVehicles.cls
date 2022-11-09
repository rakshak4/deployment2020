/**
 * @description       : 
 * @author            : Akhilesh Ramchurn
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   03/11/2022   Akhilesh Ramchurn   Initial Version
**/
public with sharing class LWC01_RetrieveCaseVehicles {
    @AuraEnabled()
    public static List<Case> getVehicleList(Id recordId){
        List<Case>  lstcaseVeh =[SELECT vehicle__r.Name, Vehicle__r.Make__c, LoanedVehicle__c,DamagedVehicle__c, ClosedDate FROM Case  WHERE Id=: recordId];
        return lstcaseVeh;
    }
}