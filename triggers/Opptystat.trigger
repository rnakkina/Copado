trigger Opptystat on Opportunity (before Update) {

for(Opportunity opp: Trigger.new){

Opportunity oldopp = Trigger.OldMap.get(opp.Id);
Boolean oldoppst = oldopp.StageName.equals('Closed Won');
Boolean newoppst = opp.StageName.equals('Closed Won');

if(!oldoppst && newoppst){

opp.Description='Closed Won updated';
}

}

}