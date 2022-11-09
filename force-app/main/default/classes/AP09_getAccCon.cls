/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-03-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-03-2022   Bhoovanyu Dhomah   Initial Version
**/
public with sharing class AP09_getAccCon {
    public AP09_getAccCon() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Id recordId ){
        List<Contact> lstCon = [SELECT Name FROM Contact WHERE AccountId=:recordId];
        return lstCon;
    }
}