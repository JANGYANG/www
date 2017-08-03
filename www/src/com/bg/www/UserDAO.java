package com.bg.www;

import java.security.Key;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;

import javax.crypto.KeyGenerator;

import com.google.gson.Gson;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	private String sql;
	Gson gson = new Gson();
    
	SecureRandom sr = new SecureRandom();
    byte[] ab = sr.generateSeed(256);
	
	public void userDAO(){
		try {
			  final String driverName= "com.mysql.jdbc.Driver";
			  final String dbDatabase = "jdbc:mysql://db.broken-glasses.com/dbradiata03";
			  final String dbUser = "radiata03";
			  final String dbPassword ="20160815!@";
			  Class.forName(driverName);
			  conn = DriverManager.getConnection(dbDatabase,dbUser,dbPassword);

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String login(String email, String password){


	    
		sql = "SELECT encrypted_password, salt FROM users WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		loginJson.setError_msg("Email is Unabailable");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String key = rs.getString(2);       // key는 16자 이상
			    AES256Util aes256 = new AES256Util(key);
				if (password == aes256.aesDecode(rs.getString(1))) {
					loginJson.setError(false);
					loginJson.setEmail(email);
					loginJson.setPassword(password);
				}else{
					loginJson.setError(true);
					loginJson.setError_msg("Password is Unavailable");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

		String json = gson.toJson(loginJson);
		return json;
	}
	
	public String register(String email, String password, String name) throws Exception{
		UserJson registerJson = new UserJson();
		registerJson.setError(true);
		
//		KeyGenerator generator = KeyGenerator.getInstance("AES");
//		generator.init(256);
//		Key key = generator.generateKey();
//		String test = "thisistestgotit";
//		AES256Util aes256 = new AES256Util(test);
//		UUID uid = UUID.randomUUID();
//		System.out.println(uid.toString());
//		System.out.println(key.toString());
//		System.out.println(aes256.aesEncode(password));
//		System.out.println(aes256.aesDecode(password));
		
//		sql = String.format("INSERT INTO users (unique_id, name, email, encrypted_password, salt) "
//				+ "VALUES ('%s', '%s', '%s', '%s', '%s')", "1234", "1234", "1234", "1234", "1234");
		
		sql = "INSERT INTO users (unique_id, name, email, encrypted_password, salt) VALUES (12534, 12534, 12534, 12534, 12534)";
		
		try {
			stmt = conn.createStatement();
		    boolean r = stmt.execute(sql);
		    if (r == true) {
				registerJson.setError(false);
		    }else {
		    		registerJson.setError_msg("Mysql Error");
		    }
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("WHATTHEFUCK");
		}
		
		
		
		
		String json = gson.toJson(registerJson);
		return json;
	}

}
