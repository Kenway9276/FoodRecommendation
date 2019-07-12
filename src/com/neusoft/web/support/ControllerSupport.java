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
	 * 	        ҵ���߼�������ܹ�ע��
	 *****************************************/
	
	private BaseServices services=null;
	
	/**
	 * ����ͨ���÷���,ΪServices�����������õľ��������
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
	 * 	        ����ҵ�����̷�װ
	 *****************************************/
	/**
	 * ����������ѯ
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
			this.saveAttribute("msg", "û�з�������������!");
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

	protected final void savePageData(String key, String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		Object tem = method.invoke(services);
		List<Map<String,String>> rows = (List<Map<String, String>>) tem;
		if(rows.size()>0)
		{
			this.saveAttribute(key, rows);
		}
		else
		{
			this.saveAttribute("msg", "û�з�������������!");
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
			this.saveAttribute("msg", "û�з�������������!");
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
			this.saveAttribute("msg", "û�з�������������!");
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
			this.saveAttribute("msg", "û�з�������������!");
		}	
	}
	
	protected final void savePageMsg(String key, String msg)throws Exception {
		this.saveAttribute(key, msg);
	}

	/**
	 * ��һʵ�� ��ѯ
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
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}

	protected final void savePageInstance(String key, String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		Object tem = method.invoke(services);
		Map<String,String> ins = (Map<String,String>)tem;
		if(ins!=null)
		{
			this.saveAttribute(key, ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}
	}
	
	protected final void saveUserLoginInstance()throws Exception
	{
		Map<String,String> ins=this.services.userLogin();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:�û��������벻���!");
		}	
	}
	
	protected final void saveAdminLoginInstance()throws Exception
	{
		Map<String,String> ins=this.services.adminLogin();
		if(ins!=null)
		{
			this.saveAttribute("ins",  ins);
		}
		else
		{
			this.saveAttribute("msg", "��ʾ:�û��������벻���!");
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
			this.saveAttribute("msg", "��ʾ:��������ɾ�����ֹ����!");
		}	
	}
	
	/**
	 * ͨ������ִ�и��·���
	 * @param methodName
	 * @return
	 * @throws Exception
	 */
	public boolean executeUpdateMethod(String methodName)throws Exception
	{
		//1.��ȡ��Ҫ���õķ�������
		Method method=this.services.getClass().getDeclaredMethod(methodName);
		method.setAccessible(true);
		//2.���÷���
		return  (boolean)method.invoke(services);
	}
	

	/**
	 * ������Ϊ���ܿ���
	 * <
	 *   ����Ϣ��ʾ
	 * >
	 * @param methodName
	 * @param msgText
	 * @throws Exception
	 */
	protected final void update(String methodName,String msgText)throws Exception
	{
		String msg=this.executeUpdateMethod(methodName)?"�ɹ�!":"ʧ��!";
		this.saveAttribute("msg", msgText+msg);
	}
	
	/**
	 * ���б�ŵ���Ϣ��ʾ�ĸ�����Ϊ
	 * @param methodName
	 * @param typeText
	 * @param msgText
	 * @param key
	 * @throws Exception
	 */
	protected final void update(String methodName,String typeText,String msgText,String keyString)throws Exception
	{
		String msg=typeText+"ʧ��!";
    	if(this.executeUpdateMethod(methodName))
    	{
    		msg=msgText;
    	}
    	//Servlet��ҳ���������
    	this.saveAttribute("msg", msg);

	}
	
	/**
	 * ɾ��������ݼ���
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
	
	protected final void saveNoticePageDataForDelete()throws Exception
	{
		List<Map<String,String>> rows=this.services.adminNoticeQuery();
		if(rows.size()>0)
		{
			this.saveAttribute("rows", rows);
		}
	}
	
	
	/*****************************************
	 * 	        ����������
	 *****************************************/
	private Map<String,Object> dto=null;
    @Override
    public final void setMapDto(Map<String, Object> dto) 
    {
        this.dto=dto;	
        //ͬ��ΪServices����DTO
        this.services.setMapDto(dto);
        
    }
	@Override
	public void setMapDtoForFile(Map<String, Object> dto) {
		this.dto=dto;
		//ͬ��ΪServices����DTO
		this.services.setMapDto(dto);
	}
    protected final void showDto()
    {
    	System.out.println(this.dto);
    }

    
	/*****************************************
	 * 	        ���������
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
