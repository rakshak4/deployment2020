/**
 * @description       : 
 * @author            : Rayhaan Beeharry
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Rayhaan Beeharry
**/
@isTest
global with sharing class MockHttpResponseGenerator implements HttpCalloutMock{
   global HttpResponse respond(HttpRequest req){
    // System.assertEquals('https://example.com/example/test', req.getEndpoint());
    // System.assertEquals('GET', req.getMethod());

    HttpResponse response = new HttpResponse();
    response.setHeader('Content-Type', 'application/json');
    response.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
    response.setStatusCode(200);
    return response;
   }
}