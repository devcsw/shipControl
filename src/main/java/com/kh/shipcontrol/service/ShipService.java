package com.kh.shipcontrol.service;

import com.kh.shipcontrol.vo.SensorDto;
import com.kh.shipcontrol.vo.ShipVo;

public interface ShipService {
	public void registShip(ShipVo shipVo, SensorDto sensorDto);
	public void listAllShip();
}
	