@isTest
public class Intservtest {

    @isTest public static void test_doserv(){
    RestRequest req = new RestRequest(); 
    RestResponse res = new RestResponse();
    GetPatientDetails classToTest = new GetPatientDetails();

    req.requestURI = 'https://nrkportal-dev-ed.my.salesforce.com/services/apexrest/Patients/';
   // req.addHeader('Authorization', 'Bearer 00D3i000000tmHZ!AQoAQLq1_.jPqUos73jql5yalXaWNTw1EzRDpfgO2XBLE627FfmnkmwOL8F0HS8jRqyL5CVnnrgOKrgMRwXEMiAwXxW5Rtjy');
  //  req.addHeader('Content-Type', 'application/json');
    req.httpMethod = 'GET';
  //  req.requestBody = Blob.valueof('{}');
    req.addParameter('Id', '0033i000007Usxe');
    RestContext.request = req;
    RestContext.response= res;


    //ACT - make the request from inside the test execution context, rather than from the external system
    Test.startTest();
    String cos = GetPatientDetails.GetPtDetails();
    Test.stopTest();
     System.assertEquals('Raja', cos);
       // system.assertNotEquals('tuss', cos);
    //ASSERT - verify that you got what you expected...
  //  String actualValue = res.getBody();
    //String expectedValue = '{ "status" : "success" }'; //from your @HttpGet method above....
    //System.assertEquals(actualValue, expectedValue);
    //System.assertEquals(200, res.getStatusCode());

}
    

}