<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="toMovie.MovieDao" %>
<%@ page import="toMovie.MovieList" %>
<%@ page import="toMovie.AddServlet" %>
<% List <MovieList> search = MovieDao.getSearchRecommendations(); %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style><%@ include file="/WEB-INF/css/style.css"%></style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
    <title>MovieList</title>
    <header><h1>ToMovie</h1></header>
    <script>
    $(document).ready(function() {
        //filmListShown flag set to false initially
        var filmListShown = false;

        $("input[type='radio']").click(function() {
            $(".dropdown").hide();
            var filterType = $(this).val();
            if (filterType !== "ratings") {
                $("#" + filterType + "Dropdown").show();
            } else {
                $("#ratingDropdown").show();
            }
            // Hide the film list when filters change
            $("#filmList").hide();
            filmListShown = false;
        });
        // Show the film list only if it's not already shown
        $("#showFilmsButton").click(function() {
            if (!filmListShown) {
                $("#filmList").show();
                filmListShown = true;
            }
        });

        $("#resetFilterButton").click(function() {
            $(".dropdown").hide();
            $("#filmList").hide();
            filmListShown = false;
            clearResults(); 
            location.reload(); // Reload the page after clearing
        });
    });

    function clearResults() {
        // Make an AJAX request to clear the results from the servlet
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "FilterServlet", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status !== 200) {
                    console.log("Error occurred:", xhr.statusText);
                }
            }
        };

        xhr.send("clearResults=true");
    }

</script>

</head>
<body>
    <h2>Recommendation Page</h2>
    <h3>Filter Film By...</h3>
    <form action="FilterServlet" method="post">
        <label><input type="radio" name="filter" value="genre">Genre</label>
        <label><input type="radio" name="filter" value="actors">Actors</label>
        <label><input type="radio" name="filter" value="directors">Directors</label>
        <label><input type="radio" name="filter" value="length">Movie Length</label>
        <label><input type="radio" name="filter" value="rating">Ratings</label>
        <br><br>
        
        <div id="genreDropdown" class="dropdown" style="display: none;">
            <label for="genreSelect">Select Genre:</label>
            <select id="genreSelect" name="genreSelect">
                <%List<String> genres = MovieDao.getAllGenres(); 
                for (String genre : genres) { %>
                <option value="<%= genre %>"><%= genre %></option>
                <% } %>
            </select>
       </div>
       <div id="actorsDropdown" class="dropdown" style="display: none;">
		    <label for="actorSelect">Select Actor:</label>
		    <select id="actorSelect" name="actorSelect">
		        <%List<String> actors = MovieDao.getAllActors(); 
		        for (String actor : actors) { %>
		        <option value="<%= actor %>"><%= actor %></option>
		        <% } %>
		    </select>
		</div>
		<div id="directorsDropdown" class="dropdown" style="display: none;">
		    <label for="directorSelect">Select Director:</label>
		    <select id="directorSelect" name="directorSelect">
		        <% List<String> directors = MovieDao.getAllDirectors(); 
		        for (String director : directors) { %>
		        <option value="<%= director %>"><%= director %></option>
		        <% } %>
		    </select>
		</div>
        <div id="lengthDropdown" class="dropdown" style="display: none;">
	       <label for="lengthSelect">Select Movie Length:</label>
		   <select id="lengthSelect" name="lengthSelect">
		        <%
		        List<Integer> lengths = MovieDao.getAllLengths(); 
		        for (Integer length : lengths) { %>
		        <option value="<%= length %>"><%= length %> minutes</option>
		        <% } %>
	    	</select>
		</div>
		<div id="ratingDropdown" class="dropdown" style="display: none;">
	       <label for="ratingSelect">Select Rating:</label>
		   <select id="ratingSelect" name="ratingSelect">
		        <%
		        List<Integer> ratings = MovieDao.getAllRatings(); 
		        for (Integer rating : ratings) { %>
		        <option value="<%= rating %>"><%= rating %> stars</option>
		        <% } %>
	    	</select>
		</div>
		<br>
        <input type="submit" id="showFilmsButton" value="Show Films">
    </form>
    <br>
	<table border="2" width="100%">
	    <tr>
	        <th>Results</th>
	    </tr>
	        <% for (MovieList s : search) { %>
	            <tr>
	                <td><%= s.getTitle() %></td>            
	            </tr>
	        <% } %>
	    </tbody>
	</table>
    <br>
    <button id="resetFilterButton">Reset Filter</button>
    <br>
    <br>
    <h2>Checkout What Films are Playing in Your Area <a href="theater.jsp">Here</a></h2>
    <a href="movie.jsp">Go Back to Watchlist</a>
</body>
</html>
