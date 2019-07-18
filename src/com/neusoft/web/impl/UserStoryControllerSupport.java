package com.neusoft.web.impl;

import com.neusoft.services.impl.UserStoryServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class UserStoryControllerSupport extends ControllerSupport {
    public UserStoryControllerSupport() {
        this.setServices(new UserStoryServiceImpl());
    }
}
