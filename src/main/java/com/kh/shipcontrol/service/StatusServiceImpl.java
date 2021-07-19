package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.shipcontrol.dao.SensorDao;
import com.kh.shipcontrol.dao.StatusDao;
import com.kh.shipcontrol.vo.StatusVo;

@Service
public class StatusServiceImpl implements StatusService {

	@Inject
	StatusDao statusDao;
	@Inject
	SensorDao sensorDao;
	
	@Transactional
	@Override
	public void insertStautus(StatusVo statusVo) {
		int fire = sensorDao.FIRE;
		int temperature = sensorDao.TEMPERATURE;
		int smoke = sensorDao.SMOKE;
		int windspeed = sensorDao.WINDSPEED;
		int winddirection = sensorDao.WINDDIRECTION;
		int gyroscope = sensorDao.GYROSCOPE;
		int statusVal = statusDao.getStatusId();
		
		statusDao.insertStatus(statusVal, statusVo);
		statusDao.insertSensorStatus(statusVal, fire, statusVo.getFire());
		statusDao.insertSensorStatus(statusVal, temperature, statusVo.getTemperature());
		statusDao.insertSensorStatus(statusVal, smoke, statusVo.getSmoke());
		statusDao.insertSensorStatus(statusVal, windspeed, statusVo.getWindSpeed());
		statusDao.insertSensorStatus(statusVal, winddirection, statusVo.getWindDirection());
		statusDao.insertSensorStatus(statusVal, gyroscope, statusVo.getGyroscope());
	}

	@Override
	public List<Map<String, Object>> getStatusList(int sh_id) {
		List<Map<String, Object>> list = statusDao.statusList(sh_id);
		 
		return list;
	}

}
