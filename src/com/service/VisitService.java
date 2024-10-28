package com.service;
import java.util.List;
import org.springframework.stereotype.Service;
import com.entity.Visit;
@Service("visitService")
public interface VisitService {
	// 插入数据 调用visitDAO里的insertVisit配置
	public int insertVisit(Visit visit);

	// 更新数据 调用visitDAO里的updateVisit配置
	public int updateVisit(Visit visit);

	// 删除数据 调用visitDAO里的deleteVisit配置
	public int deleteVisit(String visitid);

	// 查询全部数据 调用visitDAO里的getAllVisit配置
	public List<Visit> getAllVisit();

	// 按照Visit类里面的字段名称精确查询 调用visitDAO里的getVisitByCond配置
	public List<Visit> getVisitByCond(Visit visit);

	// 按照Visit类里面的字段名称模糊查询 调用visitDAO里的getVisitByLike配置
	public List<Visit> getVisitByLike(Visit visit);

	// 按主键查询表返回单一的Visit实例 调用visitDAO里的getVisitById配置
	public Visit getVisitById(String visitid);

}

