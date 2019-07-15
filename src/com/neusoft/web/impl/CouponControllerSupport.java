package com.neusoft.web.impl;

import com.neusoft.services.impl.CouponServiceImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class CouponControllerSupport extends ControllerSupport {

    public CouponControllerSupport() {
        this.setServices(new CouponServiceImpl());
    }
}
