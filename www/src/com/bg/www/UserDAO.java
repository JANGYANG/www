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

import com.google.gson.Gson;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String sql = null;
	Gson gson = new Gson();
    
	SecureRandom sr = new SecureRandom();
    byte[] ab = sr.generateSeed(256);
	
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
	    
		sql = "SELECT playerUID, playerName ,encryptedPW, salt FROM player WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()){
				String name = rs.getString("playerName");
				String userUID = rs.getString("playerUID");
				String encryptedPW = rs.getString("encryptedPW");
				String key = rs.getString("salt");
				System.out.println("key : " + key);
			    AES256Util aes256 = new AES256Util(key);
			    String decodePassword = aes256.aesDecode(encryptedPW);
				if (password.equals(decodePassword)) {
					loginJson.setError(false);
					loginJson.setEmail(email);
					loginJson.setName(name);
					loginJson.setUserUID(userUID);
				}else{
					loginJson.setError_msg("Password is Unavailable");
				}
				pstmt.close();
				rs.close();
			}else {
				loginJson.setError_msg("Email is Unavailable");
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
		sql = "SELECT * FROM player WHERE email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()) {
				isUserExist.setEmail(rs.getString("email"));
				isUserExist.setError_msg(rs.getString("email") + " is Exist!@!@!@!@");
				System.out.println(isUserExist.getError_msg());
			}else {
				isUserExist.setError(false);
				isUserExist.setError_msg(email + "can USE!!");
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
		sql = String.format("INSERT INTO player (playerUID, playerName, email, encryptedPW, salt) "
				+ "VALUES ('%s', '%s', '%s', '%s', '%s')", uid.toString(), name, email, encryptedPW, salt);
		
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    if (r > 0) {
				registerJson.setError(false);
				registerJson.setEmail(email);
				registerJson.setUserUID(uid);
		    }else {
		    		registerJson.setError_msg("Mysql Error");
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
	public UserJson register(String userUID,String birth, String[] mainRegion, String[] subRegion, int height, int weight, String[] position,String job){
		UserJson user = new UserJson();
		user.setError(true);
	    
		sql = String.format("UPDATE player SET playerBirth='%s', height = %d, weight= %d, job = '%s' " 
				+ "WHERE playerUID = '%s'", birth, height, weight, job, userUID);
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    if (r > 0) {
		    		for(int i = 0; i < mainRegion.length; i++) {
		    			sql = String.format("INSERT INTO playerRegion (playerUID, mainRegion, subRegion) VALUES('%s','%s','%s')",userUID, mainRegion[i], subRegion[i]);
		    			stmt.executeUpdate(sql);
		    		}
		    		for(int i = 0; i < position.length; i++) {
		    			sql = String.format("INSERT INTO playerPosition (playerUID, position) VALUES('%s','%s')", userUID, position[i]);
		    			stmt.executeUpdate(sql);
		    		}
				user.setError(false);
		    }else {
		    		user.setError_msg("Mysql Error");
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
	
////	�씠由꾩쑝濡� 寃��깋
//	public String searchByN(String name){
//		System.out.println("UserDAO searchByName RUN");
//		String SQL = "SELECT * FROM users u, users_info ui WHERE u.userUID = ui.userUID AND u.name LIKE ?";
//		ArrayList<UserJson> userList = new ArrayList<UserJson>();
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, "%" + name + "%");
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				UserJson user = new UserJson();
//				user.setUserUID(rs.getString("userUID"));
//				user.setName(rs.getString("name"));
//				user.setBirth(rs.getString("birth"));
//				user.setPosition(rs.getString("position"));
//				user.setHeight(rs.getInt("height"));
//				user.setWeight(rs.getInt("weight"));
//				user.setTeamName(rs.getString("teamName"));
//				userList.add(user);
//			}
//			pstmt.close();
//			conn.close();
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		Gson gson = new Gson();
//		return gson.toJson(userList).toString();
//	}
//
////	吏��뿭�쑝濡� 寃��깋
//	public String searchByR(String region){
//		System.out.println("UserDAO searchByR RUN");
//		String SQL = "SELECT * FROM users_info ui, users u WHERE ui.userUID = u.userUID AND regionA LIKE ? OR regionB LIKE ?";
//		ArrayList<UserJson> userList = new ArrayList<UserJson>();
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, "%" + region + "%");
//			pstmt.setString(2, "%" + region + "%");
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				UserJson user = new UserJson();
//				user.setUserUID(rs.getString("userUID"));
//				user.setBirth(rs.getString("birth"));
//				user.setPosition(rs.getString("position"));
//				user.setHeight(rs.getInt("height"));
//				user.setWeight(rs.getInt("weight"));
//				user.setTeamName(rs.getString("teamName"));
//				SQL = "SELECT * FROM users WHERE userUID = ?";
//				user.setName(rs.getString("name"));
//				userList.add(user);
//			}
//			pstmt.close();
//			conn.close();
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		Gson gson = new Gson();
//		return gson.toJson(userList).toString();
//	}
//	
//	public boolean teamJoin(String teamName, String userUID) {
//		System.out.println("UserDAO teamJoin is run");
//		System.out.println("teamName : " + teamName);
//		System.out.println("userUID : " + userUID);
//		boolean i = false;
//		try {
//			String update_userInfo = String.format("UPDATE users_info SET teamName = '%s' WHERE userUID LIKE '%s'", teamName, userUID);
//			stmt = conn.createStatement();
//		    int r = stmt.executeUpdate(update_userInfo);
//		    stmt.close();
//		    conn.close();
//		    i = (r==1) ? true : false; 
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return i;
//	}
//	
	public UserJson findByUserUID(String userUID) {
		UserJson user = new UserJson();
		try {
			stmt = conn.createStatement();
			String sql = String.format("SELECT * FROM player WHERE playerUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setName(rs.getString("playerName"));
				user.setBirth(rs.getString("playerbirth"));
				user.setJob(rs.getString("job"));
				user.setHeight(rs.getInt("height"));
				user.setWeight(rs.getInt("weight"));
				user.setTeamUID(rs.getString("teamUID"));
			}
			sql = String.format("SELECT * FROM playerRegion WHERE playerUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setRegion(rs.getString("mainRegion"), rs.getString("subRegion"));
			}
			sql = String.format("SELECT * FROM playerPosition WHERE playerUID = '%s'", userUID);
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
			String sql = String.format("SELECT * FROM player WHERE teamUID = '%s'", teamUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("playerUID"));
				user.setBirth(rs.getString("playerBirth"));
				user.setHeight(rs.getInt("height"));
				user.setName(rs.getString("playerName"));
				user.setJob(rs.getString("job"));
				user.setWeight(rs.getInt("weight"));
				sql = String.format("SELECT position FROM playerPosition WHERE playerUID = '%s'", user.getUserUID());

				Statement subStmt = conn.createStatement();
				ResultSet subRs = subStmt.executeQuery(sql);
				while(subRs.next()) {
					user.setPosition(subRs.getString("position"));
				}
				sql = String.format("SELECT mainRegion, subRegion FROM playerRegion WHERE playerUID = '%s'", user.getUserUID());

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
