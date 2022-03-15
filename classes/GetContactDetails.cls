@RestResource (urlMapping='/GetContactDetails/*')
Global class GetContactDetails {
    
public class ConAddresses {
public Contact Con;
public List<Address__c> Addresses;
    public ConAddresses(Contact co, List <Address__c> LL)
    {
        Con = co;
        Addresses = LL;
    }
}
    
@httpget
    Global static String GetConDetails()
    {
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
		List<Contact> c1 = [select Id, FirstName, LastName, MailingAddress, MobilePhone, Email, Phone, Birthdate, Reg_Id__c, Gender__c, Languages__c, Patient__c, Status__c, Best_Time_to_Call__c, Type__c from Contact where Id=:st limit 1];
		List<Address__c> LA = new List<Address__c>();
integer j = 0;
for (Contact C: c1)
{
    String stp = c1.get(j).Id;
    List <Contact_Addresses__c> ConAdd = [SELECT Id,Name, Address__c, Contact__c FROM Contact_Addresses__c where Contact__c=:stp]; 
    Integer i = 0; 
      for(Contact_Addresses__c CA: ConAdd){
            String st1=ConAdd.get(i).Address__c;
            Address__c AC =[select Id, Active__c, Address_Line1__c, Address_Line2__c, Address_Line3__c, City__c, Country__c, Postal_Code__c, Provience__c from  Address__c where Id=:st1];
          LA.add(Ac);
          
          i++;
          
        }

    j++;
} 
     
        ConAddresses Cads = new ConAddresses(c1.get(0), LA);
		        return json.serialize(Cads);
        
  
    }
}