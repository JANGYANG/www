package com.bg.www;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import com.google.gson.Gson;

public class MatchDAO {
	private Connection conn = null;
	private Statement stmt = null;

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
		System.out.println(this.toString() + "is start");
		try {
			stmt = conn.createStatement();
			String sql = String.format("INSERT INTO matches (homeTeamID, awayTeamID, stadium, "
					+ "homeScore, awayScore, matchType, matchDate, playingTime, %s)"
					+ "VALUES ('%s','%s','%s','%d','%d','%s','%s','%d','%s')", homeOrAway, 
					homeTeamID, awayTeamID, stadium, homeScore, awayScore, matchType, matchDate,
					playingTime, player);
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

}
