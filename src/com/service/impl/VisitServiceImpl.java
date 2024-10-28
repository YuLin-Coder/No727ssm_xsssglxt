package com.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.VisitDAO;
import com.entity.Visit;
import com.service.VisitService;

@Service("visitService")
public class VisitServiceImpl implements VisitService {
	@Autowired
	private VisitDAO visitDAO;
	@Override // 继承接口的新增 返回值0(失败),1(成功)
	public int insertVisit(Visit visit) {
		return this.visitDAO.insertVisit(visit);
	}

	@Override // 继承接口的更新 返回值0(失败),1(成功)
	public int updateVisit(Visit visit) {
		return this.visitDAO.updateVisit(visit);
	}

	@Override // 继承接口的删除 返回值0(失败),1(成功)
	public int deleteVisit(String visitid) {
		return this.visitDAO.deleteVisit(visitid);
	}

	@Override // 继承接口的查询全部
	public List<Visit> getAllVisit() {
		return this.visitDAO.getAllVisit();
	}

	@Override // 继承接口的按条件精确查询
	public List<Visit> getVisitByCond(Visit visit) {
		return this.visitDAO.getVisitByCond(visit);
	}

	@Override // 继承接口的按条件模糊查询
	public List<Visit> getVisitByLike(Visit visit) {
		return this.visitDAO.getVisitByLike(visit);
	}

	@Override // 继承接口的按主键查询 返回Entity实例
	public Visit getVisitById(String visitid) {
		return this.visitDAO.getVisitById(visitid);
	}

}

