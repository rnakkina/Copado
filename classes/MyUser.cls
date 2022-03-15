public virtual class MyUser {
    public string userfstname;
    public string userlstname;
    public string type;
    public string position;
    public Myuser()
    {
        userfstname= 'ram';
        userlstname = 'n';
        position = 'normaluser';
    }
    public void display()
    {
        system.debug('First Name:' +userfstname);
        system.debug('Last Name:' +userlstname);
        system.debug('type:' +type);
    }
    public virtual void displayps()
    {
        system.debug('position:' +position);
    }
}