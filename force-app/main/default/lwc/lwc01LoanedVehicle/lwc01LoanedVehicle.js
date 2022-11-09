/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
import { LightningElement,api,track} from 'lwc';
import getLoanedVehicle from '@salesforce/apex/LWC01_LoanedVehicleController.getLoanedVehicle';
import removeLoanedVehicle from '@salesforce/apex/LWC02_TerminateLoan.removeLoanedVehicle';

export default class Lwc01LoanedVehicle extends LightningElement {
    @api recordId
    loanedVehicle
    @track colour
    disableButton

    dataReady= false
    connectedCallback(){
        window.addEventListener("terminateloan",this.handleTerminateLoan );
        // console.log(this.recordId);
        getLoanedVehicle({id:this.recordId})
        .then(result =>{
            this.dataReady=true;
            this.loanedVehicle= result[0].LoanedVehicle__r;
            if(this.loanedVehicle){
                this.setColourRed(this.loanedVehicle.LoanEndDate__c); 
            } else{
                console.log("no loaned vehicle")
                this.disableButton=true;
            }
        })
        .catch(error => {
            console.log(error);
        });        
    }
    
    handleTerminateLoan = () =>{
        console.log("terminate loan");
        removeLoanedVehicle({caseId: this.recordId, loanedVehicle: this.loanedVehicle})
        .then((result)=>{
            console.log(result);
            // getRecordNotifyChange([{recordId: this.recordId}]);
            window.location.reload();
        })
        .catch((error)=>{
            console.log(error);
        })
    }

    setColourRed(loanEndDate){
        const today = new Date();
            if(new Date(loanEndDate) <  today.setDate(today.getDate()+3) ){
                console.log("ayo");     
                this.colour="col-red"
            }
    }
}