/**
 * @description       :
 * @author            : Akhilesh Ramchurn
 * @group             :
 * @last modified on  : 07/11/2022
 * @last modified by  : Akhilesh Ramchurn
 * Modifications Log
 * Ver   Date         Author              Modification
 * 1.0   07/11/2022   Akhilesh Ramchurn   Initial Version
 **/
trigger AccountTrigger on Account(after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
    }
}