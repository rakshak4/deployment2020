/**
 * @description       : 
 * @author            : Bhoovanyu Dhomah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Bhoovanyu Dhomah
 * Modifications Log
 * Ver   Date         Author             Modification
 * 1.0   11-08-2022   Bhoovanyu Dhomah   Initial Version
**/
@isTest
global with sharing class AP15_MockHttpResponseGenerator implements HttpCalloutMock{
    global HTTPResponse respond(HTTPRequest req){
        //optionally, only send a mock response for a specific endpoint and method
        System.assertEquals('https://example.com/example/test',req.getEndpoint());
        System.assertEquals('GET', req.getMethod());

        //create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('content-Type', 'application/json');
        // res.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
        res.setBody('{"Website": "test.salesforce.com","UpsellOpportunity": "No","SLASerialNumber": "123456789","SLAExpirationDate": "2022-11-03","SLA": "Bronze","Region": "East","Mobile": "7612345","CustomerPriority": "Low","Rating": "Cold","Email Address": "test2@spoon.com"}');
        res.setStatusCode(200);
        return res;
    }


}