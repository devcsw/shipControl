package com.kh.shipcontrol.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.shipcontrol.dao.UserDao;
import com.kh.shipcontrol.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDao userDao;

	@Override
	public void registerUser(UserVo userVo) {
		userDao.registerUser(userVo);

	}

	@Override
	public boolean loginRun(UserVo userVo) {
		int count = userDao.loginRun(userVo);
		if (count > 0) {
			// true -> 회원가입 되어있다
			return true;
		}
		return false;
	}

	@Override
	public UserVo getUserVo(String user_id) {
		UserVo userVo = userDao.getUserVo(user_id);
		return userVo;
	}

}
