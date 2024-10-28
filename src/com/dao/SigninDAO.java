package com.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.entity.Signin;

@Repository("signinDAO") // Repository标签定义数据库连接的访问 Spring中直接
@Mapper
public interface SigninDAO {

	/**
* SigninDAO 接口 可以按名称直接调用signin.xml配置文件的SQL语句
 */

	// 插入数据 调用entity包signin.xml里的insertSignin配置 返回值0(失败),1(成功)
	public int insertSignin(Signin signin);

	// 更新数据 调用entity包signin.xml里的updateSignin配置 返回值0(失败),1(成功)
	public int updateSignin(Signin signin);

	// 删除数据 调用entity包signin.xml里的deleteSignin配置 返回值0(失败),1(成功)
	public int deleteSignin(String signinid);

	// 查询全部数据 调用entity包signin.xml里的getAllSignin配置 返回List类型的数据
	public List<Signin> getAllSignin();

	// 按照Signin类里面的值精确查询 调用entity包signin.xml里的getSigninByCond配置 返回List类型的数据
	public List<Signin> getSigninByCond(Signin signin);

	// 按照Signin类里面的值模糊查询 调用entity包signin.xml里的getSigninByLike配置 返回List类型的数据
	public List<Signin> getSigninByLike(Signin signin);

	// 按主键查询表返回单一的Signin实例 调用entity包signin.xml里的getSigninById配置
	public Signin getSigninById(String signinid);

}


