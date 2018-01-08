package com.bg.www;

import java.util.ArrayList;

public class TeamJson {
	boolean error;
	String error_msg;
	String teamUID;
	String teamName;
	String teamBirth;
	int teamColor;
	String captainUID;
	ArrayList<String> formation = new ArrayList<String>();
	
	ArrayList<Region> region = new ArrayList<Region>();
	
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
	public String getTeamUID() {
		return teamUID;
	}
	public void setTeamUID(String teamUID) {
		this.teamUID = teamUID;
	}
	public String getTeamBirth() {
		return teamBirth;
	}
	public void setTeamBirth(String teamBirth) {
		this.teamBirth = teamBirth;
	}
	public int getTeamColor() {
		return teamColor;
	}
	public void setTeamColor(int teamColor) {
		this.teamColor = teamColor;
	}
	public String getCaptainUID() {
		return captainUID;
	}
	public void setCaptainUID(String captainUID) {
		this.captainUID = captainUID;
	}

	
	
	public ArrayList<String> getFormation(){
		return this.formation;
	}
	public void setFormation(String formation) {
		this.formation.add(formation);
	}
	
	public ArrayList<Region> getRegion() {
		return this.region;
	}

	public void setRegion(String mainRegion, String subRegion) {
		Region newRegion = new Region(mainRegion, subRegion);
		this.region.add(newRegion);
	}
	
}