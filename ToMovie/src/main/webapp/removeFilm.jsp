<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "toMovie.MovieDao"%>
<%@ page import = "toMovie.MovieList"%>
<% List <MovieList> list = MovieDao.getWatchlist(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/css/style.css"%></style>
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
<script src="jquery-3.2.1.js"></script>
<title>Remove Movie</title>
<header><h1>ToMovie</h1></header>
</head>
<body>
<h2>Removing Film from Watchlist</h2>
    <table border="2" width="100%">
        <tr>
            <th>Title</th>
            <th>Status</th>
        </tr>
 	<% for (MovieList w : list) { %>
        <tr>
            <td><%= w.getTitle() %></td>
            <td><%= w.getStatus() %></td>
        </tr>
    </table>
     <h3>What would you like to do with this movie?</h3>
    <form action="UnhideServlet" method="post">
        <input type="hidden" name="title" value="<%= w.getTitle() %>">
        <input type="submit" value="Unhide Movie">
    </form>
    <form action="movie.jsp" method="get">
        <input type="submit" value="Keep Movie Hidden">
    </form>
	<% } %>
</body>
</html>