package PaP.control;

import PaP.PaPException;
import PaP.model.ObjectModel;
import PaP.model.RegisteredUser;
import PaP.model.Unit;
import PaP.model.impl.ObjectModelImpl;
import PaP.persistence.Persistence;
import PaP.persistence.impl.DbUtils;
import PaP.persistence.impl.PersistenceImpl;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

public class UnitControl{

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
	/** 
		attemptToRegister
		@return true if user was successfully added. false is an error occurred
	*/
	public boolean attemptToRegister(String title, String code, String desc)throws PaPException{
		try{
		connect();
		Unit modelUnit = objectModel.createUnit();
		modelUnit.setTitle(title);
		modelUnit.setCode(code);
		modelUnit.setDesc(desc);
		
		
		objectModel.storeUnit(modelUnit);			
		}catch(PaPException e){
			error = e.getMessage();
			return false;
		}finally{
			close();
		}
		return true;
	}
        
        public ArrayList<Unit> getUnitList(){
		try{
			this.connect();
			Unit modelUnit = this.objectModel.createUnit();
                        Iterator<Unit> units = this.objectModel.findUnit(modelUnit);
			ArrayList<Unit> unitsMap = new ArrayList<Unit>();
                        
			while(units.hasNext()){				
				unitsMap.add(units.next());
			}
//			error = Integer.toString(categoriesMap.size());		
			return unitsMap;	
		}catch(PaPException e){
			error = e.getMessage();
			hasError=true;
			return null;
		}finally{
			this.close();
		}
	}
        
        public ArrayList<Unit> getUnitById(long unitId){
            try{
                    
                this.connect();
                Unit unit = null ;
                
                ArrayList<Unit> result = new ArrayList<Unit>();
                
                Unit modelUnit = this.objectModel.createUnit();
                modelUnit.setId(unitId);

                Iterator<Unit> unitIter = null;                                                
                unitIter = objectModel.findUnit(modelUnit);

                if (unitIter.hasNext()) {
                    unit = unitIter.next();  
                    result.add(unit);
                }
                return result;
            }
            catch(PaPException e) {
                this.hasError = true;
                this.error = e.getMessage();
                return null;
            }
            finally {
                this.close();
            }

	}
        
        public boolean updateUnit(Long id, String title, String code, String desc)throws PaPException{
		try{
		connect();
		Unit modelUnit = objectModel.createUnit();
                modelUnit.setId(id);
		modelUnit.setTitle(title);
		modelUnit.setCode(code);
		modelUnit.setDesc(desc);                                       		
		
		objectModel.storeUnit(modelUnit);			
		}catch(PaPException e){
			error = e.getMessage();
			return false;
		}finally{
			close();
		}
		return true;
	}
        
        public void removeUnit(long unitId){
		try{
			this.connect();
                        Unit unit = objectModel.createUnit();
			unit.setId(unitId);
			
			objectModel.deleteUnit(unit);
		}catch(PaPException e){
                        error = e.getMessage();
                        hasError=true;
                //        return null;
                }finally{
                        this.close();
                }

	}
        
	public String getError(){
		return error;
	}
	
	
	

}
