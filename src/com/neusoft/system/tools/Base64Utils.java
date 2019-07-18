package com.neusoft.system.tools;

import java.io.*;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;



public class Base64Utils {
    /**
     * 图片转化成base64字符串
     * @param imgPath
     * @return
     */
    public static String GetImageStr(String imgPath) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        String imgFile = imgPath;// 待处理的图片
        InputStream in = null;
        byte[] data = null;
        String encode = null; // 返回Base64编码过的字节数组字符串
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        try {
            // 读取图片字节数组
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            encode = encoder.encode(data);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        return encode;
    }

    /**
     * base64字符串转化成图片
     *
     * @param imgData
     *            图片编码
     * @param imgFilePath
     *            存放到本地路径
     * @return
     * @throws IOException
     */
    @SuppressWarnings("finally")
    public static boolean GenerateImage(String imgData, String imgFilePath) throws IOException { // 对字节数组字符串进行Base64解码并生成图片
        if (imgData == null) // 图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out = null;
        try {
            out = new FileOutputStream(imgFilePath);
            // Base64解码
            byte[] b = decoder.decodeBuffer(imgData);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            out.write(b);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            out.flush();
            out.close();
            return true;
        }
    }


    public static void main(String[] args) throws IOException {
        //String imageStr = Base64Utils.GetImageStr("C:\\Users\\P7XXTMX-G\\Desktop\\2bec78b896dc6cae9d95dfd05f09d53e.jpg");
        String imageStr = getStr();
        System.out.println(imageStr);
        Base64Utils.GenerateImage(imageStr, "C:\\Users\\P7XXTMX-G\\Desktop\\8f3f65f8-7da2-46d0-b25d-717add88e4b6.jpg");
    }

    private static String getStr(){
        StringBuilder res = new StringBuilder();
        BufferedInputStream in = null;
        try {
            //读取文件(缓存字节流)
            in = new BufferedInputStream(new FileInputStream("C:\\Users\\P7XXTMX-G\\Desktop\\a.txt"));
            //读取数据
            //一次性取多少字节
            byte[] bytes = new byte[2048];
            //接受读取的内容(n就代表的相关数据，只不过是数字的形式)
            int n = -1;
            //循环取出数据
            while ((n = in.read(bytes,0,bytes.length)) != -1) {
                //转换成字符串
                String str = new String(bytes,0,n,"GBK");
                res.append(str);
            }
            //关闭流
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res.toString();
    }



}