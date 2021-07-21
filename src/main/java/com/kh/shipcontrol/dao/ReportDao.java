package com.kh.shipcontrol.dao;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;
import com.kh.shipcontrol.vo.PaginationDTO;

public interface ReportDao {

	public void registReport(AcdVo acdVo);

	public List<AcdCodeVo> getAcdCode();

	public List<AcdVo> getWholeAcd(PaginationDTO dto);

	public AcdVo getAcdById(int Acd_id);

	public void addAcdHnd(AcdHndVo acdHndVo);

	public List<AcdHndVo> getAcdHnd(String acd_id);

	public List<AcdVo> getAcdListBySerachType(Map<String, String> map);
	
	public void updateAcdTake(AcdHndVo acdHndVo);
	
	public int getAcdIdSeq();
	
	public int getReportCount();
	
	public void updateReportRun(AcdVo acdVo);
	
	public AcdHndVo getAcdVoById(String acd_hnd_id);
	
	public void updateAcdHndById(AcdHndVo acdHndVo);
	
	public void deleteReport(String acd_id);
	
}
