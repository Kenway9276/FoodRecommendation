package com.neusoft.services;

import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

public interface BaseServices 
{
     void setMapDto(Map<String,Object> dto);
     
     /**
      * �ӿڵ�Ĭ��ʵ��
      * @return
      * @throws Exception
      */
     default Map<String,String> findById()throws Exception
     {
    	 return null;
     }
     default Map<String,String> findByIdNotice()throws Exception
     {
    	 return null;
     }
     
     default List<Map<String,String>> query()throws Exception
     {
    	 return null;
     }
     
     default Map<String,String> userLogin()throws Exception
     {
    	 return null;
     }

	default Map<String, String> adminLogin()throws Exception
	{
		return null;
	}
	
	default List<Map<String,String>> userHistoryQuery()throws Exception
	{
		return null;
	}
	
	default List<Map<String,String>> adminNoticeQuery()throws Exception
	{
		return null;
	}
	default List<Map<String,String>> userNoticeQuery()throws Exception
	{
		return null;
	}
	default List<Map<String,String>> adminBusinessQuery()throws Exception
	{
		return null;
	}
	
}
