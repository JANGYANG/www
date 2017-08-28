package com.bg.www;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.Gson;

public class TeamDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	Gson gson = new Gson();
	
	public TeamDAO(){
		System.out.println("TeamDAO Constructor is called!");
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
	
	
//	팀이름 중복체크 
	public String registerTeam(String teamName) {
		TeamJson isTeamExistJson = new TeamJson();
		isTeamExistJson.setError(true);
		sql = "SELECT * FROM teams WHERE teamName = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teamName);
			rs = pstmt.executeQuery();
			if(rs.first()) {
				isTeamExistJson.setError_msg(rs.getString("teamName") + " is Exist!@!@!@!@");
				System.out.println(isTeamExistJson.getError_msg());
			}else {
				isTeamExistJson.setError(false);
				isTeamExistJson.setError_msg(teamName + "can USE!!");
			}
			rs.close();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String json = gson.toJson(isTeamExistJson);
		System.out.println(json);
		return json;
	}
	
//	팀가입
	public String registerTeam(String teamName, String regionA, String regionB, String teamBirth, String captainUid){
		TeamJson registerJson = new TeamJson();
		registerJson.setError(true);
	    
		sql = String.format("INSERT INTO teams (teamName, regionA, regionB, teamBirth, captainUid) "
				+ "VALUES ('%s', '%s', '%s', '%s', '%s')", teamName, regionA, regionB, teamBirth, captainUid);
		
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    	if(r == 1){
		    	      String find_team = String.format("SELECT * FROM teams WHERE teamName = '%s'",teamName);
		    	      rs = stmt.executeQuery(find_team);
		    	      try{
		    	        while(rs.next()){
		    	          teamName = rs.getString(2);
		    	          String update_userInfo = String.format("UPDATE users_info SET teamName = '%s' WHERE user_uid = '%s'", teamName, captainUid);
		    	          r = stmt.executeUpdate(update_userInfo);
		    	          if (r == 1){
		    	        	  	registerJson.setError(false);
		    	        	  	registerJson.setTeamName(teamName);
		    	          }else{
		    	        	  	registerJson.setError_msg("users_info update error");
		    	          }
		    	        }
		    	      }catch(Exception e){
		    	        e.printStackTrace();
		    	      }
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
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		String json = gson.toJson(registerJson);
		System.out.println(json);
		return json;
	}	
	
}
