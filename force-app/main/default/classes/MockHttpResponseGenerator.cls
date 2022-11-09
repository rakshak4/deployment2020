/**
 * @description       : 
 * @author            : Souhayl Johar
 * @group             : 
 * @last modified on  : 08/11/2022
 * @last modified by  : Souhayl Johar
 * Modifications Log
 * Ver   Date         Author          Modification
 * 1.0   08/11/2022   Souhayl Johar   Initial Version
**/
@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {

// implments this interface method
    global HttpResponse respond(HTTPRequest req) {

        // optionally, only sen a mock response for a specific endpoint and method

        System.assertEquals('https://example.com/example/test', req.getEndpoint()); 
        System.assertEquals('GET',req.getMethod());

        // Create fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}');
        res.setStatusCode(200);
        return res;
      
    }
}