package com.neusoft.web.impl;

public class CouponUserDeleteServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("deleteCouponUser","ɾ��");
        this.savePageData("rows", "queryForUser");
        return "markquery2";
    }
}
