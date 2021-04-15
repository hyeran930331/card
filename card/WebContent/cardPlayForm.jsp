<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카드 플레이 폼</title>
</head>
<body>
	<!-- 3 출력 -->
	<table>
		<tr>
			<td>
				카드 뒷모습
				<img src="<%=request.getContextPath()%>/img/cardback.png">
			</td>
			<td>
				<form action="<%=request.getContextPath()%>/cardPlayAction.jsp" method="post">
					<input type="radio" name="count" value="2"> 2명
					<input type="radio" name="count" value="3"> 3명
					<input type="radio" name="count" value="4"> 4명
					<button type="submit">play</button>
				</form>
			</td>
		</tr>
	</table>
	
	
</body>
</html>