package com.kh.shipcontrol.dao;

import com.kh.shipcontrol.vo.StatusVo;

public interface StatusDao {
	public void insertStatus(int sh_status_id, StatusVo statusVo);
	public void insertSensorStatus(int sh_status_id,int se_id, int se_status);
	public int getStatusId();
}
