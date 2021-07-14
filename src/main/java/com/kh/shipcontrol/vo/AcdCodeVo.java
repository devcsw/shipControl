package com.kh.shipcontrol.vo;

public class AcdCodeVo {

	private int acd_code_id;
	private String acd_code_name;

	public AcdCodeVo() {
		
	}

	public AcdCodeVo(int acd_code_id, String acd_code_name) {
		this.acd_code_id = acd_code_id;
		this.acd_code_name = acd_code_name;
	}

	public int getAcd_code_id() {
		return acd_code_id;
	}

	public void setAcd_code_id(int acd_code_id) {
		this.acd_code_id = acd_code_id;
	}

	public String getAcd_code_name() {
		return acd_code_name;
	}

	public void setAcd_code_name(String acd_code_name) {
		this.acd_code_name = acd_code_name;
	}

	@Override
	public String toString() {
		return "AcdCodeVo [acd_code_id=" + acd_code_id + ", acd_code_name=" + acd_code_name + "]";
	}

}
