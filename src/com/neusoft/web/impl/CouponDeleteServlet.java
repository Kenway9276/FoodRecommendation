package com.neusoft.web.impl;

public class CouponDeleteServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("delCoupon","—È÷§");
        return "checkCoupon";
    }
}
