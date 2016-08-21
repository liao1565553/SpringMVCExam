<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>销售管理系统 </title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/myStyle.css">
</head>
<body>

	<div class="wrapper">
		
		<div id="maker">
			<p>10895-陈预辽</p>
		</div>

		<div class="container">

			<h1>销售管理系统</h1>
			<form class="form" action="${pageContext.request.contextPath}/customer/login" method="POST">
				<input type="text" name="username"> 
				<input type="password" name="password"><br>
				<button type="submit" id="login-button">
					<strong>登录</strong>
				</button>
			</form>
		</div>

		<ul class="bg-bubbles">
			<li></li>
			<li></li>
		</ul>
	</div>
</body>
</html>