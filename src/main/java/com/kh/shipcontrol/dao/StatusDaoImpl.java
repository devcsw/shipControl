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
	public void insertStatus(int sh_status_id, StatusVo statusVo) {
		int sh_id = statusVo.getSh_id();
		String sh_status_latitude = statusVo.getSh_status_latitude();
		String sh_status_longitude = statusVo.getSh_status_longitude();
		Map<String, Object> map = new HashMap<>();
		map.put("sh_status_id", sh_status_id);
		map.put("sh_id", sh_id);
		map.put("sh_status_latitude", sh_status_latitude);
		map.put("sh_status_longitude", sh_status_longitude);
		sqlSession.insert(NAMESPACE + "insertStatus", map);
	}

	@Override
	public void insertSensorStatus(int sh_status_id, int se_id, int se_status) {
		Map<String, Object> map = new HashMap<>();
		map.put("sh_status_id", sh_status_id);
		map.put("se_id", se_id);
		map.put("se_status", se_status);
		sqlSession.insert(NAMESPACE + "insertSensorStatus", map);
	}

	@Override
	public int getStatusId() {
		return sqlSession.selectOne(NAMESPACE + "getStatusVal");
	}

}
