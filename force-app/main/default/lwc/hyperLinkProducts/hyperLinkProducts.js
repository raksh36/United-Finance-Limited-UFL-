import { LightningElement, api, track } from 'lwc';
import Id from '@salesforce/user/Id';
import { NavigationMixin } from 'lightning/navigation';
import getContactId from '@salesforce/apex/retrieveContactId.retrieveContactId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HyperLinkProducts extends NavigationMixin(LightningElement) {
    @api applyNow;
    @track isModalOpen = false;
    hideInputField = false;
    @track userId = Id;
    @track ContactId;
    @track useName;

    handleClick(){
        getContactId({ userId: this.userId })
            .then(result => {
                this.ContactId = result;
            })
            .catch(error => {
                console.error(error);
            });
        if(!this.userId){
            const config = {
				type: 'comm__loginPage',
                attributes: {
                    actionName: 'login'
				}
			};
			this[NavigationMixin.Navigate](config);
		}
        else{
            this.isModalOpen = true;
        }        
    }
    closeModal() {
        this.isModalOpen = false;
    }
    submitDetails() {     
        this.template.querySelector('lightning-record-edit-form').submit();
        this.isModalOpen = false;
    }
    handleSuccess(){
        const event = new ShowToastEvent({
            title: 'Success!',
            variant:'success',
            message:
                'Created Loan Application Successfully!',
        });
        this.dispatchEvent(event);
    }
}