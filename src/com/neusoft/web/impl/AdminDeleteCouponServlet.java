package com.neusoft.web.impl;

public class AdminDeleteCouponServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminCouponDelete", "ɾ��");
		this.saveAdminCouponPageDataForDelete();
		return "adminCoupon";
	}

}
