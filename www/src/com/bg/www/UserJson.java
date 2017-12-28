package com.bg.www;

import java.util.ArrayList;

public class UserJson {
	boolean error;
	String errorMsg;
	
	String userUID;
	String email;
	String name;
	String password;
	String salt;
	
	String job;
	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	String birth;
	Integer height;
	Integer weight;
	String teamUID;
	
	ArrayList<String> position = new ArrayList<String>();
	
	ArrayList<Region> region = new ArrayList<Region>();
	
	public ArrayList<Region> getRegion() {
		return this.region;
	}

	public void setRegion(String mainRegion, String subRegion) {
		Region newRegion = new Region(mainRegion, subRegion);
		this.region.add(newRegion);
	}
	
	public boolean isError() {
		return error;
	}

	public void setError(boolean error) {
		this.error = error;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getUserUID() {
		return userUID;
	}

	public void setUserUID(String userUID) {
		this.userUID = userUID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getTeamUID() {
		return teamUID;
	}

	public void setTeamUID(String teamUID) {
		this.teamUID = teamUID;
	}

	public ArrayList<String> getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position.add(position);
	}
}