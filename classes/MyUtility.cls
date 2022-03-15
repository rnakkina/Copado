public class MyUtility {

    public static void mainprocess(){
        try{
            insertAccount();
        }
        catch(CustomException ce)
        {
            system.debug('message :'+ce.getMessage());
                system.debug('cause: ' +ce.getCause());
    		system.debug('Line num: ' +ce.getLineNumber());
        }
    }
    public static void insertAccount()
    {
        try{
            Account a=new Account();
            insert a;
        }
        catch(DMLException de)
        {
            throw new CustomException('this is custom exception', de);
        }
    }
    
}