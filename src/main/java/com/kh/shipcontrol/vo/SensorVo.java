package com.kh.shipcontrol.vo;

public class SensorVo {

	private int se_id;
	private String se_name;
	public SensorVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SensorVo(int se_id, String se_name) {
		super();
		this.se_id = se_id;
		this.se_name = se_name;
	}
	public int getSe_id() {
		return se_id;
	}
	public void setSe_id(int se_id) {
		this.se_id = se_id;
	}
	public String getSe_name() {
		return se_name;
	}
	public void setSe_name(String se_name) {
		this.se_name = se_name;
	}
	@Override
	public String toString() {
		return "SensorVo [se_id=" + se_id + ", se_name=" + se_name + "]";
	}
	
}
