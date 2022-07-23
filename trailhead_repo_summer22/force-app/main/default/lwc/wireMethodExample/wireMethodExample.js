import { LightningElement, track, wire } from 'lwc';
import getContactNames from '@salesforce/apex/SA22NonPrimitive.getContactNames';

export default class WireMethodExample extends LightningElement {
    @track contactNameList;

    @wire(getContactNames)
    wiredContactNames({ error, data }) {
        if (data) {
            console.log('data', data);
            this.contactNameList = data;
        } else if (error) {
            console.log('error', error);
        }
    }

}