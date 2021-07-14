package com.kh.shipcontrol.service;

import java.util.ArrayList;
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
	
	public List<Map<String, Object>> listAllShip() {
		List<Map<String, Object>> list = shipDao.listAllShip();
		 return list;
	}
	
}
