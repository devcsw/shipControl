package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.SensorDto;
import com.kh.shipcontrol.vo.ShipVo;

public interface ShipService {
	public void registShip(ShipVo shipVo, SensorDto sensorDto);
	public  List<Map<String, Object>>  listAllShip();
}
	