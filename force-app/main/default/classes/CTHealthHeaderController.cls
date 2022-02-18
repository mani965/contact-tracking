public with sharing class CTHealthHeaderController {
  
 @AuraEnabled
 public static Map<String, Integer> getPersonHealthStatusCount(){
    return CTPersonController.getHealthstatusCount();
}
@AuraEnabled
public static Map<String,Integer> getLocationHealthStatusCount(){
    return CTLocationController.getHealthstatusCount();
  
}
}