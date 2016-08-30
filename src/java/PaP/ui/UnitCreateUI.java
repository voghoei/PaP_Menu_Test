
package PaP.ui;

import PaP.PaPException;
import PaP.control.LoginControl;
import PaP.control.RegisterControl;
import PaP.control.UnitControl;
import PaP.model.RegisteredUser;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UnitCreateUI extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
            request.setAttribute("baseContext", session.getServletContext().getContextPath());
            String error = "Error unknown";
            LoginControl ctrl = new LoginControl();
            if(!ctrl.checkIsLoggedIn(session)){
                    response.sendRedirect(session.getServletContext().getContextPath()+"/login");
                    request.setAttribute("loggedInUser","");
                    request.removeAttribute("loggedInUser");
//                    System.out.println("***Not Login");
                    return;
            }else{
                    RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                    request.setAttribute("loggedInUser",currentUser);
//                    System.out.println("***Login");
            }
		request.getRequestDispatcher("/unit.ftl").forward(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		request.setAttribute("baseContext", session.getServletContext().getContextPath());
		String code = request.getParameter("code");
		String title = request.getParameter("title");
		String desc = request.getParameter("description");
                
		UnitControl ctrl = new UnitControl();		

            try {
                if(ctrl.attemptToRegister(title,code,desc)){
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/unitList") );
                }else{
                    request.setAttribute("error","Registration failed: "+ctrl.getError());
                    request.getRequestDispatcher("/unit.ftl").forward(request,response);
                }
            } catch (PaPException ex) {
                Logger.getLogger(UnitCreateUI.class.getName()).log(Level.SEVERE, null, ex);
            }	
			
	}
}
