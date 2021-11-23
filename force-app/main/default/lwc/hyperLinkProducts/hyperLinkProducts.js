import { LightningElement, api, track, wire } from 'lwc';
import Id from '@salesforce/user/Id';
import basePath from '@salesforce/community/basePath';
import { NavigationMixin } from 'lightning/navigation';

export default class HyperLinkProducts extends LightningElement {
    @api applyNow;
    @track isModalOpen = false;
    @wire(basePath) pageRef;
    userId = Id;

    handleClick(){
        if(!this.userId){
            this[NavigationMixin.GenerateUrl]({
                type: 'standard__webPage',
                attributes: {
                    url: this.pageref+'/login/'
                }
            }).then(generatedUrl => {
                window.open(generatedUrl);
            });
        }
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