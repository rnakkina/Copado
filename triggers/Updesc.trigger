trigger Updesc on Contact (before Insert, before Update) {

for (Contact c:Trigger.new){
  if(Trigger.isInsert)
  {
  c.Description = 'NRK portal contact:Insert';
  }
  else if(Trigger.isUpdate)
  {
    c.Description = 'NRK portal contact:Update';
  }
}

}