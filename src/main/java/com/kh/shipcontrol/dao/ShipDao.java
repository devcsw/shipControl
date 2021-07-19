package com.kh.shipcontrol.dao;

import java.util.List;
import java.util.Map;

import com.kh.shipcontrol.vo.ShipVo;

public interface ShipDao {
	//선박등록
	public void insertShip(ShipVo shipVo);
	//선박삭제
	public void deleteShip(int sh_id);
	//선박수정
	public void updateShip(ShipVo shipVo);
	public ShipVo selectOneShip(int sh_id);
	//선박리스트출력
	public List<Map<String, Object>> listAllShip(Map<String,String> map);
	public List<Map<String, Object>> getNotSensorList(Map<String,String> map);
	//id로 선박 vo 가져오기
	public ShipVo getShipInfoById(int sh_id);
<<<<<<< HEAD
	//validation
	public int checkDupId(int sh_id); 
	public int checkDupBoardCode(String sh_board_code); 
	public int checkDupMmsi(String sh_mmsi); 
	public int checkDupCallSign(String sh_call_sign); 
=======
	//선박 id와 이름 가져오기
	public List<ShipVo> getShipList();
>>>>>>> branch 'main' of https://github.com/devcsw/shipControl
}
