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
<style type="text/css"></style>
<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
<script src="jquery-3.2.1.js"></script>
<script>
    function deleteFilm(title) {
        if (confirm("Are you sure you want to delete this film?")) {
            // Make an AJAX request to the server to delete the film
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "DeleteServlet", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Update the table after successful deletion
                    var tableRow = document.querySelector("td:contains('" + title + "')").parentNode;
                    tableRow.parentNode.removeChild(tableRow);
                }
            };

            xhr.send("title=" + encodeURIComponent(title));
        }
        // Reload the page regardless of the user's choice
        location.reload();
    }
    
</script>

<title>MovieList</title>
<header><h1>ToMovie</h1></header>
</head>
<body>
<%
//*** CONNECTING TO DATABASE ***///
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6","root","Halo4mlg!");			
%>
<%-- ToMovie Main Menu --%>
<h2><a href = "homepage.html">ToMovie Main Menu</a></h2>
<%-- Recommendation Page Link --%>
<h2>Don't Know What to Watch? Click <a href = "recommendation.jsp">here</a></h2>

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
<h3><a href = "addFilm.jsp">Add Film to Watchlist</a></h3>
<table border="2" width="100%">
    <tr>
        <th>Queue #</th>
        <th>Title</th>
        <th>Status</th>
        <th>Change Status</th>
        <th>Rate/Respond</th>
        <th>Delete</th>
    </tr>
    <% for (MovieList w : list) { %>
        <tr>
            <td><%= w.getListID() %></td>
			<td><%= w.getTitle() %></td>            
			<td><%= w.getStatus() %></td>
            <td><a href="changeStatus.jsp?title=<%= w.getTitle() %>">Edit</a></td>			            
	        <td><a href="movieDetail.jsp?movieID=<%= w.getMovieID() %>&title=<%= w.getTitle() %>">Respond</a></td>            
	        <td><a href="#" onclick="deleteFilm('<%= w.getTitle() %>');">delete</a></td>
        </tr>
    <% } %>
</table>
</body>
</html>