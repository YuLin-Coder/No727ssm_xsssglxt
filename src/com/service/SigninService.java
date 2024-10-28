package com.service;
import java.util.List;
import org.springframework.stereotype.Service;
import com.entity.Signin;
@Service("signinService")
public interface SigninService {
	// 插入数据 调用signinDAO里的insertSignin配置
	public int insertSignin(Signin signin);

	// 更新数据 调用signinDAO里的updateSignin配置
	public int updateSignin(Signin signin);

	// 删除数据 调用signinDAO里的deleteSignin配置
	public int deleteSignin(String signinid);

	// 查询全部数据 调用signinDAO里的getAllSignin配置
	public List<Signin> getAllSignin();

	// 按照Signin类里面的字段名称精确查询 调用signinDAO里的getSigninByCond配置
	public List<Signin> getSigninByCond(Signin signin);

	// 按照Signin类里面的字段名称模糊查询 调用signinDAO里的getSigninByLike配置
	public List<Signin> getSigninByLike(Signin signin);

	// 按主键查询表返回单一的Signin实例 调用signinDAO里的getSigninById配置
	public Signin getSigninById(String signinid);

}

