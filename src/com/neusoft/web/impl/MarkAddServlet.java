package com.neusoft.web.impl;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class MarkAddServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addMark", "添加");
		//跳转回详情页面再次查询未实现
		return "shopdetail";
	}
}
