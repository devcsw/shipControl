package com.kh.shipcontrol.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shipcontrol.dao.ReportDao;
import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdVo;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	ReportDao reportDao;
	
	@Override
	public void registReport(AcdVo acdVo) {
		reportDao.registReport(acdVo);
		
	}

	@Override
	public List<AcdCodeVo> getAcdCode() {
		List<AcdCodeVo> list = reportDao.getAcdCode();
		return list;
	}

}
