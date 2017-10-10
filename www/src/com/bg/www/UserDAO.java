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
	
	public String login(String email, String password){
	    
		sql = "SELECT userUID, name ,encrypted_password, salt FROM users WHERE email = ?";
		UserJson loginJson = new UserJson();
		loginJson.setError(true);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()){
				String name = rs.getString("name");
				String userUID = rs.getString("userUID");
				String encrypted_password = rs.getString("encrypted_password");
				String key = rs.getString("salt");
				System.out.println("key : " + key);
			    AES256Util aes256 = new AES256Util(key);
			    System.out.println("Decode password : " + aes256.aesDecode(encrypted_password));
			    System.out.println("input password : " + password);
			    String decodePassword = aes256.aesDecode(encrypted_password);
				if (password.equals(decodePassword)) {
					try {
						sql = String.format("SELECT teamName FROM users_info WHERE userUID = '%s'", userUID);
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.first()) {
							loginJson.setError(false);
							loginJson.setEmail(email);
							loginJson.setName(name);
							loginJson.setTeamName(rs.getString("teamName"));
							loginJson.setUserUID(userUID);
						}
					}catch(Exception e) {
						e.printStackTrace();
					}
				}else{
					loginJson.setError_msg("Password is Unavailable");
				}
			}else{
				loginJson.setError_msg("There is no email such like " + email);
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}

		String json = gson.toJson(loginJson);
		return json;
	}
	
//	�븘�씠�뵒 以묐났泥댄겕
	public String register(String email) {
		UserJson isUserExistJson = new UserJson();
		isUserExistJson.setError(true);
		sql = "SELECT * FROM users WHERE email = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.first()) {
				isUserExistJson.setEmail(rs.getString("email"));
				isUserExistJson.setError_msg(rs.getString("email") + " is Exist!@!@!@!@");
				System.out.println(isUserExistJson.getError_msg());
			}else {
				isUserExistJson.setError(false);
				isUserExistJson.setError_msg(email + "can USE!!");
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String json = gson.toJson(isUserExistJson);
		System.out.println(json);
		return json;
	}
	
	
	public String register(String email, String password, String name){
		UserJson registerJson = new UserJson();
		registerJson.setError(true);
		
		String uid = UUID.randomUUID().toString();
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
		sql = String.format("INSERT INTO users (userUID, name, email, encrypted_password, salt, created_at) "
				+ "VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", uid.toString(), name, email.toString(), encrypted_password, salt, created_at);
		
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
		
		
		String json = gson.toJson(registerJson);
		System.out.println(json);
		return json;
	}
//	user 異붽��젙蹂� �엯�젰
	public String register(String userUID, String birth, String regionA, String regionB, int height, int weight, String position){
		UserJson registerUserInfoJson = new UserJson();
		registerUserInfoJson.setError(true);
	    String created_at = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	    
		sql = String.format("INSERT INTO users_info (userUID, birth, regionA, regionB, height, we"
				+ "ight, position, created_at)" 
				+ "VALUES ('%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s')", userUID, birth, regionA, regionB, height, weight, position, created_at);
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    if (r > 0) {
				registerUserInfoJson.setError(false);
		    }else {
		    		registerUserInfoJson.setError_msg("Mysql Error");
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
		
		
		String json = gson.toJson(registerUserInfoJson);
		System.out.println(json);
		return json;
	}
	
//	�씠由꾩쑝濡� 寃��깋
	public String searchByN(String name){
		System.out.println("UserDAO searchByName RUN");
		String SQL = "SELECT * FROM users u, users_info ui WHERE u.userUID = ui.userUID AND u.name LIKE ?";
		ArrayList<UserJson> userList = new ArrayList<UserJson>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + name + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("userUID"));
				user.setName(rs.getString("name"));
				user.setBirth(rs.getString("birth"));
				user.setPosition(rs.getString("position"));
				user.setHeight(rs.getInt("height"));
				user.setWeight(rs.getInt("weight"));
				user.setRegionA(rs.getString("regionA"));
				user.setRegionB(rs.getString("regionB"));
				user.setTeamName(rs.getString("teamName"));
				userList.add(user);
			}
			pstmt.close();
			conn.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		return gson.toJson(userList).toString();
	}

//	吏��뿭�쑝濡� 寃��깋
	public String searchByR(String region){
		System.out.println("UserDAO searchByR RUN");
		String SQL = "SELECT * FROM users_info ui, users u WHERE ui.userUID = u.userUID AND regionA LIKE ? OR regionB LIKE ?";
		ArrayList<UserJson> userList = new ArrayList<UserJson>();
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + region + "%");
			pstmt.setString(2, "%" + region + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("userUID"));
				user.setBirth(rs.getString("birth"));
				user.setPosition(rs.getString("position"));
				user.setHeight(rs.getInt("height"));
				user.setWeight(rs.getInt("weight"));
				user.setRegionA(rs.getString("regionA"));
				user.setRegionB(rs.getString("regionB"));
				user.setTeamName(rs.getString("teamName"));
				SQL = "SELECT * FROM users WHERE userUID = ?";
				user.setName(rs.getString("name"));
				userList.add(user);
			}
			pstmt.close();
			conn.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		Gson gson = new Gson();
		return gson.toJson(userList).toString();
	}
	
	public boolean teamJoin(String teamName, String userUID) {
		System.out.println("UserDAO teamJoin is run");
		System.out.println("teamName : " + teamName);
		System.out.println("userUID : " + userUID);
		boolean i = false;
		try {
			String update_userInfo = String.format("UPDATE users_info SET teamName = '%s' WHERE userUID LIKE '%s'", teamName, userUID);
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(update_userInfo);
		    stmt.close();
		    conn.close();
		    i = (r==1) ? true : false; 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public UserJson findByUserUID(String userUID) {
		UserJson user = new UserJson();
		try {
			stmt = conn.createStatement();
			String sql = String.format("SELECT * FROM users_info WHERE userUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setBirth(rs.getString("birth"));
				user.setPosition(rs.getString("position"));
				user.setHeight(rs.getInt("height"));
				user.setRegionA(rs.getString("regionA"));
				user.setRegionB(rs.getString("regionB"));
				user.setTeamName(rs.getString("teamName"));
			}
			sql = String.format("SELECT * FROM users WHERE userUID = '%s'", userUID);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
			stmt.close();
			conn.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	public ArrayList<UserJson> findByTeamName(String teamName) {
		ArrayList<UserJson> userList = new ArrayList<UserJson>();
		
		try {
			stmt = conn.createStatement();
			String sql = String.format("SELECT a.userUID, a.birth, a.regionA, a.regionB, a.height, "
					+ "a.weight, a.position, b.name FROM users_info a, users b "
					+ "WHERE a.userUID = b.userUID AND a.teamName LIKE '%s'", teamName);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				UserJson user = new UserJson();
				user.setUserUID(rs.getString("userUID"));
				user.setBirth(rs.getString("birth"));
				user.setPosition(rs.getString("position"));
				user.setHeight(rs.getInt("height"));
				user.setRegionA(rs.getString("regionA"));
				user.setRegionB(rs.getString("regionB"));
				user.setName(rs.getString("name"));
				System.out.println(rs.getString("name"));
				user.setWeight(rs.getInt("weight"));
				userList.add(user);
			}
			stmt.close();
			conn.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userList;
	}
}
