<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "toMovie.MovieDao"%>
<%@ page import = "toMovie.MovieList"%>
<% List <MovieList> catalog = MovieDao.getCatalog(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/css/style.css"%></style>
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
<script src="jquery-3.2.1.js"></script>
<title>ToMovie Film Catalog</title>
<header><h1>ToMovie</h1></header>
</head>
<body>

<%-- Displaying Full Film Catalog--%>
<h2>Detailed Film Catalog</h2>
<table border="2" width="100%">
    <tr>
        <th>Film Title</th>
        <th>Year</th>
        <th>Genre</th>
        <th>Length (Mins)</th>
        <th>Director</th>
        <th>Main Actor</th>
    </tr>
    <% for (MovieList c : catalog) { %>
        <tr>
            <td><%= c.getTitle() %></td>
            <td><%= c.getYear() %></td>
            <td><%= c.getGenre() %></td>
            <td><%= c.getLengthMovie() %></td>
            <td><%= c.getDirectorName() %></td>
            <td><%= c.getActorName() %></td>
        </tr>
    <% } %>
</table>
<h3><a href = "movie.jsp">Click Here to Return to your Watchlist</h3>

</body>
</html>