@RestResource (urlMapping='/UpdateContactService/*')
global class UpdateContactService {
public class Contactslistobj{

    public Contactslist Contactslistobj;
}   
public class Contactslist{
public List<Contactcls> Contactslist;
}
public class Contactcls {
        public String Id{ get; set; }
        public String FirstName{ get; set; }
        public String LastName{ get; set; }
        public Addresseslst Addresseslstobj;
    						}
    public class Addresseslst{
        public List<Address> Addresseslst;
    }
    public class Address{
        public String Id{ get; set; }
        public String Addline1{ get; set; }
		public String Addline2{ get; set; }
    }
    Global class Response
    {
    public String message;
    public String exception_msg;
  }
@httppatch
    Global static Response UpdtConSer()
    {
        RestRequest request = RestContext.request;
        Response response = new Response();
        //Map<String, Object> Param = (Map<String, Object>)JSON.deserialize(request.requestBody.toString(), Contactscls.class);
        //Contactscls ccls = JSON.deserialize(Param, Contactscls.class);
        //system.debug('Values'+Param);
        Contactslistobj cons = new Contactslistobj();
        cons = (Contactslistobj)System.JSON.deserialize(request.requestBody.toString(), Contactslistobj.class);
       // System.debug('Respone- ' + cons);
       // System.debug('Respone-Add Id ' + cons.Contactslistobj.Contactslist.get(0).Addresseslstobj.Addresseslst.get(0).Id);
        String IDS = 'Success';
        try{
        //cons.Contactslistobj.Contactslist.get(0).Addresseslstobj.Addresseslst.get(0).Id;
        Integer i = cons.Contactslistobj.Contactslist.size();
        for(Integer j=0; j<i; j++)
        {
            String st = cons.Contactslistobj.Contactslist.get(j).Id;
            Contact cos = [select Id, FirstName, LastName, MailingAddress, MobilePhone, Email, Phone, Birthdate, Reg_Id__c, Gender__c, Languages__c, Patient__c, Status__c, Best_Time_to_Call__c, Type__c from Contact where Id=:st limit 1];
            cos.FirstName = cons.Contactslistobj.Contactslist.get(j).FirstName;
            cos.LastName = cons.Contactslistobj.Contactslist.get(j).LastName;
            Integer x = cons.Contactslistobj.Contactslist.get(j).Addresseslstobj.Addresseslst.size();
            for(integer l=0; l<x ; l++)
            {
                String sp = cons.Contactslistobj.Contactslist.get(j).Addresseslstobj.Addresseslst.get(l).Id;
                Address__C A = [SELECT Id, Address_Line1__c, Address_Line2__c  FROM Address__c where Id =:sp];
                A.Address_Line1__c = cons.Contactslistobj.Contactslist.get(j).Addresseslstobj.Addresseslst.get(l).Addline1;
                A.Address_Line2__c = cons.Contactslistobj.Contactslist.get(j).Addresseslstobj.Addresseslst.get(l).Addline2;
                update A;
            }
            update cos;
        }
        }catch(Exception e) {
          response.message = 'Failed';
          response.exception_msg = e.getMessage();         
          return response;
            //return IDS;
      }
        response.message = 'Successful';
        response.exception_msg = Null;
        return response;
    }  
}