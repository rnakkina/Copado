@RestResource (urlMapping='/MyService/*')
global class MyService {
    global class MyClass {
        public String Id;
        public String Fname;
        public String Lname;
        public AddressesCls Addresses;
        public MyClass(String x, String y, String z, AddressesCls AA) {
            this.Id = x;
            this.Fname = y;
            this.Lname = z;
            this.Addresses = AA;
        }
    }
    global class AddressesCls{
        public List<MyClassA> Address;
        public AddressesCls(List<MyClassA> AACL)
        {
            this.Address = AACL;
        }
    }
    global class MyClassA{
        public String Id;
        public String Adline1;
        public MyClassA(String p, String q){
            this.Id = p;
            this.Adline1 = q;
        }
    }    
    @HttpGet
    global static MyClass sayHello() { 
        RestRequest request = RestContext.request;
        String st = request.requestURI.substring(request.requestURI.LastIndexof('/')+1);
        Contact c1 = [select Id, FirstName, LastName from Contact where Id=:st limit 1];
        List <Contact_Addresses__c> ConAdd = [SELECT Address__c FROM Contact_Addresses__c where Contact__c=:st]; 
        List<Address__C> AP = new List<Address__C>();
        for(Contact_Addresses__c CA: ConAdd)
        {
            String sst = CA.Address__c;
            Address__C TP = [SELECT Id, Address_Line1__c FROM Address__c where Id =:sst];
            AP.add(TP);
        }
        
        List<MyClassA> M = new List<MyClassA>();
        for(Address__C A:AP){
           MyClassA MAA = new MyClassA(A.Id, A.Address_Line1__c);
           M.add(MAA);
        }
        AddressesCls ACLSn = new AddressesCls(M);
        MyClass obj = new MyClass(c1.Id, c1.FirstName, c1.LastName, ACLSn);
        return obj;
    }
}