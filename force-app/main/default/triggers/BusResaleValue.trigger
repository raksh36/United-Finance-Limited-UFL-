trigger BusResaleValue on Bus__c (before insert, before update) {
    for(Bus__c bus:Trigger.New){
        if(bus.Current_Status__c == 'Ready for Use'){
            if(Integer.valueOf(bus.Maximum_Capacity__c) <= 24){
                if(bus.Year__c.year() <= 1972 ){
                    bus.Resale_Value__c = (bus.Air_Conditioning__c ? (120000 + (1200 * 34) + (1200 * 3)) : (120000 + 1200 * 34)) - (bus.Odometer_Reading__c > 100000? (bus.Odometer_Reading__c - 100000)*0.1 : 0);
                }
                else{
                    bus.Resale_Value__c = (bus.Air_Conditioning__c ? (120000 + (1200 * 3)) : (120000)) - (bus.Odometer_Reading__c > 100000? (bus.Odometer_Reading__c - 100000)*0.1 : 0);
                }
                
            }
            else{
                if(bus.Year__c.year() <= 1972){
                    bus.Resale_Value__c = (bus.Air_Conditioning__c ? (160000 + (1600 * 3) + (1600 * 34)) : (160000 + 1600 * 34)) - (bus.Odometer_Reading__c > 100000? (bus.Odometer_Reading__c - 100000)*0.1 : 0);
                }
                else{
                    bus.Resale_Value__c = (bus.Air_Conditioning__c ? (160000 + (1600 * 3)) : (160000)) - (bus.Odometer_Reading__c > 100000? (bus.Odometer_Reading__c - 100000)*0.1 : 0);
                }
                
            }           
        }
        else{
            bus.Resale_Value__c = 0;
        }
    }
}