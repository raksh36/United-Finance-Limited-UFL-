import { LightningElement, api, track } from 'lwc';

export default class HyperLinkProducts extends LightningElement {
    @api applyNow;
    @track isModalOpen = false;

    handleClick(){
        this.isModalOpen = true;
    }
    closeModal() {
        // to close modal set isModalOpen tarck value as false
        this.isModalOpen = false;
    }
    submitDetails() {
        /*const fields = event.detail.fields;
        console.log('FIELDS ARE ',this.template.querySelector('lightning-record-edit-form'));
        if(this.applyNow === 'Home Loan'){
            fields.Loan_Products__c = 'Home Loans';
        }
        else if(this.applyNow ==='Vehicle Loan'){
            fields.Loan_Products__c = 'Two-Wheeler and Car Loans';
        }
        else if(this.applyNow === 'Consumer Durable Loan'){
            fields.Loan_Products__c = 'Loans for consumer durables (CD)';
        }
        else{
            fields.Loan_Products__c = 'Personal Loans';
        }*/      
        this.template.querySelector('lightning-record-edit-form').submit();
        this.isModalOpen = false;
    }
}