@isTest(SeeAllData=true)
public class MyIntegrationServices {

   
    @isTest 
    public static void MyIntSermethod(){    
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/Patients/0033i00000ALrd5'; 
        req.httpMethod = 'GET';
       // req.requestBody = Blob.valueof(myJSON);
        RestContext.request = req;
        Test.startTest();
       String con1 = GetPatientDetails.GetPtDetails();
        //system.assert(con1 != null);
        System.assertEquals('Rashmi', con1);
        Test.stopTest(); 
    }
    @isTest 
    public static void MyIntSermethod2(){
             String myJSON = '{"Contactslistobj" :{"Contactslist":[' +
                             '{"Id" : "0033i000007UsxeAAC","FirstName" : "Raja","LastName" : "mouli", "Addresseslstobj" : {"Addresseslst":[{"Id":"a063i000000QW8d","Addline1":"840 Dundas St E", "Addline2":"300 unit"}]}'+
                             '}]}}';
                     RestRequest req = new RestRequest();
                     req.requestURI = '/services/apexrest/UpdateContactService/'; 
                     req.httpMethod = 'PATCH';
       				 req.requestBody = Blob.valueof(myJSON);
        		     RestContext.request = req;
                     Test.startTest();
        		     UpdateContactService.Response res = UpdateContactService.UpdtConSer();
                     system.assertEquals('Successful', res.message);
        			 Test.stopTest();
    }
    @isTest 
    public static void MyIntSermethod3(){
             String myJSON = '{"Contactslistobj" :{"Contactslist":[' +
                             '{"Id" : "","FirstName" : "Raja","LastName" : "mouli", "Addresseslstobj" : {"Addresseslst":[{"Id":"a063i000000QW8d","Addline1":"840 Dundas St E", "Addline2":"300 unit"}]}'+
                             '}]}}';
                     RestRequest req = new RestRequest();
                     req.requestURI = '/services/apexrest/UpdateContactService/'; 
                     req.httpMethod = 'PATCH';
       				 req.requestBody = Blob.valueof(myJSON);
        		     RestContext.request = req;
                     Test.startTest();
        		     UpdateContactService.Response res = UpdateContactService.UpdtConSer();
                     system.assertEquals('Failed', res.message);
        			 Test.stopTest();
    }    
}