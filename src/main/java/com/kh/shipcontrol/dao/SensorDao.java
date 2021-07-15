package com.kh.shipcontrol.dao;

import java.util.List;

import com.kh.shipcontrol.vo.ShipSensorVo;
import com.kh.shipcontrol.vo.ShipVo;

public interface SensorDao {
	public static final int FIRE = 1;
	public static final int TEMPERATURE = 2;
	public static final int SMOKE = 3;
	public static final int WINDSPEED = 4;
	public static final int WINDDIRECTION = 5;
	public static final int GYROSCOPE = 6;
	

	//센서등록
	public void insertSensor(ShipSensorVo shipSensorVo);
	public void deleteSensor(int sh_id);
	//선박별 센서 리스트
	public List<ShipVo> listShipSensor();
	
}
