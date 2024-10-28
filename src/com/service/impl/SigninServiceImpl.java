package com.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dao.SigninDAO;
import com.entity.Signin;
import com.service.SigninService;

@Service("signinService")
public class SigninServiceImpl implements SigninService {
	@Autowired
	private SigninDAO signinDAO;
	@Override // 继承接口的新增 返回值0(失败),1(成功)
	public int insertSignin(Signin signin) {
		return this.signinDAO.insertSignin(signin);
	}

	@Override // 继承接口的更新 返回值0(失败),1(成功)
	public int updateSignin(Signin signin) {
		return this.signinDAO.updateSignin(signin);
	}

	@Override // 继承接口的删除 返回值0(失败),1(成功)
	public int deleteSignin(String signinid) {
		return this.signinDAO.deleteSignin(signinid);
	}

	@Override // 继承接口的查询全部
	public List<Signin> getAllSignin() {
		return this.signinDAO.getAllSignin();
	}

	@Override // 继承接口的按条件精确查询
	public List<Signin> getSigninByCond(Signin signin) {
		return this.signinDAO.getSigninByCond(signin);
	}

	@Override // 继承接口的按条件模糊查询
	public List<Signin> getSigninByLike(Signin signin) {
		return this.signinDAO.getSigninByLike(signin);
	}

	@Override // 继承接口的按主键查询 返回Entity实例
	public Signin getSigninById(String signinid) {
		return this.signinDAO.getSigninById(signinid);
	}

}

