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
		//����ͼ
		this.savePageData("Address", "savePhotoAddress");
		//�豸
		this.saveMapPageData("Equipment", "saveEquipment");
		//����
		this.savePageData("rows", "queryComment");

		return "shopdetail";	
    }
}
