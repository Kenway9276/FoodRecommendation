package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShopinfoFindServlet extends ShopinfoControllerSupport {
	
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		this.saveMapPageData("ins", "saveCurrentKeyWords");

		return "shopsearch";		
    }
}
