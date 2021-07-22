package com.kh.shipcontrol.vo;

import java.sql.Timestamp;

public class ShipStatusVo {

	public int sh_status_id;
	public int sh_id;
	public String sh_status_latitude;
	public String sh_status_longitude;
	public Timestamp sh_status_date;

	public ShipStatusVo() {

	}

	public ShipStatusVo(int sh_status_id, int sh_id, String sh_status_latitude, String sh_status_longitude,
			Timestamp sh_status_date) {
		this.sh_status_id = sh_status_id;
		this.sh_id = sh_id;
		this.sh_status_latitude = sh_status_latitude;
		this.sh_status_longitude = sh_status_longitude;
		this.sh_status_date = sh_status_date;
	}

	public int getSh_status_id() {
		return sh_status_id;
	}

	public void setSh_status_id(int sh_status_id) {
		this.sh_status_id = sh_status_id;
	}

	public int getSh_id() {
		return sh_id;
	}

	public void setSh_id(int sh_id) {
		this.sh_id = sh_id;
	}

	public String getSh_status_latitude() {
		return sh_status_latitude;
	}

	public void setSh_status_latitude(String sh_status_latitude) {
		this.sh_status_latitude = sh_status_latitude;
	}

	public String getSh_status_longitude() {
		return sh_status_longitude;
	}

	public void setSh_status_longitude(String sh_status_longitude) {
		this.sh_status_longitude = sh_status_longitude;
	}

	public Timestamp getSh_status_date() {
		return sh_status_date;
	}

	public void setSh_status_date(Timestamp sh_status_date) {
		this.sh_status_date = sh_status_date;
	}

	@Override
	public String toString() {
		return "ShipStatusVo [sh_status_id=" + sh_status_id + ", sh_id=" + sh_id + ", sh_status_latitude="
				+ sh_status_latitude + ", sh_status_longitude=" + sh_status_longitude + ", sh_status_date="
				+ sh_status_date + "]";
	}

}
