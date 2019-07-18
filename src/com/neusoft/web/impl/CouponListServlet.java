package com.neusoft.web.impl;

public class CouponListServlet extends CouponControllerSupport{
    @Override
    public String execute() throws Exception {
        this.savePageData();
        return "markquery2";
    }
}
