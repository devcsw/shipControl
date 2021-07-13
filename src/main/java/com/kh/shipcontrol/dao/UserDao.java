package com.kh.shipcontrol.dao;

import com.kh.shipcontrol.vo.UserVo;

public interface UserDao {
	public void registerUser(UserVo userVo);
	public int loginRun(UserVo userVo);
	public UserVo getUserVo(String user_no);

}
