<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>�̼ҵ�½</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
	<style type="text/css">
	.btn-danger
	{
	background-color: #87CEFA;
	}
	.w3_info h2
	{
	color: #87CEFA;
	}
	i.fa.fa-user
	{
	color: #87CEFA;
	}
	i.fa.fa-lock
	{
	color: #87CEFA;
	}
	body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
}
	</style> 
<!-- <!--     <script type="text/javascript">   --> -->
<!-- //     $(document).ready(function() -->
<!-- //     		{ -->
<!-- // 		        var a = Math.random() + ""          //����һ�������   -->
<!-- // 		        var rand1 = a.charAt(5)             //�ĵ�������ĵ�����ַ�(ʵ�ʻ��Ǵ�0~9������)   -->
<!-- // 		        quotes = new Array              //������Ϣ����   -->
<!-- // 		        quotes[1] = '��¼1'               //�������ʮ��������ֵ��ı�   -->
<!-- // 		        quotes[2] = '��¼2'   -->
<!-- // 		        quotes[3] = '��¼3'   -->
<!-- // 		        quotes[4] = '��¼4'   -->
<!-- // 		        quotes[5] = '��¼5'   -->
<!-- // 		        quotes[6] = '��¼6'   -->
<!-- // 		        quotes[7] = '��¼7'   -->
<!-- // 		        quotes[8] = '��¼8'   -->
<!-- // 		        quotes[9] = '��¼9'   -->
<!-- // 		        quotes[0] = '��¼10'   -->
<!-- // 		        var quote = quotes[rand1]  -->
<!-- //         		document.getElementById("quote").innerHTML=quote;  -->
<!-- //     		}); -->
<!-- //    						//������ѡ��Ļ�д��ҳ��   -->
<!-- <!--     </script>   --> -->
</head>
<body>
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/busiLogin.html" method="post">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info">
			<div class="w3l_form">
				<div class="left_grid_info">
					<h3>��ӭ !</h3>
					<h4 id="quote"></h4>
					<p> Our food website is the most intimate food website.</p>
				</div>
			</div>
			<div class="w3_info">
				<h2>Sign In</h2>
				<p>�̼ҵ�¼</p>
						<div class="input-group">
							<span><i class="fa fa-user" aria-hidden="true"></i></span>
							<e:text name="aab102" required="true" autofocus="true" placeholder="�̼��û���"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aab103" type="password" required="required" placeholder="�̼�����">
						</div>    
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="��¼" >
						<a href="<%=path %>/busiRegister.jsp">
						<input class="btn btn-danger btn-block" type="button" name="next" value="ע��">
						</a> 
						<div style="display:inline">
						<a href="<%=path %>/userLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="�û����">
						</a> 
						<a href="<%=path %>/adminLogin.jsp">
						<input style="width:49%" class="btn btn-danger btn-block" type="button" name="next" value="����Ա���">
						</a> 
						</div>
			</div>
									</div>
			<div class="clear"></div>
			</div>
			
		</div>
		<div class="footer">
 </div>
	</form>
	</body>
</html>