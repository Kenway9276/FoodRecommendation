package com.neusoft.web.impl;

public class CouponCheckServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageInstance("ins","checkCoupon");
        this.saveAttribute("msg","isChecked");
        return "checkCoupon";
    }
}
