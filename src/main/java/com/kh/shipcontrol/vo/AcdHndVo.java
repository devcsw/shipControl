package com.kh.shipcontrol.vo;

import java.sql.Timestamp;

public class AcdHndVo {

	private int acd_hnd_id;
	private int acd_id;
	private String acd_hnd_content;
	private Timestamp acd_hnd_date;
	private String acd_hnd_take;
	private String user_id;

	public AcdHndVo() {
	}

	public AcdHndVo(int acd_hnd_id, int acd_id, String acd_hnd_content, Timestamp acd_hnd_date, String acd_hnd_take,
			String user_id) {
		this.acd_hnd_id = acd_hnd_id;
		this.acd_id = acd_id;
		this.acd_hnd_content = acd_hnd_content;
		this.acd_hnd_date = acd_hnd_date;
		this.acd_hnd_take = acd_hnd_take;
		this.user_id = user_id;
	}

	public int getAcd_hnd_id() {
		return acd_hnd_id;
	}

	public void setAcd_hnd_id(int acd_hnd_id) {
		this.acd_hnd_id = acd_hnd_id;
	}

	public int getAcd_id() {
		return acd_id;
	}

	public void setAcd_id(int acd_id) {
		this.acd_id = acd_id;
	}

	public String getAcd_hnd_content() {
		return acd_hnd_content;
	}

	public void setAcd_hnd_content(String acd_hnd_content) {
		this.acd_hnd_content = acd_hnd_content;
	}

	public Timestamp getAcd_hnd_date() {
		return acd_hnd_date;
	}

	public void setAcd_hnd_date(Timestamp acd_hnd_date) {
		this.acd_hnd_date = acd_hnd_date;
	}

	public String getAcd_hnd_take() {
		return acd_hnd_take;
	}

	public void setAcd_hnd_take(String acd_hnd_take) {
		this.acd_hnd_take = acd_hnd_take;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "AcdHndVo [acd_hnd_id=" + acd_hnd_id + ", acd_id=" + acd_id + ", acd_hnd_content=" + acd_hnd_content
				+ ", acd_hnd_date=" + acd_hnd_date + ", acd_hnd_take=" + acd_hnd_take + ", user_id=" + user_id + "]";
	}

}
