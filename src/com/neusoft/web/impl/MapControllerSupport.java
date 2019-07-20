package com.neusoft.web.impl;

import com.neusoft.services.impl.CouponServiceImpl;
import com.neusoft.services.impl.MapServicesImpl;
import com.neusoft.web.support.ControllerSupport;

public abstract class MapControllerSupport extends ControllerSupport 
{
    public MapControllerSupport() 
    {
        this.setServices(new MapServicesImpl());
    }
}
