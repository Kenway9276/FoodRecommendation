package com.neusoft.web.impl;

public class CouponGetServlet extends CouponControllerSupport{
    @Override
    public String execute() throws Exception {
        this.update("getCoupon", "��ȡ�Ż�ȯ");
        this.savePageData();
        return "markquery2";
    }
}
