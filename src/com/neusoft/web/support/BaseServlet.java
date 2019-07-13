package com.neusoft.web.support;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.html")
public class BaseServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		 String toPath=null;   //��ת��Ŀ��ҳ��
         try
         {
        	 
        	/************************************************************
        	 *      ��������·��,��ȡĿ���������
        	 ************************************************************/
     		//��������ķ���·��
     		String uri=request.getRequestURI();
     		//��ȡ������Դ�����ļ���
     		String baseName=uri.substring(uri.lastIndexOf("/")+1).replace(".html", "");
     		
     		//�������,��������ҵ��������Ļ���������
     		String basePackageName="com.neusoft.web.impl.";
     		//��ȡ��������ǰ׺��
     		String controllerFirstName=baseName.substring(0,1).toUpperCase()+baseName.substring(1);
     		
     		
     		/***********************************************************
     		 *                        ʵ����Ŀ����---ҵ�������
     		 ***********************************************************/
     		//ʵ����ҵ�������
     		BaseController controller=(BaseController)Class.forName(basePackageName+controllerFirstName+"Servlet").newInstance();
     		
     		
     		/***********************************************************
     		 *                        ��ҵ�������,���ҳ������     i
     		 ***********************************************************/
     		//Ϊҵ�������֯��DTO��Ƭ
     		if(controllerFirstName.contains(""))
     		{
     			controller.setMapDtoForFile(this.createDtoForFile(request));
     		}
     		else
     		{
     			controller.setMapDto(this.createDto(request));
     		}


			 controller.setMapDto(this.createDto(request));


     		/***********************************************************
     		 *                        ����ҵ������������̿��Ʒ���
     		 ***********************************************************/
     		//�������̿��Ʒ���
     		toPath=controller.execute();

     		/***********************************************************
     		 *                      �����������ҳ�����������     o
     		 ***********************************************************/
     		//��������
     		Map<String,Object> rueqestAttribute=controller.getAttribute();
     		//֯�����Դ�����Ƭ
     		this.parseRueqestAttribute(request, rueqestAttribute);

         }	
         catch(Exception ex)
         {
        	 request.setAttribute("msg", "��ʾ:�������!");
        	 toPath="Error";
        	 ex.printStackTrace();
         }
		request.getRequestDispatcher("/"+toPath+".jsp").forward(request, response);
	}

	/**
	 * ǰ�˴���ͼƬʱ������dto
	 * @param request
	 * @return
	 */
	private Map<String, Object> createDtoForFile(HttpServletRequest request) {
		Map<String,Object> dto = this.createDto(request);
		try {
			// ����������
			DiskFileItemFactory factory=new DiskFileItemFactory();
			// ����������
			ServletFileUpload upload=new ServletFileUpload(factory);


			//���û�������С����ʱ�ļ�Ŀ¼,��������ļ��Ĵ�С�����ڴ滺���������ļ�������ʱ�����ڴ�Ŀ¼��
			factory.setSizeThreshold(1024*1024*10);
			File uploadTemp=new File("\\uploadTemp");
			uploadTemp.mkdirs();
			factory.setRepository(uploadTemp);
			//���õ����ļ���С����
			upload.setFileSizeMax(1024*1024*100);
			//���������ļ��ܺʹ�С����
			upload.setSizeMax(1024*1024*300);
			List<FileItem> list=upload.parseRequest(request);
			System.out.println(list);
			for (FileItem fileItem:list){
				if (!fileItem.isFormField()&&fileItem.getName()!=null&&!"".equals(fileItem.getName())){
					String filName=fileItem.getName();
					//����UUID����α����ַ�������Ϊ�ļ��������ظ�
					String uuid= UUID.randomUUID().toString();

					//��ȡ�ļ���׺��
					String suffix=filName.substring(filName.lastIndexOf("."));

					//��ȡ�ļ��ϴ�Ŀ¼·��������Ŀ����·���µ�uploadĿ¼����������������ֱ�ӷ��ʵ�ͼƬ�����Է���WEB-INF��
					String uploadPath=request.getSession().getServletContext().getRealPath("/upload");
					dto.put("imgPath",uuid+suffix);
					File file=new File(uploadPath);
					file.mkdirs();
					//д���ļ������̣�����ִ����Ϻ����и���ʱ�ļ��������Զ�ɾ��
					fileItem.write(new File(uploadPath,uuid+suffix));

				}
				else {
					System.out.println(fileItem.getFieldName());
					System.out.println(fileItem.getString());
					dto.put(fileItem.getFieldName(),new String(fileItem.getString().getBytes("ISO8859_1"), "utf-8"));
				}
			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	private void parseRueqestAttribute(HttpServletRequest request,Map<String,Object> rueqestAttribute)
	{
		//1.��ԭ���еļ�ֵ��,�γɼ���
		Set<Map.Entry<String, Object>> entrySet=rueqestAttribute.entrySet();
		//2.ѭ������
		for(Map.Entry<String, Object> entry:entrySet)
		{
			//3.��map��ÿ����ֵ��,ת����request������
			request.setAttribute(entry.getKey(), entry.getValue());
		}
		//������е�request����������
		rueqestAttribute.clear();
	}
	
	
	/**
	 *  DTO��Ƭ
	 * @param request
	 * @return
	 */
	private  Map<String,Object> createDto(HttpServletRequest request)
	{
		//��ȡsession���û���ˮ��
		String id = (String) request.getSession().getAttribute("userID");

		//1.��ȡҳ������
		Map<String,String[]> tem=request.getParameterMap();
		int initSize=((int)(tem.size()/0.75))+1;
		//2.�������м�ֵ��,�γɼ�ֵ�Լ���
		Set<Entry<String,String[]>> entrySet=tem.entrySet();
		//3.��������,��ʾEnetry��value����
		String value[]=null;
		
		//4.����DTO����
		Map<String,Object> dto=new HashMap<>(initSize);
		//5.ѭ����ȡentrySet,��ȡÿ����ֵ��
		for(Entry<String,String[]> entry :entrySet)
		{
			//��ȡvalue���ֵ�����
			value=entry.getValue();
			//���ݳ����ж�ҳ��ؼ������
			if(value.length==1)  //��checkbox��ؼ�
			{
		        //���˵�ҳ��δ�����Ŀ
				if(value[0]!=null && !value[0].equals(""))
				{
					dto.put(entry.getKey(), value[0]);
				}
			}
			else     //checkbox��ؼ�
			{
				dto.put(entry.getKey(), value);
			}	
		}
		//System.out.println(dto);
		dto.put("userID", id);
		return dto;
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		this.doGet(request, response);
	}

}
