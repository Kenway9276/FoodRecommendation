package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MessageDeleteAllServlet extends MessageControllerSupport {
	
	@Override
    public String execute() throws Exception
	{
		this.update("deleteAllReadMessage", "É¾³ý");
		return "messagequery";		
    }

}