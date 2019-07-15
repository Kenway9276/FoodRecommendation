package com.neusoft.web.impl;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

public class MarkAddServlet extends MarkControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addMark", "Ìí¼Ó");
		return "shopdetail";
	}
}
