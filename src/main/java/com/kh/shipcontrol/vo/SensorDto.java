package com.kh.shipcontrol.vo;

public class SensorDto {
	private String fire;
	private String temperature;
	private String windSpeed;
	private String windDirection;
	private String smoke;
	private String gyroscope;
	
	public SensorDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SensorDto(String fire, String temperature, String windSpeed, String windDirection, String smoke,
			String gyroscope) {
		super();
		this.fire = fire;
		this.temperature = temperature;
		this.windSpeed = windSpeed;
		this.windDirection = windDirection;
		this.smoke = smoke;
		this.gyroscope = gyroscope;
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
		return "SensorDto [fire=" + fire + ", temperature=" + temperature + ", windSpeed=" + windSpeed
				+ ", windDirection=" + windDirection + ", smoke=" + smoke + ", gyroscope=" + gyroscope + "]";
	}
	
	
	
}
