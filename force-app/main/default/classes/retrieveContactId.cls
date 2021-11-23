public with sharing class retrieveContactId {
    @AuraEnabled
    public static string retrieveContactId(String userId){
        String contactId = '';
        try {
            contactId =  [SELECT ContactId from User where Id=:userId].ContactId;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return contactId;
    }    
}
