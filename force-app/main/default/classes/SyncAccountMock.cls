@isTest 

public class SyncAccountMock  implements HttpCalloutMock{

   public static HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{\"Email Address\" : \"ashwagandha@trippy.za\", \"Rating\" : \"Hot\", \"CustomerPriority\" : \"High\", \"Mobile\" : \"+230 53843334\", \"Region\" : \"South\", \"SLA\" : \"Gold\", \"SLAExpirationDate\" : \"2022-11-30\", \"SLASerialNumber\" : \"230913\", \"UpsellOpportunity\" : \"Maybe\", \"Website\" : \"spoonconsulting.com\"}');
        response.setStatusCode(200);
        return response; 
    }
}