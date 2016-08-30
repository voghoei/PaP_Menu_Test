/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.ui;

import PaP.control.LoginControl;
import PaP.control.UnitControl;
import PaP.model.RegisteredUser;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abbas
 */
public class UnitDeleteUI extends HttpServlet{
    
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
                    return;
            }else{
                    RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                    request.setAttribute("loggedInUser",currentUser);
            }

            String strId = request.getParameter("id");
            long id = Long.parseLong(strId);
        
            UnitControl unitCtrl = new UnitControl();
            unitCtrl.removeUnit(id);
                       
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/unitList") );


    }
    
}
