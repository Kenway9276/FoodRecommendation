package com.neusoft.system.tools;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;

import com.neusoft.system.db.DBUtils;


@WebFilter("/*")
public class ConnectionFilter extends HttpServlet implements Filter 
{
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		try
		{
			chain.doFilter(request, response);
		}
		finally
		{
			DBUtils.close();
		}
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
	}

}
