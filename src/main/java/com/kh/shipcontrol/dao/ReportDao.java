package com.kh.shipcontrol.dao;

import java.util.List;

import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdVo;

public interface ReportDao {

	public void registReport(AcdVo acdVo);
	public List<AcdCodeVo> getAcdCode();
}
