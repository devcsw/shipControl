package com.kh.shipcontrol.dao;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.StatusVo;

public interface StatusDao {
	public void insertStatus(int sh_status_id, StatusVo statusVo);
	public void insertSensorStatus(int sh_status_id,int se_id, int se_status);
	public int getStatusId();
	
	public List<Map<String, Object>> statusList(int sh_id);
		
}
