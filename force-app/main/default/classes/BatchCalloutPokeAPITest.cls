@isTest
public with sharing class BatchCalloutPokeAPITest{
    public static List<Pokemon__c> pokLst = new List<Pokemon__c>();
    
    @isTest
static void statuserror(){
    BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock (401, 'ERROR', 'PokeAPP no está funcionando', null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);

    test.startTest();
    BatchCalloutPokeAPI batchTest = new BatchCalloutPokeAPI(pokLst);
    Database.executeBatch(batchTest);
    test.stopTest();

    try{
    List<Pokemon__c> listaTest = [SELECT Name, Altura__c, Foto_URL__c, Peso__c, 
                                    PokeIndex__c, Generacion__c, Tipo__c
                                    FROM Pokemon__c];

    System.assertEquals(0,listaTest.size(),'No se insertaron Pokemons');
}catch(Exception e){
    System.debug('ERROR' + e);
}
}

    @isTest 
    static void primeraGenTest(){
        pokLst.add(new Pokemon__c(name ='https://pokeapi.co/api/v2/pokemon/1'));

        String body = '{"height": 5,"id": 1,"name": "treecko","sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 50}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Treecko','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '5 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '50 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 1,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 1,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }    

    @isTest 
    static void segundaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/152'));

        String body = '{"height": 9,"id": 152,"name": "chikorita","sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 64}';

        
        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Chikorita','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '9 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '64 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/152.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 2,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 152,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }
    @isTest 
    static void terceraGenTest(){
        pokLst.add(new Pokemon__c(name ='https://pokeapi.co/api/v2/pokemon/252'));

        String body = '{"height": 5,"id": 252,"name": "treecko","sprites":{"front_default":"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 50}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Treecko','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '5 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '50 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 3,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 252,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }

    @isTest 
    static void cuartaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/387'));

        String body = '{"height": 4,"id": 387,"name": "turtwig","sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/387.png"},"types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"weight": 102}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Turtwig','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '4 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '102 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/387.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 4,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 387,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void quintaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/494'));

        String body = '{"name": "victini","height": 4,"weight": 40,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/494.png"}, "types":[{"slot":1,"type":{"name": "psychic","url": "https://pokeapi.co/api/v2/type/14/"}}],"id": 494}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Victini','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '4 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '40 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/494.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Psychic','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 5,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 494,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void sextaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/650'));

        String body = '{"name": "chespin","height": 4,"weight": 90,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/650.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 650}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Chespin','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '4 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '90 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/650.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 6,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 650,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void septimaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/722'));

        String body = '{"name": "rowlet","height": 3,"weight": 15,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/722.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 722}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Rowlet','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '3 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '15 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/722.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 7,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 722,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }


    @isTest 
    static void octavaGenTest(){
        pokLst.add(new Pokemon__c(name = 'https://pokeapi.co/api/v2/pokemon/810'));

        String body = '{"name": "grookey","height": 3,"weight": 50,"sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/810.png"}, "types":[{"slot":1,"type":{"name": "grass","url": "https://pokeapi.co/api/v2/type/12/"}}],"id": 810}';

        BatchCalloutPokeAPIMock fakeResponse = new BatchCalloutPokeAPIMock(200, 'Complete', body, null);

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
            BatchCalloutPokeAPI batch = new BatchCalloutPokeAPI(pokLst);
            Database.executeBatch(batch, 1);
        Test.stopTest();

        try {
            List<Pokemon__c> listaDB = [SELECT Name, Altura__c, Peso__c, Foto_URL__c, 
                                    Tipo__c, Generacion__c, PokeIndex__c FROM Pokemon__c];

        System.assertEquals(listaDB[0].Name, 'Grookey','Nombre no coincide');
        System.assertEquals(listaDB[0].Altura__c, '3 (ft)','Altura no coincide');
        System.assertEquals(listaDB[0].Peso__c, '50 (lb)','Peso no coincide');
        System.assertEquals(listaDB[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/810.png','Foto no coincide');
        System.assertEquals(listaDB[0].Tipo__c, 'Grass','Tipo no coincide');
        System.assertEquals(listaDB[0].Generacion__c, 8,'Generación no coincide');
        System.assertEquals(listaDB[0].PokeIndex__c, 810,'Id no coincide');
        } catch (Exception e) {
            System.debug('Error');
        }
    }
}