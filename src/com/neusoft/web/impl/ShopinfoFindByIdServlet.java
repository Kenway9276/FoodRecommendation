package com.neusoft.web.impl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShopinfoFindByIdServlet extends ShopinfoControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		//�Ƿ����ղ�
		this.savePageData("IsMark","markJudge");
		//�̼�����
		this.savePageInstance();
		//�˵�
		this.savePageData("menus","queryMenu");
		//����ͼ
		this.savePageData("Address", "savePhotoAddress");	
		return "shopdetail";	
    }
}
