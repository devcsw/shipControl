package com.kh.shipcontrol.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.StatusVo;

@Repository
public class StatusDaoImpl implements StatusDao {
	private static final String NAMESPACE = "com.kh.shipcontrol.status.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertStatus( StatusVo statusVo) {
		sqlSession.insert(NAMESPACE + "insertStatus", statusVo);
	}

	@Override
	public void insertSensorStatus( int se_id, int se_status) {
		Map<String, Object> map = new HashMap<>();
		map.put("se_id", se_id);
		map.put("se_status", se_status);
		sqlSession.insert(NAMESPACE + "insertSensorStatus", map);
	}

}
