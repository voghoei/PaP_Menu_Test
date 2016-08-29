/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.ui;

import PaP.control.RegisterControl;
import PaP.control.UnitControl;
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
public class UnitListUI extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
            HttpSession session = request.getSession(true);
            request.setAttribute("baseContext", session.getServletContext().getContextPath());

            UnitControl unitCtrl = new UnitControl();
            ArrayList units =  unitCtrl.getUnitList();
            request.setAttribute("units", units);

            request.getRequestDispatcher("/unitList.ftl").forward(request,response);


    }
    
}
