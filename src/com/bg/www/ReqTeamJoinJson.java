package com.bg.www;



public class ReqTeamJoinJson {
	UserJson user;
	TeamJson team;
	String date;
	boolean confirm;
	
	UserDAO userDAO = new UserDAO();
	TeamDAO teamDAO = new TeamDAO();
	public ReqTeamJoinJson(String userUID, String teamUID) {
		this.user = userDAO.findByUserUID(userUID);
		this.team = teamDAO.findByTeamUID(teamUID);
	}
	
	
	
	
	
	public TeamJson getTeam() {
		return team;
	}





	public void setTeam(TeamJson team) {
		this.team = team;
	}





	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public boolean isConfirm() {
		return confirm;
	}
	public void setConfirm(boolean confirm) {
		this.confirm = confirm;
	}
	public UserJson getUser() {
		return user;
	}
	public void setUser(UserJson user) {
		this.user = user;
	}
	
	

}
