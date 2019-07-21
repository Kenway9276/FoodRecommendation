package com.neusoft.web.impl;

public class CouponListShop extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForShop");
        return "userCouponList";
    }
}
