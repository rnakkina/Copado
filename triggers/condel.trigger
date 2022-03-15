trigger condel on Contact (Before Delete) {

for(contact c : Trigger.old){

if(c.accountId == null)
{
//c.addError('You have to first delete the Accounts !');
}

}

}