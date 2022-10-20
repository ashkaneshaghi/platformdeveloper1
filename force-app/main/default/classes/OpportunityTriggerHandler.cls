global class OpportunityTriggerHandler {

    //Method to calculate Tax on opportunity
    private static void calculateTax(Opportunity opp){
        opp.Tax__c = (opp.Tax_Percentage__c/100) * opp.Amount;
        opp.Total_Price__c = opp.Tax__c + opp.Amount;
    }
    
    //Runs on Opportunity before insert
    global static void beforeInsert(List<Opportunity> newRecords){
        //Loop through new records
        for(Opportunity opp : newRecords){
            if(opp.Tax_Percentage__c != null){
                calculateTax(opp);
            }
        }
    }

    //Runs on Opportunity before update
    global static void beforeUpdate(Map<Id, Opportunity> newMap, Map<Id, Opportunity> oldMap){
        //Loop through new records
        for(Id oppId : newMap.keySet()){
            Opportunity newRecord = newMap.get(oppId);
            Opportunity oldRecord = oldMap.get(oppId);
            if(newRecord.Amount != oldRecord.Amount || newRecord.Tax_Percentage__c != oldRecord.Tax_Percentage__c){
                calculateTax(newRecord);
            }
        }
    }

}