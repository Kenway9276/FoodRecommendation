package com.neusoft.system.db;

import redis.clients.jedis.Jedis;

import javax.imageio.IIOException;
import java.io.*;
import java.lang.ThreadLocal;

public class RedisUtils {
    private static final ThreadLocal<redis.clients.jedis.Jedis> threadLocal=new ThreadLocal<>();

    private static Jedis getConnection(){
        Jedis jedis = threadLocal.get();
        if(jedis==null)
        {
            //�������Ӷ���
            jedis = new Jedis("localhost");
            //�����Ӷ����뵱ǰ�̰߳�
            threadLocal.set(jedis);
        }
        return jedis;
    }

    public static void SerializableSet(String key, Object o) throws IOException {
        // ���л�
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(stream);
        oos.writeObject(o);
        getConnection().set(key.getBytes(), stream.toByteArray());
    }

    public static Object SerializableGet(String key) throws IOException, ClassNotFoundException{
        //�����л�
        ByteArrayInputStream bri = new ByteArrayInputStream(getConnection().get(key.getBytes()));
        ObjectInputStream outs = new ObjectInputStream(bri);
        return outs.readObject();
    }

    public static String get(String key){
        return getConnection().get(key);
    }
    public static void set(String key, String value){
        getConnection().set(key, value);
    }

    public static void del(String key) {
        getConnection().del(key);
    }
}
