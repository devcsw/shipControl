package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.StatusVo;

public interface StatusService {
	public void insertStautus(StatusVo statusVo);
	public List<Map<String, Object>> getStatusList(int sh_id);
	
}
