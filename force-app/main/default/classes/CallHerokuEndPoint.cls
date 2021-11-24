public with sharing class CallHerokuEndPoint implements Queueable, Database.AllowsCallouts {
    private Loan__c loanRecord;
    public CallHerokuEndPoint(Loan__c record){
        this.loanRecord = record;
    }
    public void execute(QueueableContext context) {          
            Http h = new Http();
            HttpRequest httpReq = new HttpRequest();
            httpReq.setMethod('POST');
            httpReq.setHeader('Content-Type','application/json');
            httpReq.setEndpoint('https://validate-ufl-requests.herokuapp.com/cibil');
            HttpResponse res = h.send(httpReq);
            if(res.getStatusCode() == 200){
                Map<String, Object> resMap= (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
                Integer cibilScores = (Integer) resMap.get('res');
                system.debug('cibilScores is '+loanRecord.Id);              
                Loan__c ani = new Loan__c();
                ani.Id = loanRecord.Id;
                ani.CIBIL_Score__c = (Decimal)cibilScores;
                ani.Aadhar_Verified__c = true;
                Database.upsert(ani,false);
            }
            
    }
}
