/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Simon Teodor Rusu Stratulat
 */
public class Product {
    private String title,autor,image;
    private int id;
    private double price;

    public Product(int id, String title, String autor, String image, double price) {
        this.title = title;
        this.autor = autor;
        this.image = image;
        this.id = id;
        this.price = price;
    }
    
    public String getTitle() {
        return title;
    }

    public String getAutor() {
        return autor;
    }

    public String getImage() {
        return image;
    }

    public int getId() {
        return id;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Libro{" + "title=" + title + ", autor=" + autor + ", image=" + image + ", id=" + id + ", price=" + price + '}';
    }

    
    
}


