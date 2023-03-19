import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import BILLING_ADDRESS_FIELD from '@salesforce/schema/Account.BillingCity';


export default class ExampleComponentWebLightning extends LightningElement {
    accountId;
    name = '';
    phone='';
    billingAddress='';
    greeting='LWC';
    name = 'Component Lightning';
    phone='Component Lightning';
    billingAddress='Component Lightning';
    changeHandler(event) {
      this.greeting = event.target.value;
    }

    handleNameChange(event) {
        this.accountId = undefined;
        this.name = event.target.value;
        this.phone=event.target.value;
    }
    handlePhoneChange(event) {
        this.phone=event.target.value;
    }
    handleOnselect(event) {

        billingAddress= event.detail.value;
        console.log( 'Selected button is ' + billingAddress );

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: billingAddress,
                actionName: 'new'
            }
        });
    }
    createAccount() {
        const fields = {};
        fields[NAME_FIELD.fieldApiName] = this.name;
        fields[PHONE_FIELD.fieldApiName] = this.phone;
        fields[BILLING_ADDRESS_FIELD.fieldApiName] = this.billingAddress;
        const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(account => {
                this.accountId = account.id;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }
    
  }

  ({
    handleClick : function (cmp, event, helper) {
        alert("You clicked: " + event.getSource().get("v.label"));
    }
});