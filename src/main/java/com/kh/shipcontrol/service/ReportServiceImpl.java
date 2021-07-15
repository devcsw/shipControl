package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shipcontrol.dao.ReportDao;
import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
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

	@Override
	public List<AcdVo> getWholeAcd() {
		List<AcdVo> list = reportDao.getWholeAcd();
		return list;
	}

	@Override
	public AcdVo getAcdById(int Acd_id) {
		AcdVo acdVo = reportDao.getAcdById(Acd_id);
		return acdVo;
	}

	@Override
	public void addAcdHnd(AcdHndVo acdHndVo) {
		reportDao.addAcdHnd(acdHndVo);

	}

	@Override
	public List<AcdHndVo> getAcdHnd(String acd_id) {
		List<AcdHndVo> list = reportDao.getAcdHnd(acd_id);
		return list;
	}

	@Override
	public List<AcdVo> getAcdListBySerachType(Map<String, String> map) {
		List<AcdVo> list = reportDao.getAcdListBySerachType(map);
		return list;
	}

}
