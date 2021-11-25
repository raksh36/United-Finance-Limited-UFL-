public with sharing class GetLoanRecordsUser {
    @AuraEnabled
    public static List<Loan__c> getLoanList(String userId) {
        String contactId =  [SELECT ContactId from User where Id=:userId].ContactId;
        return [SELECT Id,Name,Aadhar_Verified__c, Aadhar_Number__c, Account_Number__c, CIBIL_Score__c, Contact_Number__c,Default_By__c, Installment_Payment_Date__c, Installment_Payment_Due_Date__c, Interest_Rate__c, Loan_Amount__c, Loan_Products__c, Loan_Purpose__c, Loan_Request__c, PAN_Card__c FROM Loan__c where Customer__c=:contactId WITH SECURITY_ENFORCED];
    }
}
