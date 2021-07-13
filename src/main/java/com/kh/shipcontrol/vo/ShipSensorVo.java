package com.kh.shipcontrol.vo;

public class ShipSensorVo {
	private int sh_id;
	private int se_id;
	public ShipSensorVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShipSensorVo(int sh_id, int se_id) {
		super();
		this.sh_id = sh_id;
		this.se_id = se_id;
	}
	public int getSh_id() {
		return sh_id;
	}
	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}
	public int getSe_id() {
		return se_id;
	}
	public void setSe_id(int se_id) {
		this.se_id = se_id;
	}
	@Override
	public String toString() {
		return "ShipSensorVo [sh_id=" + sh_id + ", se_id=" + se_id + "]";
	}
	
}
