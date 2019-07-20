<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
        body, html {width: 100%;height: 100%; margin:0;font-family:"΢���ź�";}
        #l-map{height:100%;width:50%; float:left}
        #r-result,#r-result table{width:50%;float:left}
        #main div{
            float:left;width:33%;height:30px;
            line-height:30px;
            text-align:center;
            border-right: 1px solid;
        }
        a:link{
            text-decoration:none;
        }
        .clo{
            border-right: 2px solid #666;
        }
        #r-result h1{
            background:#A2CD5A;
        }
        #main{
            overflow: hidden;
        }
        #car{
            background:#6495ED;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=LtaZG8G4TNzGd6Rs57WGyKMr7Hx7GxbU"></script>
    <title>����</title>
</head>
<body>
<div id="l-map"></div>
<div id="main">
</div>

<input type="hidden" id="ad" value="${Address.address }">


<div id="r-result"></div>
</body>
</html>


<script type="text/javascript">

		
		// �ٶȵ�ͼAPI����
	    //������ͼʵ��
		var address = document.getElementById("ad").value;
	    var map = new BMap.Map("l-map");
	    //����������,��ʼ����ͼ���������ĵ�����͵�ͼ����
	    //��λ����ȡ����
	    alert("������,���Ժ�!");
	    var geolocation = new BMap.Geolocation();
	    geolocation.getCurrentPosition(function(r){
	        if(this.getStatus() == BMAP_STATUS_SUCCESS){
	            var mk = new BMap.Marker(r.point);
	            map.addOverlay(mk);
	            map.panTo(r.point);
	            //p1 ��ȡ�Ķ�λ����
	            p1=new BMap.Point(r.point.lng,r.point.lat);
				map.centerAndZoom(p1);
					            
	         	
	            	var driving = new BMap.DrivingRoute(map, {
		                renderOptions: {map: map, panel: "r-result"}
		            });
	            	driving.search(p1, address);
            
	            
	        }
	        else {
	            alert('failed'+this.getStatus());
	        }
	    },{enableHighAccuracy: true})
	
</script>