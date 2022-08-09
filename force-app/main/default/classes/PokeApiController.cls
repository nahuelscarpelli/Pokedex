public with sharing class PokeApiController {
    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] getAllPokemons() {
        return [
            SELECT
                Id,
                Name,
                Tipo__c,
                Altura__c,
                Peso__c,
                Generacion__c,
                Foto_URL__c,
                PokeIndex__c
            FROM Pokemon__c
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 898
        ];
    }

    @AuraEnabled(Cacheable=true)
    public static Pokemon__c[] searchPokemons(String searchTerm, Integer searchGen, String searchTipo) {
        
        // Prepare query paramters
        searchTerm = '%' + searchTerm + '%';

        // Condicional de filtro si NINGÚN CAMPO TIENE DATOS
        if (String.isBlank(searchTipo) && searchGen == null && String.isBlank(searchTerm)) {
            return getAllPokemons();
        // Condicional de filtro si SOLAMENTE EL CAMPO DE BUSQUEDA TIENE DATOS
        }else if(!String.isBlank(searchTerm) && searchGen == null && String.isBlank(searchTipo)){
        return [
            SELECT
            Id,
            Name,
            Tipo__c,
            Altura__c,
            Peso__c,
            Generacion__c,
            Foto_URL__c,
            PokeIndex__c
            FROM Pokemon__c
            WHERE Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 898
            ];
        // Condicional de filtro si SOLAMENTE EL CAMPO DE BUSQUEDA Y GENERACION TIENEN DATOS
        } else if(String.isBlank(searchTipo)){
            return [
            SELECT
            Id,
            Name,
            Tipo__c,
            Altura__c,
            Peso__c,
            Generacion__c,
            Foto_URL__c,
            PokeIndex__c
            FROM Pokemon__c
            WHERE Generacion__c =:searchGen
            AND Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 898
            ];
        // Condicional de filtro si SOLAMENTE EL CAMPO DE BUSQUEDA Y TIPO TIENEN DATOS
        } else if(searchGen == null){
            return [
            SELECT
            Id,
            Name,
            Tipo__c,
            Altura__c,
            Peso__c,
            Generacion__c,
            Foto_URL__c,
            PokeIndex__c
            FROM Pokemon__c
            WHERE Tipo__c INCLUDES(:searchTipo)
            AND Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 898
            ];
        // Condicional de filtro si SOLAMENTE EL CAMPO DE TIPO TIENE DATOS
        } else if(!String.isBlank(searchTipo) && String.isBlank(searchTerm) && searchGen == null){
        return [
        SELECT
        Id,
        Name,
        Tipo__c,
        Altura__c,
        Peso__c,
        Generacion__c,
        Foto_URL__c,
        PokeIndex__c
        FROM Pokemon__c
        WHERE Tipo__c INCLUDES(:searchTipo)
        WITH SECURITY_ENFORCED
        ORDER BY PokeIndex__c
        LIMIT 898
        ];
        // Condicional de filtro si SOLAMENTE EL CAMPO DE TIPO y GENERACION TIENEN DATOS
    } else if(!String.isBlank(searchTipo) && String.isBlank(searchTerm)){
        return [
        SELECT
        Id,
        Name,
        Tipo__c,
        Altura__c,
        Peso__c,
        Generacion__c,
        Foto_URL__c,
        PokeIndex__c
        FROM Pokemon__c
        WHERE Tipo__c INCLUDES(:searchTipo)
        AND Generacion__c =:searchGen
        WITH SECURITY_ENFORCED
        ORDER BY PokeIndex__c
        LIMIT 898
        ];
        // Condicional de filtro si SOLAMENTE EL CAMPO GENERACION TIENE DATOS
        } else if(String.isBlank(searchTipo) && String.isBlank(searchTerm)){
        return [
        SELECT
        Id,
        Name,
        Tipo__c,
        Altura__c,
        Peso__c,
        Generacion__c,
        Foto_URL__c,
        PokeIndex__c
        FROM Pokemon__c
        WHERE Generacion__c =:searchGen
        WITH SECURITY_ENFORCED
        ORDER BY PokeIndex__c
        LIMIT 898
        ];
        // Condicional de filtro si TODOS TIENEN DATOS
        }else{
            return [
            SELECT
            Id,
            Name,
            Tipo__c,
            Altura__c,
            Peso__c,
            Generacion__c,
            Foto_URL__c,
            PokeIndex__c
            FROM Pokemon__c
            WHERE Generacion__c =:searchGen
            AND Tipo__c INCLUDES(:searchTipo)
            AND Name LIKE :searchTerm
            WITH SECURITY_ENFORCED
            ORDER BY PokeIndex__c
            LIMIT 898
            ];
        }
    }
}
