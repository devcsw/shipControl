package com.kh.shipcontrol.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.ShipSensorVo;
import com.kh.shipcontrol.vo.ShipVo;

@Repository
public class SensorDaoImpl implements SensorDao {
	private static final String NAMESPACE = "com.kh.shipcontrol.sensor.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertSensor(ShipSensorVo shipSensorVo) {
	
		sqlSession.insert(NAMESPACE + "insertSensor", shipSensorVo); 
	}
	
	@Override
	public List<ShipVo> listShipSensor() {
		List<ShipVo> list = 
				sqlSession.selectList(NAMESPACE + "listShipSensor");
		return list;
	}
}
