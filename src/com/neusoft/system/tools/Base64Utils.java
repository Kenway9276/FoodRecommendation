package com.neusoft.system.tools;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Base64Utils {
    /**
     * ͼƬת����base64�ַ���
     * @param imgPath
     * @return
     */
    public static String GetImageStr(String imgPath) {// ��ͼƬ�ļ�ת��Ϊ�ֽ������ַ��������������Base64���봦��
        String imgFile = imgPath;// �������ͼƬ
        InputStream in = null;
        byte[] data = null;
        String encode = null; // ����Base64��������ֽ������ַ���
        // ���ֽ�����Base64����
        BASE64Encoder encoder = new BASE64Encoder();
        try {
            // ��ȡͼƬ�ֽ�����
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
     * base64�ַ���ת����ͼƬ
     *
     * @param imgData
     *            ͼƬ����
     * @param imgFilePath
     *            ��ŵ�����·��
     * @return
     * @throws IOException
     */
    @SuppressWarnings("finally")
    public static boolean GenerateImage(String imgData, String imgFilePath) throws IOException { // ���ֽ������ַ�������Base64���벢����ͼƬ
        if (imgData == null) // ͼ������Ϊ��
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out = null;
        try {
            out = new FileOutputStream(imgFilePath);
            // Base64����
            byte[] b = decoder.decodeBuffer(imgData);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// �����쳣����
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
        String imageStr = Base64Utils.GetImageStr("C:\\Users\\P7XXTMX-G\\Desktop\\2bec78b896dc6cae9d95dfd05f09d53e.jpg");
        System.out.println(imageStr);
        Base64Utils.GenerateImage(imageStr, "C:\\Users\\P7XXTMX-G\\Desktop\\̫��.jpg");
    }
}