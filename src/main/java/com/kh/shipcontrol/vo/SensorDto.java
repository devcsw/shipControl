package com.kh.shipcontrol.vo;

public class SensorDto {
	private String fire;
	private String temperature;
	private String windSpeed;
	private String smoke;
	private String gyroscope;
	private String windDirection;
	public SensorDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SensorDto(String fire, String temperature, String windSpeed, String smoke, String gyroscope,
			String windDirection) {
		super();
		this.fire = fire;
		this.temperature = temperature;
		this.windSpeed = windSpeed;
		this.smoke = smoke;
		this.gyroscope = gyroscope;
		this.windDirection = windDirection;
	}
	public String getFire() {
		return fire;
	}
	public void setFire(String fire) {
		this.fire = fire;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public String getWindSpeed() {
		return windSpeed;
	}
	public void setWindSpeed(String windSpeed) {
		this.windSpeed = windSpeed;
	}
	public String getSmoke() {
		return smoke;
	}
	public void setSmoke(String smoke) {
		this.smoke = smoke;
	}
	public String getGyroscope() {
		return gyroscope;
	}
	public void setGyroscope(String gyroscope) {
		this.gyroscope = gyroscope;
	}
	public String getWindDirection() {
		return windDirection;
	}
	public void setWindDirection(String windDirection) {
		this.windDirection = windDirection;
	}
	@Override
	public String toString() {
		return "SensorDto [fire=" + fire + ", temperature=" + temperature + ", windSpeed=" + windSpeed + ", smoke="
				+ smoke + ", gyroscope=" + gyroscope + ", windDirection=" + windDirection + "]";
	}
	
	
}
