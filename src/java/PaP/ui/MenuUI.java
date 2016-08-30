/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.ui;

import PaP.PaPException;
import PaP.control.BeerControl;
import PaP.control.LoginControl;
import PaP.control.MenuControl;
import PaP.control.UnitControl;
import PaP.model.RegisteredUser;
import PaP.model.Unit;
import PaP.model.Beer;
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
public class MenuUI extends HttpServlet{
    
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
        MenuControl menuCtrl = new MenuControl();
        ArrayList<Unit> units = menuCtrl.getMenuList();
        request.setAttribute("units", units);       
        request.getRequestDispatcher("/menu.ftl").forward(request,response);
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		request.setAttribute("baseContext", session.getServletContext().getContextPath());
		
                String unit = request.getParameter("unit");		
                long unitId = Long.parseLong(unit);                
                
//		UnitControl ctrl = new UnitControl();
                BeerControl ctrl = new BeerControl();
            try {
                ArrayList<Beer> beers = new ArrayList<Beer>();
                
                beers = ctrl.getBeerByUnitId(unitId);
                
                int count = beers.size();

                System.out.println(count);
                if(count > 0 ){
                    request.setAttribute("beers", beers);       
                    request.getRequestDispatcher("/show.ftl").forward(request,response);
//                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/unitList") );
                }else{
                    request.setAttribute("error","No Such menu exist");
                    request.getRequestDispatcher("/unit.ftl").forward(request,response);
                }
            } catch (Exception ex) {
                Logger.getLogger(UnitCreateUI.class.getName()).log(Level.SEVERE, null, ex);
            }	
			
	}
    
    
}
