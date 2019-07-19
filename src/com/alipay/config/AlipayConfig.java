package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101000655261";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCTIRqsGxTyNrOJOQsBWvHZnYi0eyZKkEFYInWEnqm8cGN01CfwWd6KyNUNgyX27p1bFqQ61Umm8FnD039n/b8o+2wS3s1zEXV3dSywloAmJeSmOP7PGM2dcTjuQ1F1JNgx/qyElBX/Hmmf0TGSAXl3acfYyFGDQKAQ6NiGTP3EcRZz3rKfPTX3qZLOAyLlI68tJ7fET5/sDGIs3XuECWTevIF+x6DSZYlARn0rUoy0Y2GoDNN71OnWm80AsLnA8SvuJNdY3DzCLK9zdhzaanmhXg03H0wIeIQPSKOgR/aU24HCqpf1hveP/2JY9X/K0dtEUBPH4JTJwzePVzt8EcnbAgMBAAECggEAMMUcbkhb3R48zRPXjg9zc8tAcXMQ8k53GpvxkJB3eztV/HgG9SkVF7QSy3PZtczK5FLRBZ+F1ox9dOg6p2H5Z8BPxsGMIMR8x6hTtAVvXTXaYS8rZ8K1BaduU6yE5+varlfZH+lmkTanlI5nfBp5BRhPYpCkVHmrlW9Ztsr2o5LINy6mPWocdzAK+FovNl+ZZfM4vOhwuUP+XFcGsFBxRScXntRg66p2AxVrtNjMK/eTUcMvxxA8PgizeTEC59MjmBx0+WowwcGXC+ePUHF2JTwpIZBObiqHbec5jd84DH/E/O8CpyVP1gJz/XETmhqUzYWY0ZVoJm4somNeXOIT4QKBgQDJ0G+MfPGMRe50BSC9KScmDaMtVxlrGuJxxROKDXzSnHvytu3usVZvKDrZGWCtuklNeLFByV+oB/rJGpUAeTvsQ6yNENbH3JdjhVij5ygjXTOSFuzbMQIfrEqkTcTt+Yuh0dVqVo0crkYPlHazmNW9GGnacVRA7oKw1LgtyFwOTQKBgQC6ofBtr9ffajfpwEq3XmMDhObWIHWJ+SCcQyWu0cThkj0zsJCW7kC3m2ATwfKc+faj772YdVJKK7aJ+xQWIThj4DSKsf6ksbR94KaCJFHEcLrtaYZkOhvGwZCBQ/wO7STGMh4CaxQrWi26R/6SvsG6bcSun8XEU6jBvNYx2ltcxwKBgQCOKcxKdMFbBPAivnH/jnvLbJPkHpUDQ978Mc2/1Bx36E/P/FjDahzvFLHPuPbHqpB0iG6lXwuJPIXHIHiR6tTxbAKjJJeIFrZ2HrsASpeVwdPQN2IGThGm6iFyeG4fDUj1ZvElhW7GI2WrF/Q+M41tNUNr46VsUBe0JUTQy3E9iQKBgDC+rQoo/Ev49SOTOrCL8XZw1s2kaq6fp9nIW+Y+GZsE1AFVI16YWcTayww+ArznOHj22+Ee+2At7J47OrLQ+GZ1n6N9+9FOLKMX8sVY8RZKjzgE8Lnqx2hxE+n/NK09WPZ/DoF5MCpmgjz+Isp3Eig8FTu6tS+i3hfD13nr2yLvAoGALMWnOY79glsHi8JuvE4yn5WQageY70IfzB+6bp/W42wKs4XQy3X9dXO5Gp8FoftXTlYxRsa2F462wDwctwNArbybzZn0lKNRAamSLudzpTsjfAXCkFgli6pkjV3AT7Mifsr4C2+AGMXATrGF7J/066KnPxZMTjwRllkPHScohPE=";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApMUPBGC45bbiyIYoYa08u0WWynTSMsboB7O+BqNsIRKgIH3S8AVksM8Dl/n8ZSeRN69LyTv5mRDw7Er5ZUpR1CxxAXEQ1OXIVm00qsiprNeUWeEy2m3s0fGSGfz/QiaxSyXVRPeO5yWTXIyHx+2YivXtGAhZ6SpCCDDOcc3BzuM+vTyIIWVwTHtJ4LYrRtupGXf7Ul6HotNcxhcCtiE3D5HtZitlnQziktEIdiuVP99TmQkbBDygArbcPlrSfcqrDThivELZd05dy1gYLn+hpeqIKUjZp9YLEewfKEjbguzqNIO/AE71cKxt3FGhB8ZTclE4rpfkLxylApkkIv8YLwIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "	https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "D:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

