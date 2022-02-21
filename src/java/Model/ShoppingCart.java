package Model;

import java.util.HashMap;

public class ShoppingCart {
    private final HashMap<Integer, Integer> cart = new HashMap<>();
    
public HashMap<Integer, Integer> getCart() {
        return cart;
    }
    
    public void addItem(int id)
    {
        if(! cart.containsKey(id))
        {
            cart.put(id,1);
        }
    }
        
    public void deleteItem(int id)
    {
        cart.remove(id);
    }
    
        
    public void emptyCart()
    {
        cart.clear();
    }
    
    public void increase(int id) 
    {
        if(cart.containsKey(id))
        {
            int quantity = cart.get(id) + 1;
            cart.put(id, quantity);
        }
    }
    
    public void decrease(int id) 
    {
        if(cart.containsKey(id))
        {
            int quantity = cart.get(id);
            if(quantity > 1)
            {
                quantity = quantity - 1;
                cart.put(id, quantity);
            }
            
        }
    }
    
    public double getTotalPrice()
    {
        double total = 0;
        for (int id : cart.keySet()) {
            Product product = Catalogue.getInstance().findProduct(id);
            total += product.getPrice() * cart.get(id);
            total = (double)Math.round(total * 100d) / 100d;
        }
        return total;
    }
    
    public double getTotalPriceWithIgic(){
        double total = getTotalPrice()+ getTotalPrice()*0.07;
        return (double)Math.round(total * 100d) / 100d;
    }

}
