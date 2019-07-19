package com.neusoft.web.impl;

public class UserStoryServlet extends UserStoryControllerSupport{
    @Override
    public String execute() throws Exception {
        this.savePageData();
        return "story";
    }
}
