package com.bg.www;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.Gson;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
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


	    
		String SQL = "SELECT encrypted_password, salt FROM users WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		loginJson.setError_msg("Email is Unabailable");
		
		
		try {
			pstmt = conn.prepareStatement(SQL);
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
	
	public String register(String email, String password) {
		UserJson registerJson = new UserJson();
		
		
		
		String json = gson.toJson(registerJson);
		return json;
	}

}
