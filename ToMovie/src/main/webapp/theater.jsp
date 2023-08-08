<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="toMovie.MovieDao" %>
<%@ page import="toMovie.MovieList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    	div 
    	{
    	background-color: #fdebb5;
		border-width: 50px;
		border-style: solid;
		border-color: #ea8607;
		}
      h1
      {
         font-size: 80px;
         font-family: Jockey One;
      }
      form
      {
         font-size: 30px;
         font-family: Jockey One;
      }
      button
      {
         font-size: 30px;
         font-family: Jockey One;
         background-color: #ea8607;
         box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
      }
		a
      {
         font-size: 30px;
         font-family: Jockey One;
         background-color: #ea8607;
         box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
      }
      label
      {
      	font-size: 30px;
      	font-family: Jockey One;
      }
	</style>
	<style><%@include file="/WEB-INF/css/style.css"%></style>
	<style type="text/css"></style>
	<script type="text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
	<script src="jquery-3.2.1.js"></script>
	<head>
	<title> Theaters</title>
	<header><h1>ToMovie</h1></header>
	</head>
	<body>
		<center>
		<div>
	<form action="TheaterServlet" method="post">
    <div class="dropdown">
        <label for="zipSelect">Select Zip:</label>
        <select id="zipSelect" name="zipSelect">
            <option value="">Select a Zip</option>
            <%
            List<Integer> zips = MovieDao.getAllZips(); 
            for (Integer zip : zips) { %>
            <option value="<%= zip %>"><%= zip %></option>
            <% } %>
        </select>
        <button type="submit">Show Theaters</button>
    </div>
</form>
<div>
    <h2>Theaters:</h2>
        <%
        List<String> theaters = (List<String>) request.getAttribute("theaters");
        if (theaters != null) {
            for (String theater : theaters) { %>
            <li><%= theater %></li>
            <% }
        } else { %>
            <li>No theaters to display.</li>
        <% } %>

			<h1>Local Map</h1>			
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d50761.84066449686!2d-121.9553174718142!3d37.327945407662476!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fcdcc7b583a49%3A0xdf4405d71e8629ed!2sIMAX%20Dome%20Theater!5e0!3m2!1sen!2sus!4v1691474399787!5m2!1sen!2sus" 
				width="600" 
				height="450" 
				style="border:0;" a
				llowfullscreen="" 
				loading="lazy" 
				referrerpolicy="no-referrer-when-downgrade">
				</iframe>
				<br><br>
         <form action = "recommendation.jsp" method="get" id="search_movie">
            <label for="title"></label>
            <button type = "submit" value = "search">Search for Movies</button>
         </form>
         <a href="recommendation.jsp">Go Back to Recommendations</a>
		 <br><a href="movie.jsp">Go Back to Watchlist</a>
			</div>
		</center>
</body>
</html>