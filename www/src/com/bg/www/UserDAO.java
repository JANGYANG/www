package com.bg.www;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;


public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	
	public UserDAO(){
		System.out.println("UserDAO is called!");
		try {
			  final String driverName= "com.mysql.jdbc.Driver";
			  final String dbDatabase = "jdbc:mysql://db.broken-glasses.com/dbradiata03";
			  final String dbUser = "radiata03";
			  final String dbPassword ="20160815!@";
			  Class.forName(driverName);
			  conn = DriverManager.getConnection(dbDatabase,dbUser,dbPassword);
			  System.out.println("DB Connection Success!");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB Connection FAIL!");
		}
	}
	
	public UserJson login(String email, String password){
	    
		sql = "SELECT userUID, userName ,encryptedPW, salt, teamUID FROM user WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()){
				String name = rs.getString("userName");
				String userUID = rs.getString("userUID");
				String encryptedPW = rs.getString("encryptedPW");
				String key = rs.getString("salt");
				String teamUID = rs.getString("teamUID");
				System.out.println("key : " + key);
				
			    AES256Util aes256 = new AES256Util(key);
			    String decodePassword = aes256.aesDecode(encryptedPW);
			    
				if (password.equals(decodePassword)) {
					loginJson.setError(false);
					loginJson.setEmail(email);
					loginJson.setName(name);
					loginJson.setUserUID(userUID);
					loginJson.setTeamUID(teamUID);
				}else{
					loginJson.setErrorMsg("Password is Unavailable");
				}
				pstmt.close();
				rs.close();
			}else {
				loginJson.setErrorMsg("Email is Unavailable");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		return loginJson;
	}
	
//	�븘�씠�뵒 以묐났泥댄겕
	public UserJson register(String email) {
		UserJson isUserExist = new UserJson();
		isUserExist.setError(true);
		sql = "SELECT * FROM user WHERE email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()) {
				isUserExist.setEmail(rs.getString("email"));
				isUserExist.setErrorMsg(rs.getString("email") + " is Exist");
				System.out.println(isUserExist.getErrorMsg());
			}else {
				isUserExist.setError(false);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isUserExist;
	}
	
	
	public UserJson register(String email, String password, String name){

		UserJson registerJson = new UserJson();
		registerJson.setError(true);
		
		String uid = UUID.randomUUID().toString();
		String encryptedPW = null;
		SecureRandom random1 = new SecureRandom();
		SecureRandom random2 = new SecureRandom();
		String key1 = Integer.toString(random1.nextInt());
	    String key2 = Integer.toString(random2.nextInt());
	    
	    String salt = key1 + key2;
		
		try {
			AES256Util aes256 = new AES256Util(salt);
			System.out.println(uid.toString());
//			System.out.println(key.toString());
			encryptedPW = aes256.aesEncode(password);
			System.out.println(encryptedPW);
			System.out.println(aes256.aesDecode(encryptedPW));
		}catch(Exception e) {
			System.out.println("Encrypt Error");
			e.printStackTrace();
		}
		sql = String.format("INSERT INTO user (userUID, userName, email, encryptedPW, salt) "
				+ "VALUES ('%s', '%s', '%s', '%s', '%s')", uid.toString(), name, email, encryptedPW, salt);
		
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    if (r > 0) {
				registerJson.setError(false);
				registerJson.setEmail(email);
				registerJson.setUserUID(uid);
		    }else {
		    		registerJson.setErrorMsg("Mysql Error");
		    }
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("WHATTHEFUCK");
		}
		
		try {
			stmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return registerJson;
	}
	
//	user 異붽��젙蹂� �엯�젰
	public UserJson register(String userUID,String birth, ArrayList<Region> region, int height, int weight, ArrayList<String> position,String job){
		UserJson user = new UserJson();
		user.setError(true);
	    
		sql = String.format("UPDATE user SET userBirth='%s', height = %d, weight= %d, job = '%s' " 
				+ "WHERE userUID = '%s'", birth, height, weight, job, userUID);
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    if (r > 0) {
		    		for(int i = 0; i < region.size(); i++) {
		    			sql = String.format("INSERT INTO userRegion (userUID, mainRegion, subRegion) VALUES('%s','%s','%s')",userUID, region.get(i).getMainRegion(), region.get(i).getSubRegion());
		    			stmt.executeUpdate(sql);
		    		}
		    		for(int i = 0; i < position.size(); i++) {
		    			sql = String.format("INSERT INTO userPosition (userUID, position) VALUES('%s','%s')", userUID, position.get(i));
		    			stmt.executeUpdate(sql);
		    		}
				user.setError(false);
		    }else {
		    		user.setErrorMsg("Mysql Error");
		    }
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("WHATTHEFUCK");
		}
		
		try {
			stmt.close();
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		
		return user;
	}
	
//	�씠由꾩쑝濡� 寃��깋
	public ArrayList<UserJson> searchByN(String name){
		System.out.println("UserDAO searchByName RUN");
		ArrayList<UserJson> userList = new ArrayList<UserJson>();
		String SQL = "SELECT * FROM user WHERE userName LIKE ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("userUID"));
				user.setName(rs.getString("userName"));
				user.setBirth(rs.getString("userBirth"));
				user.setHeight(rs.getInt("height"));
				user.setWeight(rs.getInt("weight"));
				user.setTeamUID(rs.getString("teamUID"));
				userList.add(user);
			}
			pstmt.close();
			conn.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	public UserJson findByUserUID(String userUID) {
		UserJson user = new UserJson();
		try {
			stmt = conn.createStatement();
			String sql = String.format("SELECT * FROM user WHERE userUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			if(rs.first()) {
				user.setUserUID(userUID);
				user.setName(rs.getString("userName"));
				user.setBirth(rs.getString("userbirth"));
				user.setJob(rs.getString("job"));
				user.setHeight(rs.getInt("height"));
				user.setWeight(rs.getInt("weight"));
				user.setTeamUID(rs.getString("teamUID"));
			}
			sql = String.format("SELECT * FROM userRegion WHERE userUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setRegion(rs.getString("mainRegion"), rs.getString("subRegion"));
			}
			sql = String.format("SELECT * FROM userPosition WHERE userUID = '%s'", userUID);
			rs.close();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setPosition(rs.getString("position"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	public ArrayList<UserJson> findByTeamUID(String teamUID) {
		ArrayList<UserJson> userList = new ArrayList<UserJson>();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("SELECT * FROM user WHERE teamUID = '%s'", teamUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("userUID"));
				user.setBirth(rs.getString("userBirth"));
				user.setHeight(rs.getInt("height"));
				user.setName(rs.getString("userName"));
				user.setJob(rs.getString("job"));
				user.setWeight(rs.getInt("weight"));
				sql = String.format("SELECT position FROM userPosition WHERE userUID = '%s'", user.getUserUID());

				Statement subStmt = conn.createStatement();
				ResultSet subRs = subStmt.executeQuery(sql);
				while(subRs.next()) {
					user.setPosition(subRs.getString("position"));
				}
				sql = String.format("SELECT mainRegion, subRegion FROM userRegion WHERE userUID = '%s'", user.getUserUID());

				subRs = subStmt.executeQuery(sql);

				while(subRs.next()) {
					user.setRegion(subRs.getString("mainRegion"), subRs.getString("subRegion"));
				}
				userList.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
	
}
