import { LightningElement, api  } from 'lwc';
import EMI from '@salesforce/resourceUrl/EMI';
import Truck from '@salesforce/resourceUrl/Truck';
import MobileApp from '@salesforce/resourceUrl/MobileApp';

export default class HomePage extends LightningElement {
    @api buttonText;
    emi = EMI;
    truck = Truck;
    mobileApp = MobileApp;
}