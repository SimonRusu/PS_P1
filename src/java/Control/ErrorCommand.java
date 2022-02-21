package Control;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;

class ErrorCommand extends FrontCommand{

    @Override
    public void process() {
        try {
            forward("/ErrorPage.jsp");
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ErrorCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}