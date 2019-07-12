package com.neusoft.web.impl;

import com.neusoft.services.impl.RankingServiceImpl;
import com.neusoft.services.impl.RecommendServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class RankingControllerSupport extends ControllerSupport {
    public RankingControllerSupport() {
        this.setServices(new RankingServiceImpl());
    }
}
