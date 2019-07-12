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
            //创建连接对象
            jedis = new Jedis("localhost");
            //将连接对象与当前线程绑定
            threadLocal.set(jedis);
        }
        return jedis;
    }

    public static void SerializableSet(String key, Object o) throws IOException {
        // 序列化
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(stream);
        oos.writeObject(o);
        getConnection().set(key.getBytes(), stream.toByteArray());
    }

    public static Object SerializableGet(String key) throws IOException, ClassNotFoundException{
        //反序列化
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
