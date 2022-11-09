/**
 * @description       : 
 * @author            : Ayman Rummun
 * @group             : 
 * @last modified on  : 11-07-2022
 * @last modified by  : Ayman Rummun 
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   11-07-2022   Ayman Rummun   Initial Version
**/
@isTest
public class LC01_InvoiceControllerTest {

    @TestSetup 
    static void testSetup(){

        User irfan = new User ();
        irfan.email = 'TestUser@spoonconsulting.dev';
        irfan.ProfileId = UserInfo.getProfileId(); 
        irfan.UserName = 'basf@hotmail.com';            
        irfan.Alias =  'TST1';
        irfan.TimeZoneSidKey = 'America/New_York';
        irfan.EmailEncodingKey = 'ISO-8859-1';
        irfan.LocaleSidKey = 'en_US';
        irfan.LanguageLocaleKey = 'en_US';
        irfan.LastName = 'dfgh';

        //ins
        INSERT irfan;
        System.debug('>>>'+irfan.Id);


        System.runas(irfan){

            List<Case> lstCas = new List<Case>();
            Case cas = new Case( Status = 'payment', OwnerId = irfan.Id);
            lstCas.add(cas);
            INSERT lstCas;

            System.debug('Id :'+cas.Id);

            // irfanList<Invoice__c> lstInv = List<Invoice__c>();
            // Invoice__c inv = new Invoice__c(Case__c= cas.Id, Id = 'a017S0000072eeSQAQ', CreatedDate = '2022-10-25T08:00:10.000+0000');
            // lstInv.add(inv);
            // INSERT lstInv;      
        }
        
    }

    @isTest 
    public static void testtestteste(){
        System.debug('hi');
    }
}