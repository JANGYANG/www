//package com.bg.www;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.util.ArrayList;
//import java.util.UUID;
//
//import com.google.gson.Gson;
//
//public class MatchDAO {
//	private Connection conn = null;
//	private Statement stmt = null;
//	private ResultSet rs = null;
//	private PreparedStatement pstmt = null;
//	
//	Gson gson = new Gson();
//
//	public MatchDAO(){
//		System.out.println("MatchDAO is called!");
//		try {
//			DB db = new DB();
//			final String driverName= db.getDriverName();
//			final String dbDatabase = db.getDbDatabase();
//			final String dbUser = db.getDbUser();
//			final String dbPassword = db.getDbPassword();
//			Class.forName(driverName);
//			conn = DriverManager.getConnection(dbDatabase,dbUser,dbPassword);
//			System.out.println("DB Connection Success!");
//		}catch(Exception e) {
//			e.printStackTrace();
//			System.out.println("DB Connection FAIL!");
//		}
//	}
//	
//	public boolean registerMatch(String homeTeamID, String awayTeamID, String stadium, int homeScore, 
//			int awayScore, String matchType, String matchDate, int playingTime, 
//			boolean homeOrAway, String[] player) {
//		System.out.println(this.toString() + " registerMatch is start");
//		try {
//			String matchID = UUID.randomUUID().toString();
//			stmt = conn.createStatement();
//			
////			is it homePlayer or AwayPlayer
//			String homePlayer = homeOrAway ? "homePlayer" : "awayPlayer";
//			String sql1 = String.format("INSERT INTO matches (matchID ,homeTeamID, awayTeamID, stadium, "
//					+ "homeScore, awayScore, matchType, matchDate, playingTime, %s)"
//					+ "VALUES ('%s','%s','%s','%s','%d','%d','%s','%s','%d','%s')", homePlayer, matchID,
//					homeTeamID, awayTeamID, stadium, homeScore, awayScore, matchType, matchDate,
//					playingTime, player.toString());
//			System.out.println(sql1);
//			int r1 = stmt.executeUpdate(sql1);
//			
//
//			StringBuffer sql2 = new StringBuffer(" INSERT INTO playerOfMatch (matchID, userUID) VALUES (?, ?)");
//			pstmt = conn.prepareStatement(sql2.toString());
//			for(int i = 0; i<player.length; i++) {
//			    pstmt.setString(1, matchID);
//			    pstmt.setString(2, player[i]);
//			    pstmt.addBatch();
//			    pstmt.clearParameters();
//			}
//			pstmt.executeBatch();
//			
//			pstmt.close();
//			stmt.close();
//			conn.close();
//			if(r1==1) {
//				return true;
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
//	
//	public ArrayList<MatchJson> listMatch(){
//		ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
//		try {
//			stmt = conn.createStatement();
//			String sql = "SELECT * FROM matches";
//			rs = stmt.executeQuery(sql);
//			System.out.println(rs.getFetchSize());
//			while(rs.next()) {
//				MatchJson match = new MatchJson();
//				match.setMatchID(rs.getString("matchID"));
//				match.setHomeTeamID(rs.getString("homeTeamID"));
//				match.setAwayTeamID(rs.getString("awayTeamID"));
//				match.setHomeScore(rs.getInt("homeScore"));
//				match.setAwayScore(rs.getInt("awayScore"));
//				match.setMatchDate(rs.getString("matchDate"));
//				match.setStadium(rs.getString("stadium"));
//				match.setMatchType(rs.getString("matchType"));
//				match.setHomePlayer(rs.getString("homePlayer"));
//				match.setAwayPlayer(rs.getString("awayPlayer"));
//				match.setPlayingTime(rs.getInt("playingTime"));
//				matchList.add(match);
//			}
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return matchList;
//	}
//	
//	public MatchJson findByMatchID(String matchID) {
//		MatchJson match = new MatchJson();
//		try {
//			stmt = conn.createStatement();
//			String sql = String.format("SELECT * FROM matches WHERE matchID LIKE '%s'", matchID);
//			rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				match.setMatchID(rs.getString("matchID"));
//				match.setHomeTeamID(rs.getString("homeTeamID"));
//				match.setAwayTeamID(rs.getString("awayTeamID"));
//				match.setHomeScore(rs.getInt("homeScore"));
//				match.setAwayScore(rs.getInt("awayScore"));
//				match.setMatchDate(rs.getString("matchDate"));
//				match.setStadium(rs.getString("stadium"));
//				match.setMatchType(rs.getString("matchType"));
//				match.setHomePlayer(rs.getString("homePlayer"));
//				match.setAwayPlayer(rs.getString("awayPlayer"));
//				match.setPlayingTime(rs.getInt("playingTime"));
//				
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return match;
//	}
//	
//	
//	public ArrayList<MatchJson> listMatch(String teamName, String userUID){
//		ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
//		try {
//			stmt = conn.createStatement();
//			String sql = String.format("SELECT * FROM matches "
//					+ "WHERE homePlayer LIKE '%s' "
//					+ "OR awayPlayer LIKE '%s'", "%"+ userUID + "%", "%" + userUID + "%");
//			rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				MatchJson match = new MatchJson();
//				match.setMatchID(rs.getString("matchID"));
//				match.setHomeTeamID(rs.getString("homeTeamID"));
//				match.setAwayTeamID(rs.getString("awayTeamID"));
//				match.setHomeScore(rs.getInt("homeScore"));
//				match.setAwayScore(rs.getInt("awayScore"));
//				match.setMatchDate(rs.getString("matchDate"));
//				match.setStadium(rs.getString("stadium"));
//				match.setMatchType(rs.getString("matchType"));
//				match.setHomePlayer(rs.getString("homePlayer"));
//				match.setAwayPlayer(rs.getString("awayPlayer"));
//				match.setPlayingTime(rs.getInt("playingTime"));
//				matchList.add(match);
//			}
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return matchList;
//		
//	}
//
//	public ArrayList<MatchJson> listMatch(String teamName){
//		ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
//		try {
//			stmt = conn.createStatement();
//			String sql = String.format("SELECT * FROM matches "
//					+ "WHERE homeTeamID LIKE '%s' "
//					+ "OR awayTeamID LIKE '%s'", teamName, teamName);
//			rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				MatchJson match = new MatchJson();
//				match.setMatchID(rs.getString("matchID"));
//				match.setHomeTeamID(rs.getString("homeTeamID"));
//				match.setAwayTeamID(rs.getString("awayTeamID"));
//				match.setHomeScore(rs.getInt("homeScore"));
//				match.setAwayScore(rs.getInt("awayScore"));
//				match.setMatchDate(rs.getString("matchDate"));
//				match.setStadium(rs.getString("stadium"));
//				match.setMatchType(rs.getString("matchType"));
//				match.setHomePlayer(rs.getString("homePlayer"));
//				match.setAwayPlayer(rs.getString("awayPlayer"));
//				match.setPlayingTime(rs.getInt("playingTime"));
//				matchList.add(match);
//			}
//			rs.close();
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return matchList;
//		
//	}
//	
//}
