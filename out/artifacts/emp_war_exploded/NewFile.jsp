<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
<script type="text/javascript">

	function onChange(id)
	{
		var ckb=document.createElement("input");
		ckb.type="checkbox";
		ckb.checked=true;
		ckb.id="id.toString().concat("-copy");"
	}

</script>
</head>
<body>
<input type="checkbox" id="a" onclick=onChange("a")>
</body>
</html>