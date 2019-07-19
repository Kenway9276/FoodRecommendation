package com.neusoft.web.support;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.BaseServices;

public abstract class ControllerSupport implements BaseController
{

	/*****************************************
	 * 	        业务逻辑组件及架构注入
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * 子类通过该方法,为Services变量传递引用的具体类对象
	 * @param services
	 */
	protected void setServices(BaseServices services)
	{
		this.services=services;
	}
	
	protected BaseServices getServices()
	{
		return this.services;
	}
	
	/*****************************************
	 * 	        子类业务流程封装
	 *****************************************/
	/**
	 * 数据批量查询
	 * @throws Exception
	 */
	protected final void savePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void saveHistoryPageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.userHistoryQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void saveAdminForumPageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminForumQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	protected final void savePageData(String key, String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		Object tem = method.invoke(services);
		List<Map<String,String>> rows = (List<Map<String, String>>) tem;
		if(rows.size()>0)
		{
			this.saveAttribute(key, rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void saveMapPageData(String key, String methodName)throws Exception
	{
	   //1.获取需要调用的方法对象
	   Method method=this.services.getClass().getDeclaredMethod(methodName);
	   method.setAccessible(true);
	   //2.调用方法
	   Object tem = method.invoke(services);
	   Map<String,String> ins = (Map<String, String>) tem;
	   if(ins!=null)
	   {
	      this.saveAttribute(key, ins);
	   }
	   else
	   {
	      this.saveAttribute("msg", "无关键词");
	   }
	}
	
	protected final void saveUserNoticePageData()throws Exception
	{
		List<Map<String,String>> rows=this.services.userNoticeQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void saveNoticePageData() throws Exception
	{
		List<Map<String,String>> rows=this.services.adminNoticeQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void saveAdminCouponPageData() throws Exception
	{
		List<Map<String,String>> rows=this.services.adminCouponQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void saveAdminBusiPageData() throws Exception
	{
		List<Map<String,String>> rows=this.services.adminBusinessQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}	
	}
	
	protected final void savePageMsg(String key, String msg)throws Exception {
		this.saveAttribute(key, msg);
	}

	/**
	 * 单一实例 查询
	 * @throws Exception
	 */
	protected final void savePageInstance()throws Exception
	{
		Map<String,String> ins=this.services.findById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}

	protected final void savePageInstance(String key, String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		Object tem = method.invoke(services);
		Map<String,String> ins = (Map<String,String>)tem;
		if(ins!=null)
		{
			this.saveAttribute(key, ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}
	}
	
	protected final boolean saveUserLoginInstance()throws Exception
	{
		Map<String,String> ins=this.services.userLogin();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
			this.saveAttribute("msg", "登陆成功!");
			return true;
		}
		else
		{
			this.saveAttribute("msg", "提示:用户名或密码不相符!");
			return false;
		}	
	}
	
	protected final void saveadminInfoInstance()throws Exception
	{
		Map<String,String> ins=this.services.adminInfoQuery();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:信息已删除!");
		}	
	}
	
	protected final void saveUserInfoInstance()throws Exception
	{
		Map<String,String> ins=this.services.userInfoQuery();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:个人信息已删除!!");
		}	
	}
	

	protected final boolean saveAdminLoginInstance()throws Exception
	{
		Map<String,String> ins=this.services.adminLogin();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
			return true;
		}
		else
		{
			this.saveAttribute("msg", "提示:用户名或密码不相符!");
			return false;
		}	
	}
	
	protected final void saveNoticeInstance()throws Exception
	{
		Map<String,String> ins=this.services.findByIdNotice();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}	
	}
	
	/**
	 * mark=.=
	 * @throws Exception
	 */
	//读取商家信息
	protected final void saveBusiLoginInstance()throws Exception
	{
		Map<String,String> ins=this.services.busiLogin();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "警告:该用户不存在!");
		}	
	}
	//读取用户拼座信息
	protected final void saveUserAssembleInstance()throws Exception
	{
		List<Map<String,String>> rows= this.services.userAssemble();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "数据无访问权限或不存在!");
		}	
	}
	//读取syscode信息
	protected final void saveSyscodeInstance()throws Exception
	{
		List<Map<String,String>> rows=this.services.getSysco();
		if(rows.size()>0)
		{
			this.saveAttribute("row", rows);
		}
		else
		{
			this.saveAttribute("syscodeMsg", "连接失败!");
		}	
	}
	
	//读取的行家推广信息
	protected final void saveBusiPopularizeInstance()throws Exception
	{
		Map<String,String> ins=this.services.findBusiPopularizeById();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "提示:该数据不存在或无访问权限!");
		}	
	}
	
	//根据商家推广状态,决定所使用的sql语句
	protected final void setBusiPopularizeEndTime()throws Exception
	{
		Map<String,String> ins=this.services.findBusiPopularizeById();
		String aab402 = ins.get("aab402");
		if(aab402.equals("0"))
		{
			this.update("busiPopularize", "推广");
		}
		else
		{
			this.update("busiContinuePopularize","推广");
		}
	}
	//获取商家菜单信息
	protected final void saveBusiMenuInstance()throws Exception
	{
		List<Map<String,String>> rows = this.services.busiDishMenuQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "读取菜单信息失败!");
		}
	}
	//删除后获取商家菜单
	protected final void saveBusiMenuDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.busiDishMenuQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	//商家菜单不定条件查询
	
	protected final void saveBusiDishQueryData()throws Exception
	{
		List<Map<String,String>> rows=this.services.busiQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "数据库不存在该数据或无访问权限!");
		}
	}
	
	//商家获取未处理订座信息
	protected final void saveTodoReservationInstance()throws Exception
	{
		List<Map<String,String>> rows=this.services.busiManageReservation();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "无待处理的订座信息!");
		}
	}
	//商家获取已处理订座信息
	protected final void saveReservationInstance()throws Exception
	{
		List<Map<String,String>> rows=this.services.busiReservation();
		if(rows.size()>0)
		{
			this.saveAttribute("row", rows);
		}
		else
		{
			this.saveAttribute("resMsg", "无待处理的订座信息!");
		}
	}
	//通过菜品流水号获取获取单例菜品信息
	protected final void busiFindDishById()throws Exception
	{
		Map<String,String> ins=this.services.busiFindDishById();
		if(ins!=null)
		{
			this.saveAttribute("dins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "查询失败!");
		}
	}
	//获取商家资质证明信息图
	protected final void busiToCertificatePage()throws Exception
	{
		Map<String,String> ins=this.services.busiToCertificatePage();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "查询失败!");
		}
	}
	//ajax存储用户名是否重复信息
	protected final boolean busiCheckName(String aab102)throws Exception
	{	
		boolean a;
		Map<String, String> tmp=this.services.busiCheckName(aab102);
		if(tmp.isEmpty())
		{
			a = false;
		}
		else
		{
			a = true;
		}
		return a;
	}
	/**
	 * 通过反射执行更新方法
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	public boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.获取需要调用的方法对象
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.调用方法
		return  (boolean)method.invoke(services);
	}
	

	/**
	 * 更新行为的总开关
	 * <
	 *   简单消息提示
	 * >
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	protected final void updatePWD(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"成功!":"失败!密码错误!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * 带有编号的消息提示的更新行为
	 * @param methodName
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String keyString)throws Exception
	{
		String msg=typeText+"失败!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText;
    	}
    	//Servlet向页面输出数据
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * 删除后的数据检索
	 * @throws Exception
	 */
	protected final void savePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.query();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}

	protected final void saveBusiPageDataForPass()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminBusinessQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void saveHistoryPageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.userHistoryQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void saveAdminCouponPageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminCouponQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void saveForumPageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminForumQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	protected final void saveNoticePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminNoticeQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	
	/*****************************************
	 * 	        数据输入流
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //同步为Services传递DTO
        this.services.setMapDto(dto);
        
    }
	@Override
	public void setMapDtoForFile(Map<String, Object> dto) {
		this.dto=dto;
		//同步为Services传递DTO
		this.services.setMapDto(dto);
	}
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        数据输出流
	 *****************************************/
    private Map<String,Object> attribute=new HashMap<>();
    protected final void  saveAttribute(String key,Object value)
    {
    	this.attribute.put(key, value);
    }
    
    @Override
    public final Map<String, Object> getAttribute() 
    {
    	return this.attribute;
    }


}
