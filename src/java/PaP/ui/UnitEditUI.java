/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.ui;

import PaP.PaPException;
import PaP.control.LoginControl;
import PaP.control.UnitControl;
import PaP.model.RegisteredUser;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abbas
 */
public class UnitEditUI extends HttpServlet{
    
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
        ArrayList units =  unitCtrl.getUnitById(id);
        request.setAttribute("unit", units.get(0));
        
//        System.out.println("*****************************************");
//        System.out.println(units.get(0));
//        System.out.println("*****************************************");

        request.getRequestDispatcher("/unitEdit.ftl").forward(request,response);


    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		request.setAttribute("baseContext", session.getServletContext().getContextPath());
                
                String strId = request.getParameter("id");
                long id = Long.parseLong(strId);
        
		String code = request.getParameter("code");
		String title = request.getParameter("title");
		String desc = request.getParameter("description");
                
		UnitControl ctrl = new UnitControl();		
                
            try {
                if(ctrl.updateUnit(id,title,code,desc)){
//                    response.sendRedirect("/unitList.ftl");
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
