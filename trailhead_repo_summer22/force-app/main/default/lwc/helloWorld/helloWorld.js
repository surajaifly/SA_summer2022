import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
    //@track contactName = 'Johnny S.';
    //@track contactPhone;

    contactName = 'Johnny S.';
    contactPhone;

    contactEmail = 'suraj@test.com';
    contactAmount = 123123;
    
    @track contactNames = ['Johnny S.', 'Alan brown', 'Mike', 'Suday', 'New Item']; //ARRAY.
    /*
        Bla
        Bla
        Bla
        ...
    */
    
    // --> Commnets --> non-executable statements
    //Method or Function --> there are the piece of the code that is designed for specific purpose.

    
    //PURE OBJECT.
    @track contactRecord = {
        firstname: "Suraj",
        lastname: "Singh",
        email: "suraj@test.com",
        phone: "(133) 123 1231"
    };


    @track contactRecords = [
        {
            firstname: "LG",
            lastname: "Infotech",
            email: "lg@info.com",
            phone: "(133) 123 1231"
        },
        {
            firstname: "Jonny",
            lastname: "Junny",
            email: "yes@papa.com",
            phone: "(909) 009 1234"
        },
        {
            firstname: "Apple",
            lastname: "steve",
            email: "steve@apple.com",
            phone: "(999) 888 7777"
        }
    ];
    
    
    
    handleOnChnage(event) { 
        //Let's do a LOG.
        //LOG? --> log is just a temporary place to see the output of the current state.
        console.log('value = ', event.detail.value);
        this.contactPhone = event.detail.value;
    }

    /*
        handleOnChnage() { 

        }
    */
}