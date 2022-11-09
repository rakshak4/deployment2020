/**
 * @description       : 
 * @author            : Kanigan Somadoo
 * @group             : 
 * @last modified on  : 11-08-2022
 * @last modified by  : Kanigan Somadoo
 * Modifications Log
 * Ver   Date         Author            Modification
 * 1.0   11-08-2022   Kanigan Somadoo   Initial Version
**/
@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req){

        // System.assertEquals('https://example.com/example/test', req.getEndpoint());
        // System.assertEquals('GET', req.getMethod());
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-type', 'application/json');
        res.setBody('{"example": "test"}');
        res.setStatusCode(200);
    return res;
    }
    
}