public class APICalloutExample {
	
    @Future(callout=true)
    public static void doCallout(){
        String url = 'https://dog.ceo/api/breed/hound/list';
        // Instantiate a new http object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        
        System.debug('RESPONSE: ' + res.getBody());
    }
    
    
    @AuraEnabled
    public static String doCalloutFromLWC(String breedName){
        String url = 'https://dog.ceo/api/breed/'+ breedName +'/list';
        // Instantiate a new http object
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        
        System.debug('RESPONSE: ' + res.getBody());
        
        return res.getBody();
    }
}