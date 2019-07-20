package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MessageSearchReadServlet extends MessageControllerSupport {
	
	@Override
    public String execute() throws Exception
	{
		this.savePageData("rows", "queryRead");
		this.saveMapPageData("Status", "saveStausForRead");
		return "messagequery";		
    }

}