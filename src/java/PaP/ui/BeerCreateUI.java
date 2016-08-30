
package PaP.ui;

import PaP.PaPException;
import PaP.control.LoginControl;
import PaP.control.BeerControl;
import PaP.model.RegisteredUser;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BeerCreateUI extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
            request.setAttribute("baseContext", session.getServletContext().getContextPath());
            LoginControl ctrl = new LoginControl();
            if(!ctrl.checkIsLoggedIn(session)){
                    response.sendRedirect(session.getServletContext().getContextPath()+"/login");
                    request.setAttribute("loggedInUser","");
                    request.removeAttribute("loggedInUser");
                    return;
            }else{
                    RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                    request.setAttribute("loggedInUser",currentUser);
            }
		request.getRequestDispatcher("/beer.ftl").forward(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		request.setAttribute("baseContext", session.getServletContext().getContextPath());
		String code = request.getParameter("code");
		String name = request.getParameter("name");
                String brand = request.getParameter("brand");
                String type = request.getParameter("type");
                double abv = Double.parseDouble(request.getParameter("ABV"));
                int ibu = Integer.parseInt(request.getParameter("IBU"));
		String desc = request.getParameter("description");
                
		BeerControl ctrl = new BeerControl();		

            try {
                
                if(ctrl.attemptToRegister(code, name, brand, type, abv, ibu, desc)){
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/beerList") );
                }else{
                   // request.setAttribute("error","Registration failed: "+ctrl.getError());
                   request.setAttribute("error","Registration failed: "+code+", "+name+", "+brand+", "+type+", "+abv+", "+ibu+", "+desc);
                    request.getRequestDispatcher("/beer.ftl").forward(request,response);
                }
            } catch (PaPException ex) {
                Logger.getLogger(BeerCreateUI.class.getName()).log(Level.SEVERE, null, ex);
            }	
			
	}
}
