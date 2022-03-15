public class Myuserext extends Myuser{
    public override void displayps()
    {
        position = 'adminuser';        
        system.debug('position ext:' +position);
    }
       
}