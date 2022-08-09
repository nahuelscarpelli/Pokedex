@isTest
public with sharing class PokeApiControllerTest {
    public static List<Pokemon__c> pokLst = new List<Pokemon__c>();

    @isTest
    static void testFilter(){
        List<Pokemon__c>PokemonList = new List<Pokemon__c>();
        String searchTerm = 'Hoothoot';
        String tipo = 'Normal, Flying';
        Integer generacion = 1;
        Test.startTest();
        PokemonList = PokeApiController.searchPokemons();
        Test.stopTest();
        try{
            System.assertEquals(PokemonList[0].Name, 'Hoothoot', 'No coincide');
            System.assertEquals(PokemonList[0].Foto_URL__c, 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/163.png', 'La imagen no es la correcta');
            System.assertEquals(PokemonList[0].Peso__c, '212 (lb)', 'No coincide el peso');
            System.assertEquals(PokemonList[0].Altura__c, '7 (ft)', 'No coincide la altura');
            System.assertEquals(PokemonList[0].Generacion__c, 1, 'No coincide la generacion');
            System.assertEquals(PokemonList[0].Tipo__c, 'Normal;Flying', 'No coincide el tipo');
            System.assertEquals(PokemonList[0].PokeIndex__c, 163, 'No coincide el pokeindex');
        }catch (Exception e) {
            System.debug('Error en el filtro');
        }
    }
    @isTest 
    static void testGetAllPokemons(){
        List<Pokemon__c>PokemonList = new List<Pokemon__c>();
        Test.startTest();
        PokemonList = PokeApiController.getAllPokemons();
        Test.stopTest();
        try{
            System.assertEquals(PokemonList[0].Name,'Calyrex', 'No coincide');
            System.assertEquals(PokemonList[0].Foto_URL__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/898.png', 'No coincide');
            System.assertEquals(PokemonList[0].Peso__c,'77 (lb)', 'No coincide el peso');
            System.assertEquals(PokemonList[0].Altura__c,'11 (ft))', 'No coincide');
            System.assertEquals(PokemonList[0].Generacion__c, 8, 'No coincide la generacion');
            System.assertEquals(PokemonList[0].Tipo__c,'Grass;Psychic', 'No coincide el tipo');
            System.assertEquals(PokemonList[0].PokeIndex__c, 897, 'No coincide el indice');            
        } catch (Exception e) {
            System.debug('Sin Pokemons!');
        }
    }
}