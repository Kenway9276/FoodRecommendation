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
		//�Ƿ�������
		this.savePageData("IsComment", "commentJudge");
		//�̼�����
		this.savePageInstance();
		//����ͼ
		this.savePageData("Address", "saveEnPhotoAddress");
		//�豸
		this.saveMapPageData("Equipment", "saveEquipment");
		//��ʾ����
		this.savePageData("rows", "queryComment");
		//����ͼƬ
		this.savePageData("CommentPhoto","saveCmPhotoAddress" );
		//�����û�ѡ���
		this.update("updateSelectionPlus","����");

		return "shopdetail";	
    }
}
