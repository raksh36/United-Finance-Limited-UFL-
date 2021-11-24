trigger AddPaymentandNextDueDate on Loan__c(after insert, before update) {
    if(Trigger.isInsert && Trigger.isAfter){
      for(Loan__c loan : Trigger.New){
        Id trackJobId = System.enqueueJob(new CallHerokuEndPoint(loan));
      }      
    }
    else{
      for (Loan__c loan : Trigger.New) {
        if(Trigger.oldMap.get(loan.Id).PAN_Card__c != loan.PAN_Card__c ){
          Id trackJobId = System.enqueueJob(new CallHerokuEndPoint(loan));
          SYSTEM.DEBUG('JOB ID IS '+trackJobId);
        }
          
        //this if logic covers Loan approved to start installment date
        if(trigger.oldMap.get(loan.Id).Loan_Request__c != loan.Loan_Request__c && loan.Loan_Request__c == 'Approved'){
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
}
