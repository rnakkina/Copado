@RestResource (urlMapping='/Contacts1/*')
Global with sharing class GetContactDetails1 {
@httpget
    Global static List<sObject> GetConDetails1()
    {
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
        Contact Con = [select Id, FirstName, LastName, MailingAddress, MobilePhone, Email, Phone, Birthdate, Reg_Id__c, Gender__c, Languages__c, Patient__c, Status__c, Best_Time_to_Call__c, Type__c from Contact where Id=:st];
        List <Contact_Addresses__c> ConAdd = [SELECT Id,Name, Address__c, Contact__c FROM Contact_Addresses__c where Contact__c=:st];      
        List<sobject> ob=new List<sobject>();
		ob.add(Con);
        for(Contact_Addresses__c CA: ConAdd){
            String st1=CA.Address__c;
            Address__c Add1=[select Id, Active__c, Address_Line1__c, Address_Line2__c, Address_Line3__c, City__c, Country__c, Postal_Code__c, Provience__c from  Address__c where Id=:st1];
            ob.add(Add1);
                       
        }
        
        return ob;
    }
}