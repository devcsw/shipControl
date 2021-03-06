package com.kh.shipcontrol.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.shipcontrol.dao.ReportDao;
import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;
import com.kh.shipcontrol.vo.PaginationDTO;
import com.kh.shipcontrol.vo.ShipStatusVo;

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
	public List<AcdVo> getWholeAcd(PaginationDTO dto) {
		List<AcdVo> list = reportDao.getWholeAcd(dto);
		return list;
	}

	@Override
	public AcdVo getAcdById(int Acd_id) {
		AcdVo acdVo = reportDao.getAcdById(Acd_id);
		return acdVo;
	}

	@Override
	@Transactional
	public void addAcdHnd(AcdHndVo acdHndVo) {
		reportDao.addAcdHnd(acdHndVo);
		reportDao.updateAcdTake(acdHndVo);

	}

	@Override
	public List<AcdHndVo> getAcdHnd(String acd_id) {
		List<AcdHndVo> list = reportDao.getAcdHnd(acd_id);
		return list;
	}

	@Override
	public List<AcdVo> getAcdListBySerachType(Map<String, Object> map) {
		List<AcdVo> list = reportDao.getAcdListBySerachType(map);
		return list;
	}

	@Override
	public int getAcdIdSeq() {
		int count = reportDao.getAcdIdSeq();
		return count;
	}

	@Override
	public int getReportCount() {
		int count = reportDao.getReportCount();
		return count;
	}

	@Override
	public void updateReportRun(AcdVo acdVo) {
		reportDao.updateReportRun(acdVo);
		
	}

	@Override
	public AcdHndVo getAcdVoById(String acd_hnd_id) {
		AcdHndVo acdHndVo = reportDao.getAcdVoById(acd_hnd_id);
		return acdHndVo;
	}

	@Override
	public void updateAcdHndById(AcdHndVo acdHndVo) {
		reportDao.updateAcdHndById(acdHndVo);
		
	}

	@Override
	public void deleteReport(String acd_id) {
		reportDao.deleteReport(acd_id);
		
	}

	@Override
	public int getAcdCountBySearchType(Map<String, Object> map) {
		int count = reportDao.getAcdCountBySearchType(map);
		return count;
	}

	@Override
	public List<ShipStatusVo> getShipLatLng(Map<String, String> map) {
		List<ShipStatusVo> list = reportDao.getShipLatLng(map);
		return list;
	}

}
