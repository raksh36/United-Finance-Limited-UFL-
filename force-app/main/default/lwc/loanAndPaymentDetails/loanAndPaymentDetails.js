import { LightningElement,track,api } from 'lwc';
import getLoanList from '@salesforce/apex/GetLoanRecordsUser.getLoanList';
import Id from '@salesforce/user/Id';
const actions = [
    { label: 'Show details', name: 'show_details' }
];
const columns = [
    { type: 'action', typeAttributes: { rowActions: actions, menuAlignment: 'left' } },
    { label: 'Loan Id', fieldName: 'Name' },
    { label: 'Loan Type', fieldName: 'Loan_Products__c' },
    { label: 'Loan Amount', fieldName: 'Loan_Amount__c',type: 'currency' }    
];

export default class loanAndPaymentDetails extends LightningElement {
    columns = columns;
    passLoanId;
    @track loanDetails;
    @track userId = Id;
    @api applyNow;

    connectedCallback(){
        getLoanList({userId : this.userId})
            .then(result => {
                this.loanDetails = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
    handleRowAction(event) {
        const row = event.detail.row;
        this.passLoanId = row.Id;
    }
}