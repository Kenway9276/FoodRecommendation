package com.neusoft.web.impl;

public class AdminDeleteByIdCouponServlet extends UserControllerSupport {

	@Override
	public String execute() throws Exception {
		this.update("adminDeleteByIdCoupon", "ɾ��");
		this.saveAdminCouponPageDataForDelete();
		return "adminCoupon";
	}

}
