package com.neusoft.web.impl;

import com.neusoft.services.impl.PreferenceServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class PreferenceControllerSupport extends ControllerSupport {
    public PreferenceControllerSupport() {
        this.setServices(new PreferenceServiceImpl());
    }
}
