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

}
