<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "toMovie.MovieDao"%>
<%@ page import = "toMovie.MovieList"%>
<%@ page import = "toMovie.AddServlet"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/css/style.css"%></style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
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
try {
    PreparedStatement display = con.prepareStatement("SELECT title, year, MovieID FROM cs157aprojectteam6.Movie");				
    ResultSet showDisplay = display.executeQuery();
    if (showDisplay.next() == false) {
        out.println("No movies in ToMovie");
    } else {
%>
<div class="table_mod1">
    <table>
        <tr>
            <th>Title</th>
            <th>Year Released</th>
        </tr>
        <%
            do {
                String title = showDisplay.getString(1);
                int year = showDisplay.getInt(2);
                int movieID = showDisplay.getInt(3);
        %>
        <tr>
            <td><%= title %></td>
            <td><%= year %></td>
        </tr>
        <%
            } while (showDisplay.next());
        %>
    </table>
</div>
<%
    }
} catch (Exception e) {
    e.getStackTrace();
}
%>
<h3>Add Film to Watchlist</h3>
<form action="AddServlet" method="post">
    <table>
        <tr>
            <td>Title:</td>
            <td>
                <select name="movieID" style="width: 150px">
                    <option value="">-- Select a Movie --</option>
                    <%
                        // Dynamically populate the dropdown with movie titles and IDs
                        PreparedStatement movieTitles = con.prepareStatement("SELECT MovieID, title FROM cs157aprojectteam6.Movie");
                        ResultSet movieTitleResult = movieTitles.executeQuery();
                        while (movieTitleResult.next()) {
                            int movieID = movieTitleResult.getInt("MovieID");
                            String title = movieTitleResult.getString("title");
                    %>
                    <option value="<%= movieID %>">Title: <%= title %>, MovieID: <%= movieID %></option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Set Film Status:</td>
            <td>
                <select name="status" style="width: 150px">
                    <option>Planned</option>
                    <option>In Progress</option>
                    <option>Watched</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Add Film" /></td>
        </tr>
    </table>
</form>
<br>
<a href="movie.jsp">Go Back to Watchlist</a>
</body>
</html>
