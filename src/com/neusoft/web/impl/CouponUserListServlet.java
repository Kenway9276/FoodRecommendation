package com.neusoft.web.impl;

public class CouponUserListServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.savePageData("rows", "queryForUser");
        return "markquery2";
    }
}
