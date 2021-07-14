package com.kh.shipcontrol.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.AcdCodeVo;
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

}
