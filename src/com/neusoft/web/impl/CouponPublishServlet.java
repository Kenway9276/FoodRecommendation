package com.neusoft.web.impl;

public class CouponPublishServlet extends CouponControllerSupport {
    @Override
    public String execute() throws Exception {
        this.update("publish","ÃÌº””≈ª›»Ø");
        return "index";
    }
}
