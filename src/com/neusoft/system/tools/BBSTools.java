package com.neusoft.system.tools;

import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BBSTools {
    public static String parseBBSText(String text, String path) throws Exception{
        String res = text;
        String[] elements = text.split("image/jpeg;");
        String pattern = "(?<=base64,).+(?=style=)";
        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);
        for (String ele: elements ) {
            // 现在创建 matcher 对象
            Matcher m = r.matcher(ele);
            if (m.find( )) {
                String imgData = m.group().substring(0, m.group().length() - 2);
                //把base64转存到图片，文件名uuid
                String uuid = UUID.randomUUID().toString() + ".jpg";
                String imgFilePath = path + uuid;
                Base64Utils.GenerateImage(imgData,imgFilePath);
                res = res.replace("<img src=\"data:image/jpeg;base64," + imgData + "\" style=\"max-width:100%;\">"
                        , "<img src=\"\\upload\\" + uuid + "\"/>");
            } else {
                System.out.println("NO MATCH");
            }
        }
        return res;
    }

    public static String getImgFromText(String text, String path) throws Exception{
        String res = "";
        String[] elements = text.split("image/jpeg;");
        String pattern = "(?<=base64,).+(?=style=)";
        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);
        for (String ele: elements ) {
            // 现在创建 matcher 对象
            Matcher m = r.matcher(ele);
            if (m.find( )) {
                String imgData = m.group().substring(0, m.group().length() - 2);
                //把base64转存到图片，文件名uuid
                String uuid = UUID.randomUUID().toString() + ".jpg";
                String imgFilePath = path + uuid;
                Base64Utils.GenerateImage(imgData,imgFilePath);
                res += uuid + ",";
            } else {
                System.out.println("NO MATCH");
            }
        }
        return res.substring(0, res.length()-1);
    }
}
