global class BatchCalloutPokeAPI implements Database.Batchable<Pokemon__c>, Database.AllowsCallouts, Database.Stateful{

    public List<Pokemon__c> pokLst; 
    public BatchCalloutPokeAPI(List<Pokemon__c> pokLst){
        this.pokLst = pokLst;
     }
        
        global Iterable<Pokemon__c> start(Database.BatchableContext BC){
            return pokLst;
         }
         
         global void execute(Database.BatchableContext BC, List<Pokemon__c> ListPokemonToInsert){
          
     try{   
         HttpRequest req = new HttpRequest();
         Http http = new Http();
         req.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + ListPokemonToInsert[0].PokeIndex__c);
         req.setMethod('GET');
         HttpResponse res = http.send(req);
         req.setHeader('Content-Type', 'application/json');
         String body = res.getBody();
         pokemon pok = pokemon.parse(body);
         
         if(res.getStatusCode() == 200){
         Pokemon__c pokemonObject = new Pokemon__c();
         pokemonObject.Name = pok.name.Capitalize();
         pokemonObject.Altura__c = pok.height.format() + ' (ft)';
         pokemonObject.Foto_URL__c= pok.sprites.front_default;
         pokemonObject.Peso__c = pok.weight + ' (lb)';
         pokemonObject.PokeIndex__c = pok.id;
 
                 if(pok.id <= 151){
                     pokemonObject.Generacion__c = 1;
                 }else if(pok.id >= 152 && pok.id <=251){
                     pokemonObject.Generacion__c = 2;
                 }else if(pok.id >= 252 && pok.id <=386){
                     pokemonObject.Generacion__c = 3;
                 }else if(pok.id >= 387 && pok.id <=493){
                     pokemonObject.Generacion__c = 4;
                 }else if(pok.id >= 494 && pok.id <=649){
                     pokemonObject.Generacion__c = 5;
                 }else if(pok.id >= 650 && pok.id <=721){
                     pokemonObject.Generacion__c = 6;
                 }else if(pok.id >= 722 && pok.id <=809){
                     pokemonObject.Generacion__c = 7;
                 }else if(pok.id >= 810){
                     pokemonObject.Generacion__c = 8;
                 }
                 for (Integer i=0 ; i< pok.types.size() ; i++){
                     pokemonObject.Tipo__c = pokemonObject.Tipo__c == null ? 
                     pok.types[i].type.name : pokemonObject.Tipo__c + ';' + pok.types[i].type.name;
                 }  
             
                 insert pokemonObject;
             }
     }catch(Exception e){
         System.debug('ERROR :'+ e);
         }
         
     }   
    
    global void finish(Database.BatchableContext BC){
 
         System.debug('El batch se terminó de ejecutar');
 
    }
 
 }