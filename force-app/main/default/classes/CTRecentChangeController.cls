public with sharing class CTRecentChangeController {
 
    @AuraEnabled
    public static List<Person__c> getRecentPersonHealthChanges(){

        return CTPersonController.getRecentHealthChanges();
       
    }
    @AuraEnabled
    public static List<Location__c> getRecentLocationHealthChanges(){
        return CTLocationController.getRecentstatusChanges();
       
    }
    @AuraEnabled
    public static List<Person__c> SearchPeople(String searchTerm){
     return CTPersonController.searchPeople(searchTerm);  
    }
    @AuraEnabled
    public static List<Location__c> SearchLocation(String searchTerm){
        return CTLocationController.searchLocations(searchTerm);
    }
}
