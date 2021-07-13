package com.kh.shipcontrol.dao;

import java.util.List;

import com.kh.shipcontrol.vo.ShipVo;

public interface ShipDao {
	//선박등록
	public void insertShip(ShipVo shipVo);
	//선박리스트출력
	public List<ShipVo> listShip();
}
