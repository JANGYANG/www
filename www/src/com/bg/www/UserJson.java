package com.bg.www;

public class UserJson {
	boolean error;
	String error_msg;
	
	String userUID;
	String email;
	String name;
	String password;
	String salt;
	
	String birth;
	String regionA;
	String regionB;
	Integer height;
	Integer weight;
	String position;
	String teamName;
	
	public UserJson() {
		
	}
		
	public void setHeight(Integer height) {
		this.height = height;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public Integer getHeight() {
		return height;
	}

	public Integer getWeight() {
		return weight;
	}

	public String getUserUID() {
		return userUID;
	}

	public void setUserUID(String userUID) {
		this.userUID = userUID;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public boolean getError() {
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
	
	
	
}
