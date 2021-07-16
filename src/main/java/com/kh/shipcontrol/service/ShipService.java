package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.SensorDto;
import com.kh.shipcontrol.vo.ShipVo;

public interface ShipService {
	public void registShip(ShipVo shipVo, SensorDto sensorDto);
	public void deleteShip(int sh_id);
	public void updateShip(ShipVo shipVo, SensorDto sensorDto);
	public Map<String, Object> selectOneShip(int sh_id);
	public  List<Map<String, Object>>  listAllShip();
}
	