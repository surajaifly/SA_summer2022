import { LightningElement, track, wire } from 'lwc';
import getContactList from '@salesforce/apex/SA22SOQLExample.getContactList';

export default class ShowContactRecords extends LightningElement {
    
    @track contactList;

    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            console.log('data', data);
            this.contactList = data;
        } else if (error) {
            console.log('error', error);
        }
    }
}