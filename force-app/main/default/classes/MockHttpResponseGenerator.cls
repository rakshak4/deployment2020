/**
 * @description       : 
 * @author            : Asma Ghanty
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Asma Ghanty 
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0   11-08-2022   Asma Ghanty   Initial Version
**/
@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock{

    //implement this interface method
    global HttpResponse respond(HttpRequest req){
    
        //create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(
            '{\"accounts\":[{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}'
            );
        res.setStatusCode(200);
        return res;
    }
  
}