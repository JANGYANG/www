package com.bg.www;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.Gson;

public class MatchDAO {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	Gson gson = new Gson();

	public MatchDAO(){
		System.out.println("MatchDAO is called!");
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
	
	public boolean registerMatch(String homeTeamID, String awayTeamID, String stadium, int homeScore, 
			int awayScore, String matchType, String matchDate, int playingTime, 
			String homeOrAway, String player) {
		System.out.println(this.toString() + " registerMatch is start");
		try {
			stmt = conn.createStatement();
			String sql = String.format("INSERT INTO matches (homeTeamID, awayTeamID, stadium, "
					+ "homeScore, awayScore, matchType, matchDate, playingTime, %s)"
					+ "VALUES ('%s','%s','%s','%d','%d','%s','%s','%d','%s')", homeOrAway, 
					homeTeamID, awayTeamID, stadium, homeScore, awayScore, matchType, matchDate,
					playingTime, player);
			System.out.println(sql);
			int r = stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
			if(r==1) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<MatchJson> listMatch(){
		ArrayList<MatchJson> matchList = new ArrayList<MatchJson>();
		try {
			stmt = conn.createStatement();
			String sql = "SELECT * FROM matches";
			rs = stmt.executeQuery(sql);
			System.out.println(rs.getFetchSize());
			while(rs.next()) {
				MatchJson match = new MatchJson();
				match.setMatchID(rs.getInt("matchID"));
				match.setHomeTeamID(rs.getString("homeTeamID"));
				match.setAwayTeamID(rs.getString("awayTeamID"));
				match.setHomeScore(rs.getInt("homeScore"));
				match.setAwayScore(rs.getInt("awayScore"));
				match.setMatchDate(rs.getString("matchDate"));
				match.setStadium(rs.getString("stadium"));
				match.setMatchType(rs.getString("matchType"));
				match.setHomePlayer(rs.getString("homePlayer"));
				match.setAwayPlayer(rs.getString("awayPlayer"));
				match.setPlayingTime(rs.getInt("playingTime"));
				matchList.add(match);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return matchList;
	}

}
