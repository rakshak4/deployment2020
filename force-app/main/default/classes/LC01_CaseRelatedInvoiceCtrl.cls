public class LC01_CaseRelatedInvoiceCtrl {
	
    @AuraEnabled(cacheable=false)
    public static List<Invoice__c> getRelatedInvoices(String caseId) {
        System.debug('caseId -> ' + caseId);

        List<Invoice__c> lstInvoice = new List<Invoice__c>();
        try{
            lstInvoice = [SELECT id, Name FROM Invoice__c WHERE Case__c =: caseId ORDER BY CreatedDate DESC];
        }catch(Exception ex){
            System.debug('An exception occurred:'+ex.getMessage());
        }
        
        return lstInvoice;
    }
}