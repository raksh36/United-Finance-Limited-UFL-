import { LightningElement, api, track } from 'lwc';

export default class HyperLinkProducts extends LightningElement {
    @api applyNow;
    @track isModalOpen = false;

    handleClick(){
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    submitDetails() {     
        this.template.querySelector('lightning-record-edit-form').submit();
        this.isModalOpen = false;
    }
}