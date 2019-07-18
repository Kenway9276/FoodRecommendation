package com.neusoft.web.impl;

public class AdminCouponServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.saveAdminCouponPageData();
		return "adminCoupon";
	}

}
