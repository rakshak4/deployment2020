/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 03/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   03/11/2022   Souhayl Johar   Initial Version
**/
public with sharing class AP05_AccountWithContacts {
    @AuraEnabled

    public static List<Contact> getContacts(Id recordId) {
        List<Contact> lstCon = [Select Id,Name, Email, Phone FROM Contact Where AccountId=:recordId];

        return lstCon;
    }
}