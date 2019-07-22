package com.neusoft.web.impl;

public class CouponListShopServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForShop");
        return "userCouponList";
    }
}
