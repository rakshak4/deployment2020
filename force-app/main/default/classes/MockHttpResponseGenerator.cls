/**
 * @description       : 
 * @author            : Jason Ramjaya
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Jason Ramjaya
**/
@isTest
global with sharing class MockHttpResponseGenerator implements HttpCalloutMock {
    //Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        //Optionally, only send a mock response for a specific endpoint
        //and method.
        //System.assertEquals('https://examplet.com/example/test', req.getEndpoint());
        //System.assertEquals('GET', req.getMethod());

        //create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
        res.setStatusCode(200);
        return res;
    }
}