package PaP.control;

import PaP.PaPException;
import PaP.model.ObjectModel;
import PaP.model.RegisteredUser;
import PaP.model.impl.ObjectModelImpl;
import PaP.persistence.Persistence;
import PaP.persistence.impl.DbUtils;
import PaP.persistence.impl.PersistenceImpl;
import java.sql.Connection;

public class RegisterControl{

	private Connection conn = null;
	private ObjectModel objectModel = null;
	private Persistence persistence = null;
	private String error="Error Unknown";

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
	public boolean attemptToRegister(String firstName, String lastName, String userName, String password, String state, String address, String email, String phone)throws PaPException{
		try{
		connect();
		RegisteredUser modelUser = objectModel.createRegisteredUser();
		modelUser.setUserName(userName);
		modelUser.setFirstName(firstName);
		modelUser.setLastName(lastName);
		modelUser.setPassword(password);
		modelUser.setEmail(email);
		modelUser.setPhone(phone);
		modelUser.setState(state);
                modelUser.setAddress(address);
		
		
		objectModel.storeRegisteredUser(modelUser);			
		}catch(PaPException e){
			error = e.getMessage();
			return false;
		}finally{
			close();
		}
		return true;
	}
	public String getError(){
		return error;
	}
	
	
	

}
