public class pokemon{
    public Integer height;    //5
    public Integer id;    //56
    public String name;    //mankey
    public Integer order;    //95
    public cls_sprites sprites;
    public cls_types[] types;
    public Integer weight;    //280
    public class cls_sprites {
        //public String back_default;    //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/56.png
        //public cls_back_female back_female;
        //public String back_shiny;    //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/56.png
        //public cls_back_shiny_female back_shiny_female;
        public String front_default;    //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/56.png
        //public cls_front_female front_female;
        //public String front_shiny;    //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/56.png
        //public cls_front_shiny_female front_shiny_female;
    }
    class cls_back_female {
    }
    class cls_back_shiny_female {
    }
    class cls_front_female {
    }
    class cls_front_shiny_female {
    }
    public class cls_types {
        public Integer slot;    //1
        public cls_type type;
    }
    public class cls_type {
        public String name;    //fighting
        public String url;    //https://pokeapi.co/api/v2/type/2/
    }
    public static pokemon parse(String json){
        return (pokemon) System.JSON.deserialize(json, pokemon.class);
    }
}