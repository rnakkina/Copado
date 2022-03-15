public class JsonParseringClass
{
    //Method To Parse JSON Data
    public ContactList getJSONData()
    {
        ContactList conList = new ContactList();
        //JSON String
        String jsonString = '{"ContactList": [' +
            '{"FirstName":"Biswajeet", "LastName": "Samal", "Email": "test1@test.com", "Mobile": "9999999999"},'+
            '{"FirstName":"Abhijeet", "LastName": "Samal", "Email": "test2@test.com",   "Mobile": "8888888888"}]}';
        //Parse JSON to ContactList
        conList = (ContactList)System.JSON.deserialize(jsonstring, ContactList.class);
        System.debug('Respone- ' + conList);
        System.debug('Respone-Fst nm ' + conList.ContactList.get(0).FirstName);
        return conList;
    }
     
    public class ContactList
    {
        public List<ContactWrapper> ContactList;
    }
     
    public class ContactWrapper
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
    }
}