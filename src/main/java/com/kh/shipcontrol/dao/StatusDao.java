package com.kh.shipcontrol.dao;

import com.kh.shipcontrol.vo.StatusVo;

public interface StatusDao {
	public void insertStatus( StatusVo statusVo);
	public void insertSensorStatus(int se_id, int se_status);
	
}
