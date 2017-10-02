package com.bg.www;

public class MatchJson {
	int matchID;
	String homeTeamID;
	String awayTeamID;
	String stadium;
	int homeScore;
	int awayScore;
	String matchType;
	String matchDate;
	int playingTime;
	String homePlayer;
	String awayPlayer;
	public int getMatchID() {
		return matchID;
	}
	public void setMatchID(int matchID) {
		this.matchID = matchID;
	}
	public String getHomeTeamID() {
		return homeTeamID;
	}
	public void setHomeTeamID(String homeTeamID) {
		this.homeTeamID = homeTeamID;
	}
	public String getAwayTeamID() {
		return awayTeamID;
	}
	public void setAwayTeamID(String awayTeamID) {
		this.awayTeamID = awayTeamID;
	}
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	public int getHomeScore() {
		return homeScore;
	}
	public void setHomeScore(int homeScore) {
		this.homeScore = homeScore;
	}
	public int getAwayScore() {
		return awayScore;
	}
	public void setAwayScore(int awayScore) {
		this.awayScore = awayScore;
	}
	public String getMatchType() {
		return matchType;
	}
	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}
	public String getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(String matchDate) {
		this.matchDate = matchDate;
	}
	public int getPlayingTime() {
		return playingTime;
	}
	public void setPlayingTime(int playingTime) {
		this.playingTime = playingTime;
	}
	public String getHomePlayer() {
		return homePlayer;
	}
	public void setHomePlayer(String homePlayer) {
		this.homePlayer = homePlayer;
	}
	public String getAwayPlayer() {
		return awayPlayer;
	}
	public void setAwayPlayer(String awayPlayer) {
		this.awayPlayer = awayPlayer;
	}
	
	
}
//Field           | Type                | Null | Key | Default | Extra          |
//+-----------------+---------------------+------+-----+---------+----------------+
//| matchID         | int(1) unsigned     | NO   | PRI | NULL    | auto_increment | 
//| homeTeamID      | varchar(36)         | YES  |     | NULL    |                | 
//| awayTeamID      | varchar(36)         | YES  |     | NULL    |                | 
//| stadium         | varchar(30)         | YES  |     | NULL    |                | 
//| homeScore       | tinyint(1) unsigned | YES  |     | NULL    |                | 
//| awayScore       | tinyint(1) unsigned | YES  |     | NULL    |                | 
//| matchType       | varchar(10)         | YES  |     | NULL    |                | 
//| matchDate       | datetime            | YES  |     | NULL    |                | 
//| playingTime     | tinyint(1) unsigned | YES  |     | NULL    |                | 
//| homePlayer      | varchar(100)        | YES  |     | NULL    |                | 
//| awayPlayer      | varchar(100)        | YES  |     | NULL    |                | 
//| homeScorePlayer | varchar(100)        | YES  |     | NULL    |                | 
//| awayScorePlayer | varchar(100)        | YES  |     | NULL    |                | 
//+-----------------+---------------------+------+-----+---------+----------------+