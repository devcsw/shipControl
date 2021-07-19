package com.kh.shipcontrol.service;

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
		
		statusDao.insertStatus(statusVo);
		statusDao.insertSensorStatus(fire, statusVo.getFire());
		statusDao.insertSensorStatus(temperature, statusVo.getTemperature());
		statusDao.insertSensorStatus(smoke, statusVo.getSmoke());
		statusDao.insertSensorStatus(windspeed, statusVo.getWindSpeed());
		statusDao.insertSensorStatus(winddirection, statusVo.getWindDirection());
		statusDao.insertSensorStatus(gyroscope, statusVo.getGyroscope());
	}

}
