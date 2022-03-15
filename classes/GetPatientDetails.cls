@RestResource (urlMapping='/Patients/*')
Global with sharing class GetPatientDetails {
@httpget
    Global static String GetPtDetails()
    {
       // Contact cp = new Contact();
       //Map<String, String> paramsMap = RestContext.request.params;
      // String cpId = paramsMap.get('Id');
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
        Contact results = [select Id, FirstName, LastName, MailingAddress, MobilePhone, Email, Phone, Birthdate, Reg_Id__c, Gender__c, Languages__c, Patient__c, Status__c, Best_Time_to_Call__c, Type__c from Contact where Id=:st];
        String IDD = results.FirstName;
       // String results= 'buss';
        return IDD;
    }
@httppost
    Global static String InsertPt(String Fname, String Lname, String Ptype, String Gen, String PPhone)
    {
        Contact newcon = new Contact(FirstName=Fname, LastName=Lname, RecordTypeId = '0123i000000YhM6AAK', Patient__c=true, Gender__c =Gen, Type__c = Ptype, Phone =PPhone);
        insert newcon;
        return newcon.Reg_Id__c;
    }
@httpDelete
	Global static void DelPt()
    {
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
        Contact condel = [select Id from Contact where Reg_Id__c=:st];
        Delete condel;
    }
@httpput
    Global static Id UpserPt(String Fname, String Lname, String Ptype, String Gen, String PPhone, String id)
    {
        Contact upcon = new Contact(FirstName=Fname, LastName=Lname, RecordTypeId = '0123i000000YhM6AAK', Patient__c=true, Gender__c =Gen, Type__c = Ptype, Phone =PPhone, Id=id);
        upsert upcon;
        return upcon.Id;
    }
    
@httppatch
    Global static Id onupPt()
    {
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
        Contact results = [select Id from Contact where Id=:st];
        Map<String, Object> Param = (Map<String, Object>)JSON.deserializeUntyped(request.requestBody.toString());
        for(String fieldName:param.keySet()){
            results.put(fieldName, param.get(fieldName));
        }
        update results;
        return results.Id;
    }    
    
}