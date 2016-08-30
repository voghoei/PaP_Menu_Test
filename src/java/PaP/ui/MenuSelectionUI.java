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
public class MenuSelectionUI extends HttpServlet{
    
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
                System.out.println("***Not Login");
                return;
        }else{
                RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                request.setAttribute("loggedInUser",currentUser);
                System.out.println("***Login");
        }
        BeerControl beerCtrl = new BeerControl();
        ArrayList beers = beerCtrl.getBeerList();
        request.setAttribute("beers", beers);

        UnitControl unitCtrl = new UnitControl();
        ArrayList units =  unitCtrl.getUnitList();
        request.setAttribute("units", units);

        request.getRequestDispatcher("/menuSelection.ftl").forward(request,response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
            HttpSession session = request.getSession(true);
            request.setAttribute("baseContext", session.getServletContext().getContextPath());
            
            BeerControl beerCtrl = new BeerControl();
            ArrayList beers = beerCtrl.getBeerList();
            

            UnitControl unitCtrl = new UnitControl();
            ArrayList units =  unitCtrl.getUnitList();
            
            
            String strUnit = request.getParameter("unit");
            Long unitId = Long.parseLong(strUnit);
            
            
            String[] strBeerIds= request.getParameterValues("beerId");
            if(strBeerIds==null || strBeerIds.length == 0){
                request.setAttribute("error","Please select atleast 1 beer! ");
                RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                request.setAttribute("loggedInUser",currentUser);
                request.setAttribute("beers", beers);
                request.setAttribute("units", units);
                request.getRequestDispatcher("/menuSelection.ftl").forward(request,response);
                
            }
            
            if (strBeerIds.length > 10){
                request.setAttribute("error","Please select not more than 10 beers! ");
                RegisteredUser currentUser = (RegisteredUser)session.getAttribute("currentSessionUser");
                request.setAttribute("loggedInUser",currentUser);
                request.setAttribute("beers", beers);
                request.setAttribute("units", units);
                request.getRequestDispatcher("/menuSelection.ftl").forward(request,response);
            }
            
            ArrayList<Long> beerIds = new ArrayList<>();
            
            for (String bid : strBeerIds){
                Long beerId = Long.parseLong(bid);
                beerIds.add(beerId);
            }
            
            MenuControl ctrl = new MenuControl();
		

            try {

                if(ctrl.removeMeuByUnit(unitId)){

                    if (ctrl.addMenu(unitId, beerIds)){
                        response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/beerList") );
                    }else{
                   // request.setAttribute("error","Registration failed: "+ctrl.getError());
                        request.setAttribute("error","Cannot add menu");
                        request.getRequestDispatcher("/menuSelection.ftl").forward(request,response);
                    }

                }else{
                   // request.setAttribute("error","Registration failed: "+ctrl.getError());
                   request.setAttribute("error","Cannot remove menu");
                    request.getRequestDispatcher("/menuSelection.ftl").forward(request,response);
                }
            } catch (PaPException ex) {
                Logger.getLogger(BeerCreateUI.class.getName()).log(Level.SEVERE, null, ex);
            }	

    }
        
}
