package com.kh.shipcontrol.service;

import java.util.List;

import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdVo;

public interface ReportService {
	public void registReport(AcdVo acdVo);
	public List<AcdCodeVo> getAcdCode();
	public List<AcdVo> getWholeAcd();
	public AcdVo getAcdById(int Acd_id);
}
