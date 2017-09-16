package com.bg.www;

public class RegionJson {
	boolean error;
	String error_msg;
	
	String sidoA;
	String gugunA;
	String sidoB;
	String gugunB;
	
	public RegionJson() {
	}
	public String getsidoA() {
		return sidoA;
	}
	public void setsidoA(String sidoA) {
		this.sidoA =sidoA;
	}
	public String getgugunA() {
		return gugunA;
	}
	public void setgugunA(String gugunA) {
		this.gugunA = gugunA;
	}
	public String getsidoB() {
		return sidoB;
	}
	public void setsidoB(String sidoB) {
		this.sidoB =sidoB;
	}
	public String getgugunB() {
		return gugunB;
	}
	public void setgugunB(String gugunB) {
		this.gugunB = gugunB;
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


