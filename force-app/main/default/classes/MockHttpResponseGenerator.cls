/**
 * @description       : 
 * @author            : Sambhav Bholah
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Sambhav Bholah
**/
@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // implement this interface method
    global HttpResponse respond(HttpRequest req){
        //Optionally, only send a mock response for a specific endpoint and method
        // system.assertEquals('https://example.com/test' , req.getEndpoint());
        // system.assertEquals('GET', req.getMethod());
        String body = '{\"accounts\": [{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\":\"31/10/2022\", \"SLASerialNumber\":\"917321\", \"UpsellOpportunity\":\"Maybe\", \"Website\" : \"spoonconsulting.com\"}]}';
        //create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
        return res;
    }
    
}