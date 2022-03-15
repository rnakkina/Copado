@isTest
public class Contest {
    @isTest static void test1() {
        Contact C1 = new Contact(Lastname = 'pks', FirstName='Fname',  RecordTypeId = '0123i000000YhM6AAK', Patient__c=true, Gender__c ='Male', Type__c = 'None', Phone ='4162099876');
        Test.startTest();
        // Call method to publish events
        insert c1;
        Test.stopTest();
        // Perform validation here
        Contact con = [SELECT Id, Description FROM Contact where Lastname = 'pks' limit 1];
        // Validate that this case was found.
        // There is only one test case in test context.
        System.assertEquals('NRK portal contact:Insert', con.Description);
        
    }
}