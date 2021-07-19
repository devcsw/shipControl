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
	public List<Map<String, Object>> listAllShip(Map<String, String> map) {
		
		List<Map<String, Object>> list = 
				sqlSession.selectList(NAMESPACE + "listAllShip", map);
		return list;
	}

	@Override
	public void deleteShip(int sh_id) {
		sqlSession.delete(NAMESPACE + "deleteShip" ,sh_id); 
	}

	@Override
	public void updateShip(ShipVo shipVo) {
		sqlSession.update(NAMESPACE + "updateShip" ,shipVo); 
	}

	@Override
	public ShipVo selectOneShip(int sh_id) {
		return sqlSession.selectOne(NAMESPACE + "selectOneShip", sh_id);
	}

	@Override
	public ShipVo getShipInfoById(int sh_id) {
		ShipVo shipVo = sqlSession.selectOne(NAMESPACE + "getShipInfoById", sh_id);
		return shipVo;
	}

	@Override
	public List<ShipVo> getShipList() {
		List<ShipVo> list = sqlSession.selectList(NAMESPACE + "getShipList");
		return list;
	}
}
