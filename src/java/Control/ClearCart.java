package Control;

import Model.ShoppingCart;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class ClearCart extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
        cart.emptyCart();

        try {
            forward("/HomePage.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(AddToCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }

}
