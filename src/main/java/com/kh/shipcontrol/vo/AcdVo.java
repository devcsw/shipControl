package com.kh.shipcontrol.vo;

import java.sql.Timestamp;

public class AcdVo {

	private int acd_id;
	private int acd_code_id;
	private int acd_latitude;
	private int acd_longitude;
	private Timestamp acd_date;
	private String acd_remark;
	private String acd_take;
	private int sh_id;

	public AcdVo() {
	}

	public AcdVo(int acd_id, int acd_code_id, int acd_latitude, int acd_longitude, Timestamp acd_date,
			String acd_remark, String acd_take, int sh_id) {
		this.acd_id = acd_id;
		this.acd_code_id = acd_code_id;
		this.acd_latitude = acd_latitude;
		this.acd_longitude = acd_longitude;
		this.acd_date = acd_date;
		this.acd_remark = acd_remark;
		this.acd_take = acd_take;
		this.sh_id = sh_id;
	}

	public int getAcd_id() {
		return acd_id;
	}

	public void setAcd_id(int acd_id) {
		this.acd_id = acd_id;
	}

	public int getAcd_code_id() {
		return acd_code_id;
	}

	public void setAcd_code_id(int acd_code_id) {
		this.acd_code_id = acd_code_id;
	}

	public int getAcd_latitude() {
		return acd_latitude;
	}

	public void setAcd_latitude(int acd_latitude) {
		this.acd_latitude = acd_latitude;
	}

	public int getAcd_longitude() {
		return acd_longitude;
	}

	public void setAcd_longitude(int acd_longitude) {
		this.acd_longitude = acd_longitude;
	}

	public Timestamp getAcd_date() {
		return acd_date;
	}

	public void setAcd_date(Timestamp acd_date) {
		this.acd_date = acd_date;
	}

	public String getAcd_remark() {
		return acd_remark;
	}

	public void setAcd_remark(String acd_remark) {
		this.acd_remark = acd_remark;
	}

	public String getAcd_take() {
		return acd_take;
	}

	public void setAcd_take(String acd_take) {
		this.acd_take = acd_take;
	}

	public int getSh_id() {
		return sh_id;
	}

	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}

	@Override
	public String toString() {
		return "AcdVo [acd_id=" + acd_id + ", acd_code_id=" + acd_code_id + ", acd_latitude=" + acd_latitude
				+ ", acd_longitude=" + acd_longitude + ", acd_date=" + acd_date + ", acd_remark=" + acd_remark
				+ ", acd_take=" + acd_take + ", sh_id=" + sh_id + "]";
	}

}
