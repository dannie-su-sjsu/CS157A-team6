<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/css/style.css"%></style>
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
<script src="jquery-3.2.1.js"></script>
<title>MovieList</title>
<header><h1>ToMovie</h1></header>
</head>
<body>
	<h3>Add Film to Watchlist</h3>
	<form action ="ViewServlet" method="post">
		<table>
			<tr><td>Title:</td><td><input type="text" name="title"/></td></tr> 
			<tr><td colspan="2"><input type="submit" value="Add Film"/></td></tr>   
		</table>
	</form>
	<br>
	<a href="movie.jsp">View Watchlist</a>
</body>
</html>