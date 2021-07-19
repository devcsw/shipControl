package com.kh.shipcontrol.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.shipcontrol.dao.SensorDao;
import com.kh.shipcontrol.dao.ShipDao;
import com.kh.shipcontrol.vo.SensorDto;
import com.kh.shipcontrol.vo.ShipSensorVo;
import com.kh.shipcontrol.vo.ShipVo;

@Service
public class ShipServiceImpl implements ShipService {
	
	@Inject
	private SensorDao sensorDao;
	
	@Inject
	private ShipDao shipDao;
	
	@Transactional
	@Override
	public void registShip(ShipVo shipVo, SensorDto sensorDto) {
		int sh_id = shipVo.getSh_id();
		shipDao.insertShip(shipVo);
		
		//Dto 길이 확인용  화재		온도		연기		풍속		풍향		기울기
		//다른 좋은 방법이 없을 지 생각해보기
		List<String> list = new ArrayList<String>();
		list.add(sensorDto.getFire());
		list.add(sensorDto.getTemperature());
		list.add(sensorDto.getSmoke());
		list.add(sensorDto.getWindSpeed());
		list.add(sensorDto.getWindDirection());
		list.add(sensorDto.getGyroscope());
		//센서 데이터 입력 부분
		for(int i =0; i < list.size();i++) {
			if (!(String.valueOf(list.get(i))).equals("null")) {
			System.out.println(String.valueOf(list.get(i)));
				ShipSensorVo shipSensorVo = new ShipSensorVo(sh_id, Integer.parseInt(list.get(i)));
				sensorDao.insertSensor(shipSensorVo);
			}
		}
	}
	
	public List<Map<String, Object>> listAllShip(Map<String,String> map) {
		List<Map<String, Object>> list = shipDao.listAllShip(map);
		 return list;
	}
	public List<Map<String, Object>> getNotSensorList(Map<String,String> map) {
		List<Map<String, Object>> list = shipDao.getNotSensorList(map);
		return list;
	}

	@Transactional
	@Override
	public void deleteShip(int sh_id) {
		//fk삭제를 위해 순서
		sensorDao.deleteSensor(sh_id);
		shipDao.deleteShip(sh_id);
	}
	@Transactional
	@Override
	public void updateShip(ShipVo shipVo, SensorDto sensorDto) {
		
		int sh_id = shipVo.getSh_id();
		shipDao.updateShip(shipVo);
		//센서데이터 삭제 후 다시 설정
		sensorDao.deleteSensor(sh_id);
		List<String> list = new ArrayList<String>();
		list.add(sensorDto.getFire());
		list.add(sensorDto.getTemperature());
		list.add(sensorDto.getSmoke());
		list.add(sensorDto.getWindSpeed());
		list.add(sensorDto.getWindDirection());
		list.add(sensorDto.getGyroscope());
		
		for(int i =0; i < list.size();i++) {
			if (!(String.valueOf(list.get(i))).equals("null")) {
			System.out.println(String.valueOf(list.get(i)));
				ShipSensorVo shipSensorVo = new ShipSensorVo(sh_id, Integer.parseInt(list.get(i)));
				sensorDao.insertSensor(shipSensorVo);
			}
		}
	}

	@Override
	public Map<String, Object> selectOneShip(int sh_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		ShipVo shipVo = shipDao.selectOneShip(sh_id);
		SensorDto sensorDto = sensorDao.selectShipSensor(sh_id);
		map.put("ShipVo", shipVo);
		map.put("SensorDto", sensorDto);
		
		return map;
	}
	@Override
	public ShipVo getShipInfoById(int sh_id) {
		ShipVo shipVo = shipDao.getShipInfoById(sh_id);
		return shipVo;
	}

	@Override
	public Map<String, Integer> dupShip(ShipVo shipVo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int sh_id = shipDao.checkDupId(shipVo.getSh_id());
		int sh_board_code = shipDao.checkDupBoardCode(shipVo.getSh_board_code());
		int sh_mmsi = shipDao.checkDupMmsi(shipVo.getSh_mmsi());
		int sh_call_sign =shipDao.checkDupCallSign(shipVo.getSh_call_sign());
		map.put("sh_id", sh_id);
		map.put("sh_board_code", sh_board_code);
		map.put("sh_mmsi", sh_mmsi);
		map.put("sh_call_sign", sh_call_sign);
		return map;
	}
	public List<ShipVo> getShipList() {
		List<ShipVo> list = shipDao.getShipList();
		return list;
	}
	
}
