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
	default Map<String,String> busiLogin()throws Exception
    {
   	 return null;
    }  
    default Map<String,String> findBusiPopularizeById()throws Exception
    {
   	 return null;
    }  
    default List<Map<String,String>> userAssemble()throws Exception
    {
   	 return null;
    }  
    
    default List<Map<String,String>> getSysco()throws Exception
    {
   	 return null;
    }
    
    default boolean busiPopularize(String aab403,String aab404)throws Exception
    {
   	 return true;
    }
    
    default List<Map<String,String>> busiDishMenuQuery()throws Exception
    {
   	 return null;
    }

    default List<Map<String,String>> busiQuery()throws Exception
    {
   	 return null;
    }
    default List<Map<String,String>> busiManageReservation()throws Exception
    {
   	 return null;
    }
    default List<Map<String,String>> busiReservation()throws Exception
    {
    	return null;
    }
    default List<Map<String,String>> adminForumQuery()throws Exception
    {
   	 return null;
    }
    default Map<String,String> busiFindDishById()throws Exception
    {
   	 return null;
    }
    default Map<String,String> busiFindPopularizeById()throws Exception
    {
    	return null;
    }
    default Map<String, String> busiCheckName(String aab102)throws Exception
    {
    	return null;
    }
    default Map<String,String> busiToCertificatePage()throws Exception
    {
    	return null;
    }
    default List<Map<String,String>> saveBusiDishPicAddress()throws Exception
    {
    	return null;
    }
    
    default List<Map<String,String>> adminCouponQuery()throws Exception
    {
   	 return null;
    }
	
    default Map<String,String> userInfoQuery()throws Exception
    {
   	 return null;
    }
    
    default Map<String,String> adminInfoQuery()throws Exception
    {
   	 return null;
    }
    default Map<String,String> busiConvertDishId()throws Exception
    {
   	 return null;
    }
    default Map<String,String> busiConvertBusiId()throws Exception
    {
   	 return null;
    }
    default Map<String,String> busiReturnInfo()throws Exception
    {
    	return null;
    }
    default Map<String, String> busiToPortraitPage()throws Exception
    {
    	return null;
    }
    default Map<String,String> getAssembleById()throws Exception
    {
    	return null;
    }
}
