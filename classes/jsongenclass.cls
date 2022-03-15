@RestResource (urlMapping='/jsongen/*')
Global class jsongenclass {

    @HttpGet
    Global static void accountdtls()
    {
			List<Contact> conList = [SELECT Id, FirstName, LastName From Contact where Id='0033i000007Usxe'];
        	String St = '';
			if(!conList.isEmpty()){
    			JSONGenerator gen = JSON.createGenerator(true);
            gen.writeStartObject(); 
    			gen.writeFieldName('Contacts');
                gen.writeStartObject();
                        gen.writeFieldName('Contact');    
                    					gen.writeStartArray();
    				for(Contact con :conList){
                         gen.writeStartObject();
        					gen.writeStringField('Id', con.Id);
        					gen.writeStringField('FirstName', con.FirstName);
                        	gen.writeStringField('LastName', con.LastName);
                        			gen.writeFieldName('Addresses');
                        				gen.writeStartObject();
                                			            String st1=con.Id;
                        								
                        								gen.writeFieldName('Address');
                        								List<Contact_Addresses__c> ConAddList = [select Address__c FROM Contact_Addresses__c where Contact__c=:st1];
                                                         gen.writeStartArray();
                                                       for(Contact_Addresses__c CAD: ConAddList)
                                                        {
                                                          Address__C A = [SELECT Id, Address_Line1__c, Address_Line2__c  FROM Address__c where Id =:CAD.Address__c];  
                                                        String ADL1 = '';
                                                            ADL1 = A.Address_Line1__c;
                                                            String ADL2 = '';
                                                            if(A.Address_Line2__c!=null)
                                                            { ADL2 = A.Address_Line2__c;}
                                                            else {ADL2 = ' ';}
                                                            gen.writeStartObject();
                                                         
														gen.writeStringField('Addline1', ADL1);
                                                        gen.writeStringField('Addline2', ADL2);
                                                        gen.writeStringField('Id', A.Id);
                                                            gen.writeEndObject();
                        								}
                        								gen.writeEndArray();
                        				gen.writeEndObject();                  
        				gen.writeEndObject();
    				}    
    									gen.writeEndArray();
                gen.writeEndObject();
             gen.writeEndObject();
    				   				St = gen.getAsString();
			}
        RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(st);  
    				
        
    }
    
}