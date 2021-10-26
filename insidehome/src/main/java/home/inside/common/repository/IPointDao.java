package home.inside.common.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.ognl.Ognl;

import home.inside.common.vo.PointVo;

public interface IPointDao {
	// 포인트 변동내역 추가
	public void insertPoint(PointVo vo) throws Exception;
	
	// 오늘 출석여부 확인
	public int selectCheckIn(String nickname) throws Exception;
	
	// 최근 30일 포인트 변동내역 확인
	public List<PointVo> selectPointList(String nickname) throws Exception;
	
	// 이달의 출석일자 확인
	public List<Date> selectCheckMonth(String nickname) throws Exception;
	
	// 회원탈퇴 시 포인트내용 삭제
	public void deletePoint(String nickname) throws Exception;
}
