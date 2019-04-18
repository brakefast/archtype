package dzh.ysyyrps.modules.sys.security;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;
import org.springframework.stereotype.Service;

import dzh.ysyyrps.modules.sys.utils.UserUtils;

/**
 * 自定义 密码验证类
 * 
 * @author tyluo
 * @version 2017-5-5
 */
@Service
public class CustomCredentialsMatcher extends SimpleCredentialsMatcher {
	@Override
	public boolean doCredentialsMatch(AuthenticationToken authcToken, AuthenticationInfo info) {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

		String tokenCredentials = String.valueOf(token.getPassword());//encrypt(String.valueOf(token.getPassword()));
		String accountCredentials =encrypt(String.valueOf(getCredentials(info))+UserUtils.getToken4Login()); //getCredentials(info);
		//将密码加密与系统加密后的密码校验，内容一致就返回true,不一致就返回false
		return equals(tokenCredentials, accountCredentials);
	}

	//将传进来密码加密方法
	private String encrypt(String data) {
		return Digests.string2MD5(data);
	}
}
