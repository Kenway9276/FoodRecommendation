package com.neusoft.web.impl;

import com.neusoft.services.impl.RecommendServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class RecommendControllerSupport extends ControllerSupport {

    public RecommendControllerSupport() {
        this.setServices(new RecommendServiceImpl());
    }
}
