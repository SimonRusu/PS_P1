/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author Entrar
 */
public class Catalogue {
    
    private ArrayList<Product> catalogue = new ArrayList<>();
    private static Catalogue instance;
    
    public static Catalogue getInstance(){
        if(instance == null){
            instance = new Catalogue();
        }
        return instance;
    }
    
    public void addLibro(Product book){
        catalogue.add(book);
    }
    
    public ArrayList<Product> getCatalogue(){
        return catalogue;
    }
    
    public Product findProduct(int id){
        Product product = null;
        
        for(Product p: getCatalogue()){
            if(p.getId() == id){
                product = p;
            }
        }
        return product;
    }
}
