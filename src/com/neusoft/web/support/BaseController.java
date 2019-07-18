package com.neusoft.web.support;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface BaseController 
{
	//Ϊҵ����������DTO
	void setMapDto(Map<String,Object> dto);
	
    String execute()throws Exception;
    
    Map<String,Object> getAttribute();

    void setMapDtoForFile(Map<String,Object> dto);
}
