<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/res/css/myStyle.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/jquery2.sorted.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/ckform.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/common.js"></script>

<style type="text/css">
body {
	margin-top: 20px;
	font-size: 20px;
	font-size: 20px;
	padding-bottom: 40px;
	background-color: #e9e7ef;
	font-size: 20px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) { /* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}

.floatLeft {
	float: left;
	width: 100px;
}

.addnew {
	margin-left: 150px;
	margin-right: auto;
}

.top{
	margin-bottom: 10px;
}

</style>

<script type="text/javascript">
	function deleteFilm(id) {
		if (window.confirm("确定要删除" + id + "吗？")) {
			location.href = "${pageContext.request.contextPath}/film/delFilm?filmId="
					+ id;
		}
	}
</script>

</head>
<body>
	<div id="top">
		<font color="#777777"> <strong>客户列表</strong></font>
		<a class="addnew" 
			href="${pageContext.request.contextPath}/customer/add">新建
		</a>
	</div>

	<table class="table table-bordered table-responsive">
		<thead>
			<tr>
				<td>操作</td>
				<th>firstName</th>
				<th>lastName</th>
				<th>address</th>
				<th>email</th>
				<th>customerId</th>
				<th>lastUpdate</th>

			</tr>
		</thead>

		<c:forEach var="item" items="${pageModel.list}">
			<tr>
				<td class="floatLeft">
					<button id="delbtn" onclick="deleteFilm('${item.customerId}')">删除</button>
					<button>修改</button>
				</td>
				<td>${item.firstName }</td>
				<td>${item.lastName}</td>
				<td>${item.addressId}</td>
				<td>${item.email}</td>
				<td>${item.customerId}</td>
				<td>${item.lastUpdate}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="bottom">
		<a href="${pageContext.request.contextPath}/customer/first">第一页</a> <a
			href="${pageContext.request.contextPath}/customer/pre">上一页</a>
		${pageModel.pageNo}/${pageModel.totalPages } <a
			href="${pageContext.request.contextPath}/customer/next">下一页</a> <a
			href="${pageContext.request.contextPath}/customer/last">最后一页</a>
	</div>

</body>
</html>