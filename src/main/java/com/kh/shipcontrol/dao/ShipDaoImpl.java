package com.kh.shipcontrol.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.ShipVo;

@Repository
public class ShipDaoImpl implements ShipDao {
	private static final String NAMESPACE = "com.kh.shipcontrol.ship.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertShip(ShipVo shipVo) {
		sqlSession.insert(NAMESPACE + "insertShip" ,shipVo); 
	}
	
	@Override
	public List<Map<String, Object>> listAllShip() {
		List<Map<String, Object>> list = 
				sqlSession.selectList(NAMESPACE + "listAllShip");
		return list;
	}

	@Override
	public void deleteShip(int sh_id) {
		sqlSession.delete(NAMESPACE + "insertShip" ,sh_id); 
	}
}
