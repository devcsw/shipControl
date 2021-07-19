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
	public List<Map<String, Object>> getNotSensorList(Map<String, String> map) {
		
		List<Map<String, Object>> list = 
				sqlSession.selectList(NAMESPACE + "getNotSensorList", map);
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
	public int checkDupId(int sh_id) {
		return  sqlSession.selectOne(NAMESPACE + "checkDupId", sh_id);
		
	}

	@Override
	public int checkDupBoardCode(String sh_board_code) {
		return  sqlSession.selectOne(NAMESPACE + "checkDupBoardCode", sh_board_code);
		
	}

	@Override
	public int checkDupMmsi(String sh_mmsi) {
		return  sqlSession.selectOne(NAMESPACE + "checkDupMmsi", sh_mmsi);
		
	}

	@Override
	public int checkDupCallSign(String sh_call_sign) {
		return  sqlSession.selectOne(NAMESPACE + "checkDupCallSign", sh_call_sign);
		
	}
}
