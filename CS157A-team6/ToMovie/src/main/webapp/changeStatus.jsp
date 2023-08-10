<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="toMovie.MovieDao" %>
<%@ page import="toMovie.MovieList" %>
<% List<MovieList> list = MovieDao.getWatchlist(); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        <%@include file="/WEB-INF/css/style.css" %>
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
    <script src="jquery-3.2.1.js"></script>
    <title>MovieList</title>
    <header>
        <h1>ToMovie</h1>
    </header>
</head>
<body>
<%
//*** CONNECTING TO DATABASE ***///
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6", "root", "Halo4mlg!");
Statement stmt = con.createStatement();

// Get the movie title parameter from the request
String title = request.getParameter("title");
String currentStatus = "";

// Retrieve the specific movie's status from the database
if (title != null && !title.isEmpty()) {
    ResultSet rs = stmt.executeQuery("SELECT status FROM WatchList WHERE title='" + title + "'");
    if (rs.next()) {
        currentStatus = rs.getString("status");
    }
}
%>

<h3>Change Film Status</h3>
<form action="UpdateStatusServlet" method="post">
    <input type="hidden" name="title" value="<%= title %>">
    <table>
        <tr>
            <td>Current Film Status for <%= title %> :</td>
            <td><%= currentStatus %></td>
        </tr>
        <tr>
            <td>New Film Status:</td>
            <td>
                <select name="status" style="width: 150px">
                    <option value="Planned" <%= currentStatus.equals("Planned") ? "selected" : "" %>>Planned</option>
                    <option value="In Progress" <%= currentStatus.equals("In Progress") ? "selected" : "" %>>In Progress</option>
                    <option value="Watched" <%= currentStatus.equals("Watched") ? "selected" : "" %>>Watched</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Update Status" /></td>
        </tr>
    </table>
</form>
<br>
<a href="movie.jsp">Go Back to Watchlist</a>
</body>
</html>
