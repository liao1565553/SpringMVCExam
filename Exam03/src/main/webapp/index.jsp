<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

</head>
<body>
	<c:choose>
		<c:when test="${!empty loginCustomer }">
			<jsp:forward page="/WEB-INF/jsp/main.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:forward page="login.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>
