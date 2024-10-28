package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.entity.Visit;

@Repository("visitDAO") // Repository标签定义数据库连接的访问 Spring中直接
@Mapper
public interface VisitDAO {

	/**
* VisitDAO 接口 可以按名称直接调用visit.xml配置文件的SQL语句
 */

	// 插入数据 调用entity包visit.xml里的insertVisit配置 返回值0(失败),1(成功)
	public int insertVisit(Visit visit);

	// 更新数据 调用entity包visit.xml里的updateVisit配置 返回值0(失败),1(成功)
	public int updateVisit(Visit visit);

	// 删除数据 调用entity包visit.xml里的deleteVisit配置 返回值0(失败),1(成功)
	public int deleteVisit(String visitid);

	// 查询全部数据 调用entity包visit.xml里的getAllVisit配置 返回List类型的数据
	public List<Visit> getAllVisit();

	// 按照Visit类里面的值精确查询 调用entity包visit.xml里的getVisitByCond配置 返回List类型的数据
	public List<Visit> getVisitByCond(Visit visit);

	// 按照Visit类里面的值模糊查询 调用entity包visit.xml里的getVisitByLike配置 返回List类型的数据
	public List<Visit> getVisitByLike(Visit visit);

	// 按主键查询表返回单一的Visit实例 调用entity包visit.xml里的getVisitById配置
	public Visit getVisitById(String visitid);

}


