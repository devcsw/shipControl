package com.kh.shipcontrol.service;

import com.kh.shipcontrol.vo.UserVo;

public interface UserService {
	public void registerUser(UserVo userVo);
	public boolean loginRun(UserVo userVo);
	public UserVo getUserVo(String user_id);
}
