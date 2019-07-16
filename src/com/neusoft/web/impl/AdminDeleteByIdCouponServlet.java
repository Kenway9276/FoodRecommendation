package com.neusoft.web.impl;

public class AdminDeleteByIdCouponServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminDeleteByIdCoupon", "É¾³ý");
		this.saveAdminCouponPageDataForDelete();
		return "adminCoupon";
	}

}
