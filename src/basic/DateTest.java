package basic;

import java.util.Date;
import java.text.SimpleDateFormat;

public class DateTest 
{

	public static void main(String[] args) 
	{
		//实例化日期格式类
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//获取系统当前日期
		Date d=new Date();
		//格式化当前日期
		String str_date=sdf.format(d);
		System.out.println(str_date);
		
	}

}
