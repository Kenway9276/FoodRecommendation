package com.neusoft.web.impl;

public class MarkDeleteInShopDetailServlet extends ShopinfoControllerSupport 
{
	public String execute() throws Exception
	{
		this.update("deleteMarkInShopDetail", "ȡ��");
		
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
