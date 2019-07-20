package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

public class CommentReplyAddServlet extends ShopinfoControllerSupport{

	@Override
	//写点评
	public String execute() throws Exception
	{
		this.executeUpdateMethod("shopAddReply");
		//是否已收藏
		this.savePageData("IsMark","markJudge");
		//是否已评论
		this.savePageData("IsComment", "commentJudge");
		//商家详情
		this.savePageInstance();
		//环境图
		this.savePageData("Address", "saveEnPhotoAddress");
		//设备
		this.saveMapPageData("Equipment", "saveEquipment");
		//显示评论
		this.savePageData("rows", "queryComment");
		//评论统计
		this.saveMapPageData("Cal", "calComment");
		//评论图片
		this.savePageData("CommentPhoto","saveCmPhotoAddress" );
		//更新用户选择表
		this.update("updateSelectionPlus","更新");
		return "shopdetail";		
    }
}