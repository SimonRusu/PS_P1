package Control;

import Model.Catalogue;
import Model.ShoppingCart;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class IncreaseValue extends FrontCommand {
        
    @Override
    public void process(){
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
        
        Catalogue catalogue = Catalogue.getInstance();
        int id = Integer.valueOf(request.getParameter("id"));
        if (catalogue.findProduct(id) != null){
            cart.increase(id);
        }  
        try {
            forward("/CartPage.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(IncreaseValue.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}

