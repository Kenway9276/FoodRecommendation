<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>商家修改账户信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="" />
<link href="<%=path %>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=path %>/css/style_login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="http://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900" rel="stylesheet">
<style type="text/css">
@media (max-width: 992px)
.login100-pic {
    width: 35%;
}
#aab110
{
margin-top:15px;
}
i.fa.fa-envelope 
{
color:#87CEFA;
}
i.fa.fa-lock
{
color:#87CEFA;
}
i.fa.fa-shopping-basket
{
color:#87CEFA;
}
i.fa.fa-map 
{
color:#87CEFA;
}
i.fa.fa-phone 
{
color:#87CEFA;
}
i.fa.fa-star 
{
color:#87CEFA;
}
i.fa.fa-smile-o
{
color:#87CEFA;
}
.btn-danger 
{
background-color: #87CEFA;
}
body {
    padding: 0;
    margin: 0;
    background: url(<%=path%>/images/9.jpg) no-repeat 0px 0px;
    background-size: cover;
    font-family: 'Raleway', sans-serif;
}
</style>
<script>    
    function aircheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('airconditional-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('airconditional-copy').checked = true;
    		}
    }
    function wificheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('wifi-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('wifi-copy').checked = true;
    		}
    }
    function chargercheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('charger-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('charger-copy').checked = true;
    		}
    }
    function joincheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('join-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('join-copy').checked = true;
    		}
    }
    function parkingcheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('parking-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('parking-copy').checked = true;
    		}
    }
    function somokingcheck(obj)
    {
    	if(obj.checked==true)
    		{
    		document.getElementById('somoking-copy').checked = false;
    		}
    	else if(obj.checked==false)
    		{
    		document.getElementById('somoking-copy').checked = true;
    		}
    }
	</script>
</head>
<body >
<div style="color:#FFFFFF">
${msg}
</div>
<br>
<form action="<%=path %>/busiModify.html" method="post">
<div class="signupform">.
<h1></h1>
	<div class="container">
		
		<div class="agile_info" style="height:830px">
			<div class="w3l_form">
				<div class="left_grid_info">
					<div class="login100-pic js-tilt" data-tilt>
						<img src="${ins.aab113}" alt="IMG" style="height: 300px">
					</div>
				</div>
			</div>
			<div class="w3_info">
				<h2 style="color:#87CEFA">请修改账户信息</h2>
				<input type="hidden" name="aab101" value="${ins.aab101 }">
						<div class="input-group">
							<span><i class="fa fa-envelope" aria-hidden="true"></i></span>
							<e:text name="aab102" readonly="true" required="true" value="${ins.aab102}(用户名)"/>
						</div>
						<div class="input-group">
							<span><i class="fa fa-lock" aria-hidden="true"></i></span>
							<input name="aab103"  type="text" placeholder="修改商家密码">
						</div> 
						<div class="input-group">  
							<span><i class="fa fa-shopping-basket" aria-hidden="true"></i></span>
							<input name="aab104" type="text" placeholder="店铺名" value="${ins.aab104}">
						</div> 
						<div class="input-group"> 
							<span><i class="fa fa-map" aria-hidden="true"></i></span>
							<input name="aab106" type="text" placeholder="地址（xx市+店铺具体地址）" required="required" value="${ins.aab106}">
						</div>   
						<div class="input-group"> 
							<span><i class="fa fa-phone" aria-hidden="true"></i></span>
							<input name="aab107" type="text" placeholder="联系电话" required="required" value="${ins.aab107}">
						</div>  
						<div style="height:40px;vertical-align:middle" class="input-group">
							<span><i class="fa fa-star" aria-hidden="true"></i></span>
							<e:radio id="aab110"  name="aab110" value="接受预定:1,不接受预订:0" defval="${empty ins.aab101?'0':ins.aab110}"/>
						</div>
						<div class="input-group" style="height:45px;margin-top: 12px;"> 
						<span><i class="fa fa-smile-o" aria-hidden="true"></i></span>
							<input type="checkbox" name="aaab112" class="aab112" id="airconditional" onclick="aircheck(this)" value="1" ${Equipment.e0=='1'?"checked='checked'":""}>空调
							<input type="checkbox" style="display:none" name="aaab112" class="aab112" id="airconditional-copy" value="0" ${Equipment.e0=='0'?"checked='checked'":""}>
							<input type="checkbox" name="baab112" class="aab112" id="wifi" onclick="wificheck(this)" value="1" ${Equipment.e1=='1'?"checked='checked'":""}>WIFI
							<input type="checkbox" style="display:none" name="baab112" class="aab112" id="wifi-copy" value="0" ${Equipment.e1=='0'?"checked='checked'":""}>
							<input type="checkbox" name="caab112" class="aab112" id="charger" onclick="chargercheck(this)" value="1" ${Equipment.e2=='1'?"checked='checked'":""}>充电宝
							<input type="checkbox" style="display:none" name="caab112" class="aab112" id="charger-copy" value="0" ${Equipment.e2=='0'?"checked='checked'":""}>
							<input type="checkbox" name="daab112" class="aab112" id="join" onclick="joincheck(this)" value="1" ${Equipment.e3=='1'?"checked='checked'":""}>洗手间
							<input type="checkbox" style="display:none" name="daab112" class="aab112" id="join-copy" value="0" ${Equipment.e3=='0'?"checked='checked'":""}>
							<input type="checkbox" name="eaab112" class="aab112" id="parking" onclick="parkingcheck(this)" value="1" ${Equipment.e4=='1'?"checked='checked'":""}>停车位
							<input type="checkbox" style="display:none" name="eaab112" class="aab112" id="parking-copy" value="0" ${Equipment.e4=='0'?"checked='checked'":""}>
							<input type="checkbox" name="faab112" class="aab112" id="somoking" onclick="somokingcheck(this)" value="1" ${Equipment.e5=='1'?"checked='checked'":""}>吸烟区
							<input type="checkbox" style="display:none" name="faab112" class="aab112" id="somoking-copy" value="0" ${Equipment.e5=='0'?"checked='checked'":""}>
						</div>  
       					<input class="btn btn-danger btn-block" type="submit" name="next" value="修改商家头像"
       					 formaction="<%=path%>/busiToPortraitPic.html" formnovalidate="formnovalidate">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="修改信息"
       					 formaction="<%=path%>/busiModifyInfo.html">
       					 <input class="btn btn-danger btn-block" type="submit" name="next" value="返回"
       					 formaction="<%=path%>/busiReturn.html" formnovalidate="formnovalidate">
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