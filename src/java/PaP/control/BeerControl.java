package PaP.control;

import PaP.PaPException;
import PaP.model.Beer;
import PaP.model.ObjectModel;
import PaP.model.Beer;
import PaP.model.impl.ObjectModelImpl;
import PaP.persistence.Persistence;
import PaP.persistence.impl.DbUtils;
import PaP.persistence.impl.PersistenceImpl;
import java.sql.*;
import java.util.*;

public class BeerControl{
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

	public boolean attemptToRegister(String code, String name,String brand,String type,double abv,int ibu, String desc)throws PaPException{
		try{
		connect();
		Beer modelBeer = objectModel.createBeer();
		
		modelBeer.setCode(code);
                modelBeer.setName(name);
                modelBeer.setBrand(brand);
                modelBeer.setType(type);
                modelBeer.setABV(abv);
                modelBeer.setIBU(ibu);
		modelBeer.setDesc(desc);
		
		
		objectModel.storeBeer(modelBeer);			
		}catch(PaPException e){
			error = e.getMessage();
			return false;
		}finally{
			close();
		}
		return true;
	}
        
        public ArrayList<Beer> getBeerList(){
		try{
			this.connect();
			Beer modelBeer = this.objectModel.createBeer();
                        Iterator<Beer> beers = this.objectModel.findBeer(modelBeer);
			ArrayList<Beer> beersMap = new ArrayList<Beer>();
                        
			while(beers.hasNext()){				
				beersMap.add(beers.next());
			}
//			error = Integer.toString(categoriesMap.size());		
			return beersMap;	
		}catch(PaPException e){
			error = e.getMessage();
			hasError=true;
			return null;
		}finally{
			this.close();
		}
	}
        
        public ArrayList<Beer> getBeerById(long beerId){
            try{
                    
                this.connect();
                Beer beer = null ;
                
                ArrayList<Beer> result = new ArrayList<Beer>();
                
                Beer modelBeer = this.objectModel.createBeer();
                modelBeer.setId(beerId);

                Iterator<Beer> beerIter = null;                                                
                beerIter = objectModel.findBeer(modelBeer);

                if (beerIter.hasNext()) {
                    beer = beerIter.next();  
                    result.add(beer);
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
        
        public boolean updateBeer(Long id, String code, String name,String brand,String type,double abv,int ibu, String desc)throws PaPException{
		try{
		connect();
		Beer modelBeer = objectModel.createBeer();
                modelBeer.setId(id);		
		modelBeer.setCode(code);
                modelBeer.setName(name);
                modelBeer.setBrand(brand);
                modelBeer.setType(type);
                modelBeer.setABV(abv);
                modelBeer.setIBU(ibu);
		modelBeer.setDesc(desc);                                    		
		
		objectModel.storeBeer(modelBeer);			
		}catch(PaPException e){
			error = e.getMessage();
			return false;
		}finally{
			close();
		}
		return true;
	}
        
        public void removeBeer(long beerId){
		try{
			this.connect();
                        Beer beer = objectModel.createBeer();
			beer.setId(beerId);
			
			objectModel.deleteBeer(beer);
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