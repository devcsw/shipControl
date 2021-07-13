package com.kh.shipcontrol.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shipcontrol.dao.ReportDao;
import com.kh.shipcontrol.vo.AcdVo;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	ReportDao reportDao;
	
	@Override
	public void registReport(AcdVo acdVo) {
		reportDao.registReport(acdVo);
		
	}

}
