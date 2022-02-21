/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import Model.Catalogue;
import Model.Product;
import java.io.InputStream;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;

/**
 *
 * @author Entrar
 */
public class JsonManager {
    Catalogue data = Catalogue.getInstance();
    
    public Catalogue getCatalogue() {
        InputStream is = getClass().getResourceAsStream("books.json");
        
        if(is == null){
            throw new RuntimeException("books.json is missing.");
        }
            JsonArray array = Json.createReader(is).readArray();

            for(int i=0;i<array.size();i++){
                JsonObject obj = (JsonObject) array.get(i);
                Product aux = new Product(i+1, obj.getString("title"), obj.getString("author"), obj.getString("imageLink"), obj.getJsonNumber("price").doubleValue());
                data.addLibro(aux);
            }
        
        return data;
    }
}
