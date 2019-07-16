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
		//是否已收藏
		this.savePageData("IsMark","markJudge");
		//商家详情
		this.savePageInstance();
		//环境图
		this.savePageData("Address", "savePhotoAddress");
		//设备
		this.saveMapPageData("Equipment", "saveEquipment");
		//评论
		this.savePageData("rows", "queryComment");

		return "shopdetail";	
    }
}
