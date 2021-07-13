package com.kh.shipcontrol.vo;

public class UserVo {

	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_rank;
	private String user_phone;
	private int user_auth_level;

	public UserVo() {

	}

	public UserVo(int user_no, String user_id, String user_pw, String user_name, String user_rank, String user_phone,
			int user_auth_level) {
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_rank = user_rank;
		this.user_phone = user_phone;
		this.user_auth_level = user_auth_level;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_rank() {
		return user_rank;
	}

	public void setUser_rank(String user_rank) {
		this.user_rank = user_rank;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_auth_level() {
		return user_auth_level;
	}

	public void setUser_auth_level(int user_auth_level) {
		this.user_auth_level = user_auth_level;
	}

	@Override
	public String toString() {
		return "UserVo [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_rank=" + user_rank + ", user_phone=" + user_phone + ", user_auth_level="
				+ user_auth_level + "]";
	}

}
