package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;
import com.kh.shipcontrol.vo.PaginationDTO;
import com.kh.shipcontrol.vo.ShipStatusVo;

public interface ReportService {
	public void registReport(AcdVo acdVo);

	public List<AcdCodeVo> getAcdCode();

	public List<AcdVo> getWholeAcd(PaginationDTO dto);

	public AcdVo getAcdById(int Acd_id);

	public void addAcdHnd(AcdHndVo acdHndVo);

	public List<AcdHndVo> getAcdHnd(String acd_id);

	public List<AcdVo> getAcdListBySerachType(Map<String, Object> map);
	
	public int getAcdIdSeq();
	
	public int getReportCount();
	
	public void updateReportRun(AcdVo acdVo);
	
	public AcdHndVo getAcdVoById(String acd_hnd_id);
	
	public void updateAcdHndById(AcdHndVo acdHndVo);
	
	public void deleteReport(String acd_id);
	
	public int getAcdCountBySearchType(Map<String, Object> map);
	
	public List<ShipStatusVo> getShipLatLng(Map<String, String> map);
}
