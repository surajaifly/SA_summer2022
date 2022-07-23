import { api, LightningElement, track } from 'lwc';

import doCalloutFromLWC from '@salesforce/apex/APICalloutExample.doCalloutFromLWC';

export default class ChildComponentOne extends LightningElement {
    @api messageFromParent; //Public property.

    @track textValue = '';
    @track breedList = [];

    handleInputChange(event) { 
        this.textValue = event.detail.value;
    }

    handleClick(event) { 
        console.log('BUTTON CLICKED');

        doCalloutFromLWC({breedName: this.textValue})
            .then(result => {
                console.log('result', result);
                var responseObj = JSON.parse(result);
                this.breedList = responseObj.message;
                if (responseObj.message.length == 0) { 
                    alert('No Item Found');
                }
            })
            .catch(error => {
                this.error = error;
            });
            
        // Prevents the anchor element from navigating to a URL.
        event.preventDefault();

        // Creates the event with the contact ID data.

        const selectedEvent = new CustomEvent('childbuttonclick', { detail: this.textValue });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}