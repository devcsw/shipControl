package com.kh.shipcontrol.vo;

import java.sql.Timestamp;

import com.google.gson.Gson;

public class StatusVo {
	
	private int sh_id;
	private String sh_status_latitude;
	private String sh_status_longitude;
	private int fire;
	private int temperature;
	private int windSpeed;
	private int smoke;
	private int gyroscope;
	private int windDirection;
	private String date;
	
	

	public StatusVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StatusVo(int sh_id, String sh_status_latitude, String sh_status_longitude, int fire, int temperature,
			int windSpeed, int smoke, int gyroscope, int windDirection, String date) {
		super();
		this.sh_id = sh_id;
		this.sh_status_latitude = sh_status_latitude;
		this.sh_status_longitude = sh_status_longitude;
		this.fire = fire;
		this.temperature = temperature;
		this.windSpeed = windSpeed;
		this.smoke = smoke;
		this.gyroscope = gyroscope;
		this.windDirection = windDirection;
		this.date = date;
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

	public int getFire() {
		return fire;
	}

	public void setFire(int fire) {
		this.fire = fire;
	}

	public int getTemperature() {
		return temperature;
	}

	public void setTemperature(int temperature) {
		this.temperature = temperature;
	}

	public int getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(int windSpeed) {
		this.windSpeed = windSpeed;
	}

	public int getSmoke() {
		return smoke;
	}

	public void setSmoke(int smoke) {
		this.smoke = smoke;
	}

	public int getGyroscope() {
		return gyroscope;
	}

	public void setGyroscope(int gyroscope) {
		this.gyroscope = gyroscope;
	}

	public int getWindDirection() {
		return windDirection;
	}

	public void setWindDirection(int windDirection) {
		this.windDirection = windDirection;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	
	@Override
	public String toString() {
		return "StatusVo [sh_id=" + sh_id + ", sh_status_latitude=" + sh_status_latitude + ", sh_status_longitude="
				+ sh_status_longitude + ", fire=" + fire + ", temperature=" + temperature + ", windSpeed=" + windSpeed
				+ ", smoke=" + smoke + ", gyroscope=" + gyroscope + ", windDirection=" + windDirection + ", date="
				+ date + "]";
	}

	public static StatusVo convertStatus(String source) {
		System.out.println("source:" + source);
		
		StatusVo statusVo = new StatusVo();
		Gson gson = new Gson();
		statusVo = gson.fromJson(source, StatusVo.class);
		
		System.out.println("statusVo:" + statusVo);
		return statusVo;
	}
	
}


