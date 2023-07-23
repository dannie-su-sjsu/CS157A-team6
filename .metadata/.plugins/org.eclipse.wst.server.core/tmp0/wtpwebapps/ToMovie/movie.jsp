<%@ page language="java" contentType="text/html; \charset=UTF-8"
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
<title>MovieList</title>
<header><h1>ToMovie</h1></header>
</head>
<body>
<%
//*** CONNECTING TO DATABASE ***///
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6","root","Halo4mlg!");			
%>

<%-- Displaying Film Catalog --%>
<h2>Film Catalog</h2>
<h3><a href = "catalog.jsp">View Full Film Descriptions</a></h3>
<%
try{
	PreparedStatement display = con.prepareStatement("SELECT title,year FROM cs157aprojectteam6.Movie");				
	ResultSet showDisplay = display.executeQuery();
	if(showDisplay.next()==false){
		out.println("No movies in the ToMovie");
	}
	else{%>
		<div class= "table_mod1">
			<table>
			<tr><th>Title</th><th>Year Released</th></tr> <%
			do
			{ %>
				<tr><td><%= showDisplay.getString(1) %></td><td><%= showDisplay.getString(2) %></td></tr><%
			}while(showDisplay.next());%>
			</table>
		</div><% 
	}
}
catch(Exception e){
	e.getStackTrace();
}
%>

<%-- Displaying Watchlist --%>
<h2>Watchlist</h2>
<table border="2" width="100%">
    <tr>
        <th>Queue #</th>
        <th>Title</th>
        <th>Status</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <% for (MovieList w : list) { %>
        <tr>
            <td><%= w.getListID() %></td>
            <td><%= w.getTitle() %></td>
            <td><%= w.getStatus() %></td>
            <td><!-- edit button here --></td>
            <td><!-- delete button here --></td>
        </tr>
    <% } %>
</table>
</html>