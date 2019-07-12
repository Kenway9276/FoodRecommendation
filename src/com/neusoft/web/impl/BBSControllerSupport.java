package com.neusoft.web.impl;

import com.neusoft.services.impl.BBSServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class BBSControllerSupport extends ControllerSupport {

    public BBSControllerSupport() {
        this.setServices(new BBSServiceImpl());
    }
}
