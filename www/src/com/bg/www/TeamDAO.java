package com.bg.www;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.UUID;

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
			  DB db = new DB();
			  final String driverName= db.getDriverName();
			  final String dbDatabase = db.getDbDatabase();
			  final String dbUser = db.getDbUser();
			  final String dbPassword = db.getDbPassword();
			  Class.forName(driverName);
			  conn = DriverManager.getConnection(dbDatabase,dbUser,dbPassword);
			  System.out.println("DB Connection Success!");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB Connection FAIL!");
		}
	}
	
	
//	팀이름 중복체크 
	public TeamJson registerTeam(String teamName) {
		TeamJson isTeamExistJson = new TeamJson();
		isTeamExistJson.setError(true);
		sql = "SELECT * FROM team WHERE teamName = ?";
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
		return isTeamExistJson;
	}
	
//	팀가입
	public TeamJson registerTeam(String teamName, String mainRegion[], String subRegion[], String teamBirth, String captainUID, String[] formation){
		TeamJson team = new TeamJson();
		team.setError(true);
		String teamUID = UUID.randomUUID().toString();
		sql = String.format("INSERT INTO team (teamUID, teamName, teamBirth, captainUid) "
				+ "VALUES ('%s', '%s', '%d', '%s')", teamUID, teamName, Integer.parseInt(teamBirth), captainUID);
		
		try {
			stmt = conn.createStatement();
		    int r = stmt.executeUpdate(sql);
		    	if( r == 1 ){
		    		for(int i=0; i < mainRegion.length; i++){
			    		sql = String.format("INSERT INTO teamRegion(mainRegion, subRegion, teamUID) VALUES('%s', '%s', '%s')", mainRegion[i], subRegion[i], teamUID);
			    		stmt.executeUpdate(sql);
		    		}
		    		for(int i=0; i < formation.length; i++) {
		    			sql = String.format("INSERT INTO teamFormation(formation, teamUID) VALUES('%s','%s')",formation[i],teamUID);
		    			stmt.executeUpdate(sql);
		    		}
		    		sql = String.format("UPDATE user SET teamUID = '%s' WHERE userUID = '%s'", teamUID, captainUID);
		    		stmt.executeUpdate(sql);
		    		team.setError(false);
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
		team.setTeamName(teamName);
		team.setTeamUID(teamUID);
		return team;
	}
	
//	이름으로 팀검색
	public ArrayList<TeamJson> findByN(String teamName){
		System.out.println("TeamDAO search RUN");
		String sql = "SELECT * FROM team WHERE teamName LIKE ?";
		ArrayList<TeamJson> teamList = new ArrayList<TeamJson>();
		try {
			pstmt = conn.prepareStatement(sql);
			stmt = conn.createStatement();
			pstmt.setString(1, "%" + teamName + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				TeamJson team = new TeamJson();
				team.setTeamUID(rs.getString("TeamUID"));
				team.setTeamName(rs.getString("TeamName"));
				team.setTeamBirth(Integer.toString(rs.getInt("TeamBirth")));
				team.setCaptainUID(rs.getString("CaptainUID"));
				sql = String.format("SELECT * FROM teamRegion WHERE teamUID = '%s'", team.getTeamUID());
				
				ResultSet rs2 = stmt.executeQuery(sql);
				while(rs2.next()) {
					team.setRegion(rs2.getString("mainRegion"), rs2.getString("subRegion"));
				}
				sql = String.format("SELECT * FROM teamFormation WHERE teamUID = '%s'", team.getTeamUID());
				rs2 = stmt.executeQuery(sql);
				while(rs2.next()) {
					team.setFormation(rs2.getString("formation"));
				}
				teamList.add(team);
				rs2.close();
			}
			conn.close();
			pstmt.close();
			stmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return teamList;
	}
//teamUID으로 검색
public TeamJson findByTeamUID(String teamUID){
	System.out.println("TeamDAO searchByTeamUID RUN");
	String sql = "SELECT * FROM team WHERE teamUID = ?";
	TeamJson team = new TeamJson();
	try {
		pstmt = conn.prepareStatement(sql);
		System.out.println("Closed????"+pstmt.isClosed());
		pstmt.setString(1, teamUID);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			team.setTeamName(rs.getString("teamName"));
			team.setTeamBirth(rs.getString("teamBirth"));
			team.setTeamUID(teamUID);
			team.setCaptainUID(rs.getString("captainUID"));
		}
		sql = "SELECT * FROM teamRegion WHERE teamUID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, teamUID);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			team.setRegion(rs.getString("mainRegion"), rs.getString("subRegion"));
		}
		sql = "SELECT * FROM teamFormation WHERE teamUID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, teamUID);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			team.setFormation(rs.getString("formation"));
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return team;
}
	

	public TeamJson reqTeamJoin(String teamUID, String userUID) {
		TeamJson reqTeamJoin = new TeamJson();
		reqTeamJoin.setError(true);
		String sql = String.format("INSERT INTO reqTeamJoin(teamUID, userUID) VALUES ('%s', '%s')", teamUID, userUID);
		try{
			stmt = conn.createStatement();
			int r = stmt.executeUpdate(sql);
			if(r == 1) {
				reqTeamJoin.setError(false);
			}
			reqTeamJoin.setError(false);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return reqTeamJoin;
	}
	
	public ArrayList<ReqTeamJoinJson> reqTeamJoin(String teamUID){
		ArrayList<ReqTeamJoinJson> reqTeamJoinList = new ArrayList<ReqTeamJoinJson>();
		
		try {
			String sql = String.format("SELECT * FROM reqTeamJoin WHERE teamUID = '%s' AND confirm is NULL", teamUID);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ReqTeamJoinJson reqTeamJoinJson = new ReqTeamJoinJson(rs.getString("userUID"),rs.getString("teamUID"));
				reqTeamJoinJson.setDate(rs.getString("requestDate"));
				reqTeamJoinJson.setConfirm(rs.getBoolean("confirm"));
				reqTeamJoinList.add(reqTeamJoinJson);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return reqTeamJoinList;
	}
	
	public boolean reqTeamJoin(String teamUID, String userUID, boolean confirm){
		
		try {
			String sql = String.format("UPDATE reqTeamJoin SET confirm = %b where teamUID = '%s' AND userUID = '%s'", confirm, teamUID, userUID);
			stmt = conn.createStatement();
			int r = stmt.executeUpdate(sql);
			if(r > 0) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
