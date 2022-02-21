package Control;

import Model.ShoppingCart;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

public class Summary extends FrontCommand {
        
    @Override
    public void process(){
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("shoppingCart");
        request.setAttribute("price", cart.getTotalPrice());
        request.setAttribute("igicPrice", cart.getTotalPriceWithIgic());
        
        try {
            forward("/SummaryPage.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(IncreaseValue.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}