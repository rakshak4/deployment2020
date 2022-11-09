/**
 * @description       : 
 * @author            : Narmeen Nehor
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Narmeen Nehor
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   08/11/2022   Narmeen Nehor   Initial Version
**/
@isTest
global with sharing class MockHttpResponseGenerator implements HttpCalloutMock{
    //Implement this interface method
    global HttpResponse respond(HTTPRequest req) {
        //Optionally, only send a mock response for a specific endpoint
        //and method
        // System.assertEquals('https://example.com/example/test', req.getEndpoint());
        // System.assertEquals('GET', req.getMethod());

        //Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
        res.setStatusCode(200);
        return res;
    }
}