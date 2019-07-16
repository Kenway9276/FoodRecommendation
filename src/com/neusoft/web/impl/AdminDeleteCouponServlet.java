package com.neusoft.web.impl;

public class AdminDeleteCouponServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminCouponDelete", "É¾³ý");
		this.saveAdminCouponPageDataForDelete();
		return "adminCoupon";
	}

}
