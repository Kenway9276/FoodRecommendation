package com.neusoft.web.impl;

public class CouponCheckServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageInstance("ins","checkCoupon");
        return "checkCoupon";
    }
}
