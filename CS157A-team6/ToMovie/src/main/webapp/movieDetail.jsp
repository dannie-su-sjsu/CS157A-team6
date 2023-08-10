<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="toMovie.MovieList"%>
<%@ page import="toMovie.MovieDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style><%@include file="/WEB-INF/css/style.css"%></style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
    <script src="jquery-3.2.1.js"></script>
    <title>Film Details</title>
    <header><h1>ToMovie</h1></header>
</head>
<body>
<%
String title = request.getParameter("title");
String currentStatus = "";
MovieList movieDetail = MovieDao.getMovieByTitle(title);
%>
<% if (movieDetail != null) { %>
    <form action="MovieDetailServlet" method="post">
        <h2>Film Information</h2>
	    <table border="2" width="100%">
	        <tr>
	            <th>Movie ID</th>
	            <th>Title</th>
	            <th>Description</th>
	        </tr>
	        <tr>
	            <td><%= movieDetail.getMovieID() %></td>
	            <td><%= movieDetail.getTitle() %></td>
	            <td><%= movieDetail.getDescription() %></td>
	        </tr>
	    </table>
        <h2>Film Ratings & Comments</h2>
	    <table border="2" width="100%">
	              <tr>
                <th>Rating</th>
            </tr>
            <tr>
                <td>
                 <div class="center-table">
	            <form action="MovieDetailServlet" method="post">
					<input type="hidden" name="action" value="rating">	  
					<input type="hidden" name="movieID" value="<%= movieDetail.getMovieID() %>">
					<label><input type="radio" name="rating" value="1" <%= movieDetail.getRating() == 1 ? "checked" : "" %>>1 Star</label>
	                <label><input type="radio" name="rating" value="2" <%= movieDetail.getRating() == 2 ? "checked" : "" %>>2 Star</label>
	                <label><input type="radio" name="rating" value="3" <%= movieDetail.getRating() == 3 ? "checked" : "" %>>3 Star</label>
	                <label><input type="radio" name="rating" value="4" <%= movieDetail.getRating() == 4 ? "checked" : "" %>>4 Star</label>
	                <label><input type="radio" name="rating" value="5" <%= movieDetail.getRating() == 5 ? "checked" : "" %>>5 Star</label>
	                <br><br>
	                <button type="submit">Submit Rating</button>
	                <br><br>
	            </form>
        		</div>
                </td>
            </tr>
            <tr>
                <th>Review</th>
            </tr>
            <tr>
                <td>
                <br>
                <div class="center-table">
            	<form action="MovieDetailServlet" method="post">
	                <input type="hidden" name="action" value="comment">
	                <input type="hidden" name="movieID" value="<%= movieDetail.getMovieID() %>">
	                <textarea name="comment" rows="4" cols="50" style="width: 98%; padding-top: 50px;" placeholder="Write Your Movie Review Here..."><%= movieDetail.getComment() %></textarea>
	                <br>
	                <button type="submit">Save Comment</button>
            	</form>
        		</div>
                </td>
            </tr>
	    </table>
    </form>
    <% String confirmationMessage = (String) request.getAttribute("confirmationMessage");
       if (confirmationMessage != null && !confirmationMessage.isEmpty()) {
    %>
    <div style="text-align: center; background-color: #f0f0f0; padding: 10px;">
        <%= confirmationMessage %>
    </div>
    <% } %>
<% } else { %>
    <p>Movie details not found for title: <%= title %></p>
<% } %>
<h3><a href="movie.jsp">Click Here to Return to your Watchlist</a></h3>
</body>
</html>

