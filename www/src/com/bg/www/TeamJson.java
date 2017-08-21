package com.bg.www;

public class TeamJson {
	boolean error;
	String error_msg;
	
	String teamName;
	String regionA;
	String regionB;
	String teamBirth;
	String captainUid;
	
	public boolean isError() {
		return error;
	}
	public void setError(boolean error) {
		this.error = error;
	}
	
	public String getError_msg() {
		return error_msg;
	}
	public void setError_msg(String error_msg) {
		this.error_msg = error_msg;
	}
	
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getRegionA() {
		return regionA;
	}
	public void setRegionA(String regionA) {
		this.regionA = regionA;
	}
	public String getRegionB() {
		return regionB;
	}
	public void setRegionB(String regionB) {
		this.regionB = regionB;
	}
	public String getTeamBirth() {
		return teamBirth;
	}
	public void setTeamBirth(String teamBirth) {
		this.teamBirth = teamBirth;
	}
	public String getCaptainUid() {
		return captainUid;
	}
	public void setCaptainUid(String captainUid) {
		this.captainUid = captainUid;
	}
	
	
	
}
