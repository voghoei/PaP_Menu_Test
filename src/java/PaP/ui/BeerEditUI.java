/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.ui;

import PaP.PaPException;
import PaP.control.LoginControl;
import PaP.control.BeerControl;
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
 * @author Sahar
 */
public class BeerEditUI extends HttpServlet{
    
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
        
        BeerControl beerCtrl = new BeerControl();                
        ArrayList beers =  beerCtrl.getBeerById(id);
        request.setAttribute("beer", beers.get(0));
        
//        System.out.println("*****************************************");
//        System.out.println(beers.get(0));
//        System.out.println("*****************************************");

        request.getRequestDispatcher("/beerEdit.ftl").forward(request,response);


    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		HttpSession session = request.getSession(true);
		request.setAttribute("baseContext", session.getServletContext().getContextPath());
                
                String strId = request.getParameter("id");
                long id = Long.parseLong(strId);
        
		String code = request.getParameter("code");
		String name = request.getParameter("name");
                String brand = request.getParameter("brand");
                String type = request.getParameter("type");
                double abv = Double.parseDouble(request.getParameter("ABV"));
                int ibu = Integer.parseInt(request.getParameter("IBU"));
		String desc = request.getParameter("description");
                String logoPath = request.getParameter("logoPath");
                
		BeerControl ctrl = new BeerControl();		
                
            try {
                if(ctrl.updateBeer(id, code, name, brand, type, abv, ibu, desc,logoPath)){
//                    response.sendRedirect("/beerList.ftl");
                    response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/beerList") );
                }else{
                    request.setAttribute("error","Registration failed: "+ctrl.getError());
                    request.getRequestDispatcher("/beer.ftl").forward(request,response);
                }
            } catch (PaPException ex) {
                Logger.getLogger(BeerCreateUI.class.getName()).log(Level.SEVERE, null, ex);
            }	
			
	}
}
