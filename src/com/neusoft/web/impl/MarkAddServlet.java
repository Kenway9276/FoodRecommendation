package com.neusoft.web.impl;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class MarkAddServlet extends ShopinfoControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		
		this.update("addMark", "���");
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
		//����ͳ��
		this.saveMapPageData("Cal", "calComment");
		//����ͼƬ
		this.savePageData("CommentPhoto","saveCmPhotoAddress" );
		//�����û�ѡ���
		this.update("updateSelectionPlus","����");
		
		return "shopdetail";
	}
}
