package home.inside.common.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.inside.common.repository.IPointDao;
import home.inside.common.vo.PointVo;

@Service
public class PointServiceImpl implements IPointService {

	@Autowired
	private IPointDao pointDao;

	public void insertPoint(PointVo vo) throws Exception {
		pointDao.insertPoint(vo);
	}

	public int selectCheck(String nickname) throws Exception {
		return pointDao.selectCheckIn(nickname);
	}

	public List<PointVo> selectList(String nickname) throws Exception {
		return pointDao.selectPointList(nickname);
	}

	public List<Date> selectMonth(String nickname) throws Exception {
		return pointDao.selectCheckMonth(nickname);
	}

	public void deletePoint(String nickname) throws Exception {
		pointDao.deletePoint(nickname);
	}

}
