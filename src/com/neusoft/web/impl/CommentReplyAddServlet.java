package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentReplyAddServlet extends ShopinfoControllerSupport{

	@Override
	//д����
	public String execute() throws Exception
	{
		this.executeUpdateMethod("shopAddReply");
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