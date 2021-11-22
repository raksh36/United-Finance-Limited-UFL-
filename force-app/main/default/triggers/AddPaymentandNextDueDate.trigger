trigger AddPaymentandNextDueDate on Loan__c(before update) {
  for (Loan__c loan : Trigger.New) {
      if(loan.Loan_Request__c == 'Approved'){
          if(loan.Installment_Payment_Due_Date__c == null){
            Date tday = Date.today();  
            loan.Installment_Payment_Due_Date__c = tday.addMonths(1);
          }
          else if(loan.Installment_Payment_Date__c == Date.today()){
            loan.Installment_Payment_Due_Date__c = loan.Installment_Payment_Due_Date__c.addMonths(1);
          }        
        }
    }
}
