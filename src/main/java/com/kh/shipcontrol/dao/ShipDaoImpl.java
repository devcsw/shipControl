package com.kh.shipcontrol.dao;

import java.util.List;

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
	public List<ShipVo> listShip() {
		List<ShipVo> list = 
				sqlSession.selectList(NAMESPACE + "listShip");
		return list;
	}
}
