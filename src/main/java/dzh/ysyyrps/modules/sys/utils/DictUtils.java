/**
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 */
package dzh.ysyyrps.modules.sys.utils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ciocem.common.utils.PubUtil;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.ciocem.common.utils.CacheUtils;
import com.ciocem.common.utils.SpringContextHolder;
import dzh.ysyyrps.modules.sys.dao.DictDao;
import dzh.ysyyrps.modules.sys.entity.Dict;

/**
 * 字典工具类
 * @author tyluo
 * @version 2013-5-29
 */
public class DictUtils {
	
	private static DictDao dictDao = SpringContextHolder.getBean(DictDao.class);

	public static final String CACHE_DICT_MAP = "dictMap";
	
	public static String getDictLabel(String value, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && value.equals(dict.getValue())){
					return dict.getLabel();
				}
			}
		}
		return defaultValue;
	}
	
	public static String getDictLabels(String values, String type, String defaultValue){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(values)){
			List<String> valueList = Lists.newArrayList();
			for (String value : StringUtils.split(values, ",")){
				valueList.add(getDictLabel(value, type, defaultValue));
			}
			return StringUtils.join(valueList, ",");
		}
		return defaultValue;
	}

	public static String getDictValue(String label, String type, String defaultLabel){
		if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(label)){
			for (Dict dict : getDictList(type)){
				if (type.equals(dict.getType()) && label.equals(dict.getLabel())){
					return dict.getValue();
				}
			}
		}
		return defaultLabel;
	}
	
	public static List<Dict> getDictList(String type){
		@SuppressWarnings("unchecked")
		Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>)CacheUtils.get(CACHE_DICT_MAP);
		if (dictMap==null){
			dictMap = Maps.newHashMap();
			Dict dictSearch = new Dict();
			dictSearch.setParentId("0");
			dictSearch.setLevelNo(4);//第四级的为字典具体信息 （其他为分类）
			List<Dict> dictAll = dictDao.findAllList(dictSearch);
			for (Dict dict : dictAll){
				List<Dict> dictList = dictMap.get(dict.getType());
				if (dictList != null){
					dictList.add(dict);
				}else{
					dictMap.put(dict.getType(), Lists.newArrayList(dict));
				}
			}
			CacheUtils.put(CACHE_DICT_MAP, dictMap);
		}
		List<Dict> dictList = dictMap.get(type);
		if (dictList == null){
			dictList = Lists.newArrayList();
		}
		return dictList;
	}

	/*
	 * 反射根据对象和属性名获取属性值
	 */
	@SuppressWarnings("rawtypes")
	public static Object getValue(Object obj, String filed) {
		try {
			Class clazz = obj.getClass();
			PropertyDescriptor pd = new PropertyDescriptor(filed, clazz);
			Method getMethod = pd.getReadMethod();//获得get方法
			if (pd != null) {
				Object o = getMethod.invoke(obj);//执行get方法返回一个Object
				return o;
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据字典类型获得String集合
	 * @param type
	 * @return
     */
	public static String getDictListJson(String type) {
		String dicListStr ="[";
		List<Dict> dictLs = DictUtils.getDictList(type);
		if(dictLs!=null){
			StringBuffer buf = new StringBuffer();
			buf.append("{value:'").append("").append("',text:'").append("").append("'},");
			for(Dict dict : dictLs){
				buf.append("{value:'").append(dict.getValue()).append("',text:'").append(dict.getLabel()).append("'},");
			}
			dicListStr+= buf.substring(0,buf.length()-1);
		}
		dicListStr = dicListStr+"]";
		return  dicListStr;
	}

	/**
	 * 根据字典类型获得String集合
	 * @param type
	 * @return
	 */
	public static String getDictListJqGridJson(String type) {
		String dicListStr =":.;";
		List<Dict> dictLs = DictUtils.getDictList(type);
		if(dictLs!=null){
			StringBuffer buf = new StringBuffer();
			for(Dict dict : dictLs){
				buf.append("").append(dict.getValue()).append(":").append(StringEscapeUtils.unescapeHtml4(dict.getLabel())).append(";");
			}
			String str=buf.toString();
			if(PubUtil.isNotEmpty(str)){
				dicListStr+= buf.substring(0,buf.length()-1);
			}
		}
		return  dicListStr;
	}
}
