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

}
