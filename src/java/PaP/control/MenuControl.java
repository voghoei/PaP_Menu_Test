/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PaP.control;

import PaP.PaPException;
import PaP.model.Beer;
import PaP.model.Menu;
import PaP.model.Unit;
import PaP.model.ObjectModel;
import PaP.model.impl.ObjectModelImpl;
import PaP.persistence.Persistence;
import PaP.persistence.impl.DbUtils;
import PaP.persistence.impl.PersistenceImpl;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author abbas
 */
public class MenuControl {
    private Connection conn = null;
    private ObjectModel objectModel = null;
    private Persistence persistence = null;
    private String error="Error Unknown";
    private boolean hasError = false;

    private void connect() throws PaPException{

                    conn = DbUtils.connect();
                    objectModel = new ObjectModelImpl();
                    persistence = new PersistenceImpl(conn,objectModel);
                    objectModel.setPersistence(persistence);

    }
    private void close(){
            try{
                    conn.close();
            }catch (Exception e){
                    System.err.println("Exception: "+e);
            }
    }
    
    public boolean addMenu(Long unitId, ArrayList<Long> beerIds)throws PaPException{
        try{
            connect();

            for (long bid : beerIds){

                Menu modelMenu = objectModel.createMenu();
                Beer modelBeer = objectModel.createBeer();
                modelBeer.setId(bid);

                Unit modelUnit = objectModel.createUnit();
                modelUnit.setId(unitId);

                modelMenu.setBeer(modelBeer);
                modelMenu.setUnit(modelUnit);

                objectModel.storeMenu(modelMenu);

            }
			
        }catch(PaPException e){
                error = e.getMessage();
                return false;
        }finally{
                close();
        }
        return true;
    }
    
    public ArrayList<Unit> getMenuList(){
            try{
                    
                    this.connect();
			
                    Iterator<Unit> units = this.objectModel.getMenu();
                    ArrayList<Unit> unitsMap = new ArrayList<Unit>();

                    while(units.hasNext()){				
                            unitsMap.add(units.next());
                    }		
                    return unitsMap;
            }catch(PaPException e){
                    error = e.getMessage();
                    hasError=true;
                    return null;
            }finally{
                    this.close();
            }
    }

    public boolean removeMeuByUnit(long unitId) throws PaPException{
        try{
            this.connect();
            Menu menu = objectModel.createMenu();

            Unit unit = objectModel.createUnit();
            unit.setId(unitId);

            menu.setUnit(unit);

            objectModel.deleteMenuByUnit(unit);               
            
            return true;

        }catch(PaPException e){
            error = e.getMessage();
            hasError=true;
            e.printStackTrace();
                return false;
        }finally{
            this.close();
        }

    }
    
}
