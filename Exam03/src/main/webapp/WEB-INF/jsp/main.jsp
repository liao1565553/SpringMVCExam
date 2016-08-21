<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="utf-8">
<title>客户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/res/css/adminStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/res/js/jquery.min.js"></script>

<style>
body {
	margin: 0;
	font-family: 微软雅黑;
	background-repeat: no-repea;
	background-size: cover;
	background-attachment: fixed;
	background-color: #DDDDDD
}

.title {
	float: left;
	margin: -32px 20px;
	font-size: 40px;
	color: #FFFFFF;
	font-height: 55px;
	font-family: 隶书;
}

.top2 {
	position: absolute;
	width: 100%;
	height: 60px;
	text-align: center;
	color: #ccffff;
	background-color: #888888
}

.left {
	position: absolute;
	left: 0px;
	top: 60px;
	width: 200px;
	height: 85%;
	border-right: 1px solid #9370DB;
	color: #000000;
	font-size: 20px;
	text-align: center;
	background-color: #B3B3B3
}

.right {
	position: absolute;
	left: 200px;
	top: 60px;
	width: 85.2%;
	height: 85%;
	border-top: 0px solid #484860;
	font-size: 14px;
	text-align: center;
}
.end {
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 30px;
	text-align: center;
	color: #556B2F;
	font-size: 17px;
	font-height: 20px;
	font-family: 楷体;
	background-color: #C0C0C0
}

.div1 {
	text-align: center;
	width: 200px;
	padding-top: 10px;
}

.div2 {
	height: 40px;
	line-height: 40px;
	cursor: pointer;
	font-size: 18px;
	position: relative;
	left:10px;
	border-bottom: #ccc 0px dotted;
}

.spgl {
	position: absolute;
	height: 20px;
	width: 20px;
	left: 20px;
	top: 10px;
	background: url(${pageContext.request.contextPath}/res/images/1.png);
}

</style>
</head>
<body>
	<div class="top2">
		<div class="logo">
			<p>10895 - 陈预辽</p>
		</div>
		<div class="title">
			<h3>客户管理</h3>
		</div>
		<div class="fr top-link">
			<a href="admin_list.html" target="mainCont" title="DeathGhost">
				<i class="adminIcon"></i>
				<span>管理员：${loginCustomer.firstName }</span>
			</a>
		</div>
	</div>

	<div class="left">
		<div class="div1">

			<div class="div2">
				<div class="spgl"></div>
				<a class="a" href="javascript:void(0);" onClick="openurl('${pageContext.request.contextPath}/customer/query');">Customer管理</a>
			</div>
			
			<div class="div2">
				<div class="spgl"></div>
				Film 设置
			</div>
		</div>
	</div>

	<div class="right">
		<iframe id="rightFrame" name="rightFrame" width="100%" height="100%" scrolling="auto"
			marginheight="0" marginwidth="0" align="center"
			style="border: 0px solid #CCC; margin: 0; padding: 0;"></iframe>
	</div>

</body>

<script type="text/javascript">
function openurl(url) {
	var rframe = parent.document.getElementById("rightFrame");
	rframe.src = url;
}

openurl('${pageContext.request.contextPath}/customer/query');
</script>



</html>
