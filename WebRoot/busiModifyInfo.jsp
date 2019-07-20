<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /> 
	<title>商家注册</title>
	<meta charset="gbk">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--图标-->
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	
	<!--布局框架-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	
	<!--主要样式-->
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="css/busi_cropper.min.css">
    <link rel="stylesheet" href="css/busi_ImgCropping.css">
	
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

<body>
<div class="Modify">
	<div class="container-login100">
		<div class="wrap-login100">
			<div class="login100-pic js-tilt" data-tilt>
				<img src="${ins.aab113}"  id="finalImg" alt="IMG">
			</div>

			<form class="login100-form validate-form" method="post">
				<span class="login100-form-title">
					${ins.aab104 }，请修改基础信息
				</span>
				<input type="hidden" name = "aab101" value="${ins.aab101 }"> 
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="修改商家头像"
					 formaction="<%=path%>/busiToPortraitPic.html" formnovalidate="formnovalidate">
				</div>
				(用户名)
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab102" required="required" readonly="readonly" value="${ins.aab102}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-envelope" aria-hidden="true"></i>
					</span>
				</div>
				（修改密码）
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab103" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				（店铺名）
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab104" required="required" value="${ins.aab104}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				（地址）
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab106" required="required" value="${ins.aab106}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				（联系电话）
				<div class="wrap-input100 validate-input">
					<input type="text" class="input100" name="aab107" required="required" value="${ins.aab107}" />
					<span class="focus-input100"></span>
					<span class="symbol-input100">
						<i class="fa fa-lock" aria-hidden="true"></i>
					</span>
				</div>
				<div class="wrap-input100 validate-input">
					是否就接受预定<e:radio  name="aab110" value="是:0,否:1" defval="${empty ins.aab101?'1':ins.aab110}"/>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input">
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
				
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="修改"
					 formaction="<%=path%>/busiModifyInfo.html">
				</div>
				<div class="container-login100-form-btn">
					<input class="login100-form-btn" type="submit" name="next" value="返回"
					 formaction="<%=path%>/busiReturn.html" formnovalidate="formnovalidate">
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>