<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Health Body</title>
<link rel="icon"
	href="https://d13yacurqjgara.cloudfront.net/users/678458/screenshots/1856046/h-icon.png">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar">1</span> <span class="icon-bar">2</span> <span
					class="icon-bar">3</span>
			</button>
			<a class="navbar-brand" href="main.html">Health Body</a>
			<ul class="nav navbar-nav">
				<li><a href="usercabinet.html">${login}</a></li>
				<li><a href="userlist.html">Users</a></li>
				<li><a href="listGroups.html">Groups</a></li>
				<li><a href="listCompetitions.html">Competitions</a></li>
			</ul>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right" role="form">
				<a class="btn btn-success" type="submit" href="Logout.html">Sign
					out</a>
			</form>
		</div>
	</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="weather" align="center">
		<b>Weather in: </b>${city_name}<br> <img
			src="http://openweathermap.org/img/w/${weather_icon}.png"
			alt="weather_icon" /><br> <b>Temperature: </b>${temp} C<br>
		<b>Humidity: </b>${humidity} %<br> <b>Wind: </b>${wind} m/s<br>
	</div>
	<br>
	<div class="container">
		<table class="table table-hover">
			<tr class="info">
				<th>Name of Competition</th>
				<th>Amount</th>
				<th>Start Date</th>
				<th>End Date</th>
				<th>Take part</th>
			</tr>
			<c:forEach items="${getAllComp}" var="comp">
				<tr class="info">
					<c:url var="takePart" value="take_part?nameCompetition=${comp.name}&uLogin=${login}" />
					<td>${comp.name}</td>
					<td>${comp.count}</td>
					<td>${comp.startDate}</td>
					<td>${comp.finishDate}</td>
					<td><a href="takePart" class="${takePart ?  'blue' : 'grey'}">
						Take part
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="container" align="center">
		<ul class="pagination">

			<%--For displaying Previous link --%>
			<li><c:if test="${currentPage != 1}">
					<a
						href="<c:url value="/main.html" >
        <c:param name="partNumber" value="${currentPage - 1}"/>${p}</c:url>">«</a>
				</c:if></li>

			<%--For displaying Page numbers --%>
			<li><c:forEach begin="${startPartNumber}"
					end="${lastPartNumber}" var="p">
					<a
						href="<c:url value="/main.html" >
        <c:param name="partNumber" value="${p}"/>${p}</c:url>">${p}</a>
				</c:forEach></li>

			<%--For displaying Next link --%>
			<li><c:if test="${currentPage lt lastPartNumber}">
					<a
						href="<c:url value="/main.html" >
        <c:param name="partNumber" value="${currentPage + 1}"/>${p}</c:url>">»</a>
				</c:if></li>
		</ul>
	</div>
	<script src="resources/js/jquery-1.9.1.min.js"></script>
</body>
</html>