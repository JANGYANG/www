package com.bg.www;

public class UserJson {
	boolean error;
	String error_msg;
	
	String unique_id;
	String email;
	String name;
	String password;
	String salt;
	
	String birth;
	String region_a;
	String region_b;
	Integer height;
	Integer weight;
	String position;
	String team_uid;
	
	public UserJson() {
		
	}
	
	public UserJson(String paramEmail, String paramName, String paramBirth, String paramRegion_a, String paramRegion_b, Integer paramHeight, Integer paramWeight, String paramPosition, String paramTeam_uid){
		email = paramEmail;
		name = paramName;
		birth = paramBirth;
		region_a = paramRegion_a;
		region_b = paramRegion_b;
		height = paramHeight;
		weight = paramWeight;
		position = paramPosition;
		team_uid = paramTeam_uid;
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
	public String getRegion_a() {
		return region_a;
	}
	public void setRegion_a(String region_a) {
		this.region_a = region_a;
	}
	public String getRegion_b() {
		return region_b;
	}
	public void setRegion_b(String region_b) {
		this.region_b = region_b;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getTeam_uid() {
		return team_uid;
	}
	public void setTeam_uid(String team_uid) {
		this.team_uid = team_uid;
	}

	public String getUnique_id() {
		return unique_id;
	}
	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
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
