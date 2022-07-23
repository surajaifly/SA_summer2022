import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {

    @track messageString = '';

    @track mapMarkers = [
        {
            location: {
                // Location Information
                City: 'San Francisco',
                Country: 'USA',
                PostalCode: '94105',
                State: 'CA',
                Street: '50 Fremont St',
            },

            // For onmarkerselect
            value: 'SF1',

            // Extra info for tile in list & info window
            icon: 'standard:account',
            title: 'Julies Kitchen', // e.g. Account.Name
            description: 'This is a long description',
        },
        {
            location: {
                // Location Information
                City: 'San Francisco',
                Country: 'USA',
                PostalCode: '94105',
                State: 'CA',
                Street: '30 Fremont St.',
            },

            // For onmarkerselect
            value: 'SF2',

            // Extra info for tile in list
            icon: 'standard:account',
            title: 'Tender Greens', // e.g. Account.Name
        },
    ];
    handleChildCmpOneButtonClick(event) { 
        console.log('ON PARENT', event.detail);
        this.messageString = event.detail;
    }
}