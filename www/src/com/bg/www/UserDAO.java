package com.bg.www;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	
	public String login(String email, String password){
	    
		sql = "SELECT name ,encrypted_password, salt FROM users WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()){
				String name = rs.getString(1);
				String encrypted_password = rs.getString(2);
				String key = rs.getString(3);
				System.out.println("key : " + key);
			    AES256Util aes256 = new AES256Util(key);
			    System.out.println("Decode password : " + aes256.aesDecode(encrypted_password));
			    System.out.println("input password : " + password);
			    String decodePassword = aes256.aesDecode(encrypted_password);
				if (password.equals(decodePassword)) {
					loginJson.setName(name);
					loginJson.setError(false);
					loginJson.setEmail(email);
				}else{
					loginJson.setError_msg("Password is Unavailable");
				}
			}else{
				loginJson.setError_msg("There is no Such like { " + email + " } Email");
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}

		String json = gson.toJson(loginJson);
		return json;
	}
	
	public String register(String email, String password, String name){
		UserJson registerJson = new UserJson();
		registerJson.setError(true);
		
		UUID uid = UUID.randomUUID();
		String encrypted_password = null;
		String salt = uid.toString();
	    String created_at = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	    
		try {
			AES256Util aes256 = new AES256Util(salt);
			System.out.println(uid.toString());
//			System.out.println(key.toString());
			encrypted_password = aes256.aesEncode(password);
			System.out.println(encrypted_password);
			System.out.println(aes256.aesDecode(encrypted_password));
		}catch(Exception e) {
			System.out.println("Encrypt Error");
			e.printStackTrace();
		}
		sql = String.format("INSERT INTO users (unique_id, name, email, encrypted_password, salt, created_at) "
				+ "VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", uid.toString(), name.toString(), email.toString(), encrypted_password, salt, created_at);
		
		try {
			System.out.println("before");
			stmt = conn.createStatement();
			System.out.println("after");
		    int r = stmt.executeUpdate(sql);
			System.out.println("afterafter");
		    if (r > 0) {
				registerJson.setError(false);
				registerJson.setEmail(email);
				registerJson.setUnique_id(uid.toString());
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
		
		String json = gson.toJson(registerJson);
		System.out.println(json);
		return json;
	}

}
