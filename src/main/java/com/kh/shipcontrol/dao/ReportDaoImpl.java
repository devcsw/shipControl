package com.kh.shipcontrol.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.AcdCodeVo;
import com.kh.shipcontrol.vo.AcdHndVo;
import com.kh.shipcontrol.vo.AcdVo;

@Repository
public class ReportDaoImpl implements ReportDao {

	private static final String NAMESPACE = "com.kh.shipcontrol.report.";

	@Inject
	SqlSession sqlsession;

	@Override
	public void registReport(AcdVo acdVo) {
		sqlsession.insert(NAMESPACE + "registReport", acdVo);
	}

	@Override
	public List<AcdCodeVo> getAcdCode() {
		List<AcdCodeVo> list = sqlsession.selectList(NAMESPACE + "getAcdCode");
		return list;
	}

	@Override
	public List<AcdVo> getWholeAcd() {
		List<AcdVo> list = sqlsession.selectList(NAMESPACE + "getWholeAcd");
		return list;
	}

	@Override
	public AcdVo getAcdById(int Acd_id) {
		AcdVo acdVo = sqlsession.selectOne(NAMESPACE + "getAcdById", Acd_id);
		return acdVo;
	}

	@Override
	public void addAcdHnd(AcdHndVo acdHndVo) {
		sqlsession.insert(NAMESPACE + "addAcdHnd", acdHndVo);

	}

	@Override
	public List<AcdHndVo> getAcdHnd(String acd_id) {
		List<AcdHndVo> list = sqlsession.selectList(NAMESPACE + "getAcdHnd", acd_id);
		return list;
	}

	@Override
	public List<AcdVo> getAcdListBySerachType(Map<String, String> map) {
		List<AcdVo> acdVo = sqlsession.selectList(NAMESPACE + "getAcdListBySerachType", map);
		return acdVo;
	}

	@Override
	public void updateAcdTake(AcdHndVo acdHndVo) {
		sqlsession.update(NAMESPACE + "updateAcdTake", acdHndVo);
		
	}

	@Override
	public int getAcdIdSeq() {
		int count = sqlsession.selectOne(NAMESPACE + "getAcdIdSeq");
		return count;
	}

}
