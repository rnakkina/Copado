public class jsonparsingtest{

    public Contactslistobj getdatatest(){
        Contactslistobj cons = new Contactslistobj();
        String jsonstring = '{"Contactslistobj" :{"Contactslist":[' +
            '{"Id" : "0033i000007UsxeAAC","FirstName" : "Raja","LastName" : "mouli", "Addresseslstobj" : {"Addresseslst":[{"Id":"a063i000000QW8d","Addline1":"840 Dundas St E", "Addline2":"300 unit"}]}'+
            '}]}}';
        cons = (Contactslistobj)System.JSON.deserialize(jsonstring, Contactslistobj.class);
        System.debug('Respone- ' + cons);
        System.debug('Respone-Con ' + cons.Contactslistobj.Contactslist.get(0).Id);
        System.debug('Respone-Add Id ' + cons.Contactslistobj.Contactslist.get(0).Addresseslstobj.Addresseslst.get(0).Id);
        System.debug('Respone-Con ' + cons.Contactslistobj.Contactslist.size());
        System.debug('Respone-Conadd ' + cons.Contactslistobj.Contactslist.get(0).Addresseslstobj.Addresseslst.size());
        System.debug('Respone-Add Id ' + cons.Contactslistobj.Contactslist.get(0).Addresseslstobj.Addresseslst.get(0).Addline1);
        Integer i = cons.Contactslistobj.Contactslist.size();
        for(Integer j=0; j<i; j++)
        {
            String st = cons.Contactslistobj.Contactslist.get(j).Id;
            Contact cos = [select Id, FirstName, LastName, MailingAddress, MobilePhone, Email, Phone, Birthdate, Reg_Id__c, Gender__c, Languages__c, Patient__c, Status__c, Best_Time_to_Call__c, Type__c from Contact where Id=:st limit 1];
            system.debug('cos:' +cos);
        }
        return cons;
    }
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

}