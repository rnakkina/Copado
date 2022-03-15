public class ConAddressesw {
public Contact Con;
public List<Address__c> Addresses;
    public ConAddressesw(Contact co, List <Address__c> LL)
    {
        Con = co;
        Addresses = LL;
    }
    public void display()
    {
        system.debug('Con :' +Con);
        system.debug('Addresses:' +Addresses);

    }
}