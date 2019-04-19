/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.utils;

import com.ciocem.common.utils.SpringContextHolder;
import dzh.ysyyrps.modules.sys.dao.UserDao;
import com.ciocem.modules.sys.entity.User;

/**
 * 通用下拉查询
 * @author tyluo
 * @version 2016-10-13
 */
public class CommonListUtils {
	private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);

	/**
	 * 根据用户Id查询对象
	 * @param userId
	 * @return
     */
	public static User getUserById(String userId){
		User user = userDao.get(userId);
		if(user==null){
			user = new User();
			user.setName("");
		}
		return user;
	}
}
