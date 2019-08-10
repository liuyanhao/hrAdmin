package com.lxc.util;

import org.codehaus.jackson.map.util.JSONPObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** 接口参数校验
 * @author :	lxc  qq 1094921525
 * @date ：2018/01/2
 */
public class AppUtil  {
	protected static Logger logger = Logger.getLogger(AppUtil.class);

	/**根据用户名获取会员信息 */
	private static final String APP_USER_NAME_METHOD = "getAppuserByUsernmae";
	/** 注册 */
	private static final String REGISTERED_METHOD = "registered";
	private static final String CALL_BACK = "callback";

	/**检查参数是否完整
	 * @param method 方法名
	 * @param pd  PageData
	 * @return boolean
	 */
	public static boolean checkParam(String method, PageData pd){
		boolean result = false;
		int falseCount = 0;
		String[] paramArray = new String[20];
		String[] valueArray = new String[20];
		//临时数组
		String[] tempArray  = new String[20];

		// 注册
		if(REGISTERED_METHOD.equals(method)){
			//参数
			paramArray = Const.APP_REGISTERED_PARAM_ARRAY;
			//参数名称
			valueArray = Const.APP_REGISTERED_VALUE_ARRAY;
			//根据用户名获取会员信息
		}else if(APP_USER_NAME_METHOD.equals(method)){
			paramArray = Const.APP_GETAPPUSER_PARAM_ARRAY;  
			valueArray = Const.APP_GETAPPUSER_VALUE_ARRAY;
		}
		int size = paramArray.length;
		for(int i=0;i<size;i++){
			String param = paramArray[i];
			if(!pd.containsKey(param)){
				tempArray[falseCount] = valueArray[i]+"--"+param;
				falseCount += 1;
			}
		}
		if(falseCount>0){
			logger.error(method+"接口，请求协议中缺少 "+falseCount+"个 参数");
			for(int j = 1;j <= falseCount;j++){
				logger.error("   第"+ j + "个：" + tempArray[j-1]);
			}
		} else {
			result = true;
		}
		
		return result;
	}
	
	/**
	 * 设置分页的参数
	 * @param pd  PageData
	 * @return PageData
	 */
	public static PageData setPageParam(PageData pd){
		String page_now_str = pd.get("page_now").toString();
		int pageNowInt = Integer.parseInt(page_now_str) - 1;
		//每页显示记录数
		String page_size_str = pd.get("page_size").toString();
		int pageSizeInt = Integer.parseInt(page_size_str);
		String page_now = pageNowInt + "";
		String page_start = (pageNowInt*pageSizeInt) + "";
		pd.put("page_now", page_now);
		pd.put("page_start", page_start);
		return pd;
	}
	
	/**
	 * 设置list中的distance
	 * @param list List<PageData>
	 * @param pd PageData
	 * @return List<PageData>
	 */
	public static List<PageData>  setListDistance(List<PageData> list, PageData pd){
		List<PageData> listReturn = new ArrayList<PageData>();
		String user_longitude = "";
		String user_latitude = "";
		try{
			//test  "117.11811";
			user_longitude = pd.get("user_longitude").toString();
			//test  "36.68484";
			user_latitude  = pd.get("user_latitude").toString();
		} catch(Exception e){
			logger.error("缺失参数--user_longitude和user_longitude");
			logger.error("lost param：user_longitude and user_longitude");
		}
		PageData pdTemp = new  PageData();
		int size = list.size();
		for(int i = 0;i < size; i++){
			pdTemp = list.get(i);
			String longitude = pdTemp.get("longitude").toString();
			String latitude = pdTemp.get("latitude").toString();
			String distance = MapDistance.getDistance(
						user_longitude,	user_latitude,
						longitude,		latitude
					);
			pdTemp.put("distance", distance);
			pdTemp.put("size", distance.length());
			listReturn.add(pdTemp);
		}
		return listReturn;
	}
	
	/**
	 * @param pd PageData
	 * @param map  Map
	 * @return Object
	 */
	public static Object returnObject(PageData pd, Map map){
		if(pd.containsKey(CALL_BACK)){
			String callback = pd.get(CALL_BACK).toString();
			return new JSONPObject(callback, map);
		}else{
			return map;
		}
	}
}