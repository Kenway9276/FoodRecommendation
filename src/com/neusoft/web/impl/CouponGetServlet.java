package com.neusoft.web.impl;

public class CouponGetServlet extends CouponControllerSupport{
    @Override
    public String execute() throws Exception {
        //this.update("getCoupon", "ªÒ»°”≈ª›»Ø");
        this.savePageInstance("msg", "getCoupon");
        this.savePageData();
        return "markquery2";
    }
}
