package com.kh.shipcontrol.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.shipcontrol.vo.UserVo;

@Repository
public class UserDaoImpl implements UserDao {
	
	private static final String NAMESPACE = "com.kh.shipcontrol.user.";

	@Inject
	SqlSession sqlsession;

	@Override
	public void registerUser(UserVo userVo) {
		sqlsession.insert(NAMESPACE + "registerUser" , userVo);

	}

	@Override
	public int loginRun(UserVo userVo) {
		int count = sqlsession.selectOne(NAMESPACE + "loginRun", userVo);
		return count;
	}

	@Override
	public UserVo getUserVo(String user_no) {
		UserVo userVo = sqlsession.selectOne(NAMESPACE + "getUserVo", user_no);
		return userVo;
	}

}
