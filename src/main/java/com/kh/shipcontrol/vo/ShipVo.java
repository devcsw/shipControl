package com.kh.shipcontrol.vo;

import java.sql.Timestamp;

public class ShipVo {
	private int sh_id;
	private String sh_name;
	private String sh_board_code;
	private String sh_owner;
	private String sh_owner_tel;
	private String sh_cap_name;
	private String sh_cap_tel;
	private String sh_type;
	private int sh_mmsi;
	private int sh_call_sign;
	private Timestamp sh_date;

	
	public ShipVo() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ShipVo(int sh_id, String sh_name, String sh_board_code, String sh_owner, String sh_owner_tel,
			String sh_cap_name, String sh_cap_tel, String sh_type, int sh_mmsi, int sh_call_sign) {
		super();
		this.sh_id = sh_id;
		this.sh_name = sh_name;
		this.sh_board_code = sh_board_code;
		this.sh_owner = sh_owner;
		this.sh_owner_tel = sh_owner_tel;
		this.sh_cap_name = sh_cap_name;
		this.sh_cap_tel = sh_cap_tel;
		this.sh_type = sh_type;
		this.sh_mmsi = sh_mmsi;
		this.sh_call_sign = sh_call_sign;
	}


	public ShipVo(int sh_id, String sh_name, String sh_board_code, String sh_owner, String sh_owner_tel,
			String sh_cap_name, String sh_cap_tel, String sh_type, int sh_mmsi, int sh_call_sign, Timestamp sh_date) {
		super();
		this.sh_id = sh_id;
		this.sh_name = sh_name;
		this.sh_board_code = sh_board_code;
		this.sh_owner = sh_owner;
		this.sh_owner_tel = sh_owner_tel;
		this.sh_cap_name = sh_cap_name;
		this.sh_cap_tel = sh_cap_tel;
		this.sh_type = sh_type;
		this.sh_mmsi = sh_mmsi;
		this.sh_call_sign = sh_call_sign;
		this.sh_date = sh_date;
	}


	public int getSh_id() {
		return sh_id;
	}


	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}


	public String getSh_name() {
		return sh_name;
	}


	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}


	public String getSh_board_code() {
		return sh_board_code;
	}


	public void setSh_board_code(String sh_board_code) {
		this.sh_board_code = sh_board_code;
	}


	public String getSh_owner() {
		return sh_owner;
	}


	public void setSh_owner(String sh_owner) {
		this.sh_owner = sh_owner;
	}


	public String getSh_owner_tel() {
		return sh_owner_tel;
	}


	public void setSh_owner_tel(String sh_owner_tel) {
		this.sh_owner_tel = sh_owner_tel;
	}


	public String getSh_cap_name() {
		return sh_cap_name;
	}


	public void setSh_cap_name(String sh_cap_name) {
		this.sh_cap_name = sh_cap_name;
	}


	public String getSh_cap_tel() {
		return sh_cap_tel;
	}


	public void setSh_cap_tel(String sh_cap_tel) {
		this.sh_cap_tel = sh_cap_tel;
	}


	public String getSh_type() {
		return sh_type;
	}


	public void setSh_type(String sh_type) {
		this.sh_type = sh_type;
	}


	public int getSh_mmsi() {
		return sh_mmsi;
	}


	public void setSh_mmsi(int sh_mmsi) {
		this.sh_mmsi = sh_mmsi;
	}


	public int getSh_call_sign() {
		return sh_call_sign;
	}


	public void setSh_call_sign(int sh_call_sign) {
		this.sh_call_sign = sh_call_sign;
	}


	public Timestamp getSh_date() {
		return sh_date;
	}


	public void setSh_date(Timestamp sh_date) {
		this.sh_date = sh_date;
	}


	@Override
	public String toString() {
		return "ShipVo [sh_id=" + sh_id + ", sh_name=" + sh_name + ", sh_board_code=" + sh_board_code + ", sh_owner="
				+ sh_owner + ", sh_owner_tel=" + sh_owner_tel + ", sh_cap_name=" + sh_cap_name + ", sh_cap_tel="
				+ sh_cap_tel + ", sh_type=" + sh_type + ", sh_mmsi=" + sh_mmsi + ", sh_call_sign=" + sh_call_sign
				+ ", sh_date=" + sh_date + "]";
	}
	
	
	
}
