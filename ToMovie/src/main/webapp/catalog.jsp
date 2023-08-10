<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="toMovie.MovieDao" %>
<%@ page import="toMovie.MovieList" %>
<% List <MovieList> catalog = MovieDao.getCatalog(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style><%@include file="/WEB-INF/css/style.css"%></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        function sortTable(n) {
            var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
            table = document.getElementById("filmCatalogTable");
            switching = true;
            // Set the sorting direction to ascending
            dir = "asc";
            while (switching) {
                switching = false;
                rows = table.rows;
                for (i = 1; i < (rows.length - 1); i++) {
                    shouldSwitch = false;
                    x = rows[i].getElementsByTagName("TD")[n];
                    y = rows[i + 1].getElementsByTagName("TD")[n];
                    if (dir === "asc") {
                        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir === "desc") {
                        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                if (shouldSwitch) {
                    rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                    switching = true;
                    switchcount++;
                } else {
                    if (switchcount === 0 && dir === "asc") {
                        dir = "desc";
                        switching = true;
                    }
                }
            }
            // Remove highlighting from all columns
            var headers = table.getElementsByTagName("TH");
            for (i = 0; i < headers.length; i++) {
                headers[i].classList.remove("highlight");
            }
            // Add highlighting to the sorted column header
            headers[n].classList.add("highlight");
        }

        // Attach click event to each header for sorting
        var headers = document.querySelectorAll("#filmCatalogTable th");
        for (var i = 0; i < headers.length; i++) {
            headers[i].addEventListener("click", function() {
                var index = $(this).index();
                sortTable(index);
            });
        }
    });
</script>
<title>ToMovie Film Catalog</title>
<header><h1>ToMovie</h1></header>
</head>
<body>
    <!-- Displaying Full Film Catalog -->
    <h2>Detailed Film Catalog</h2>
    <table id="filmCatalogTable" border="2" width="100%">
        <tr>
            <th>Film Title</th>
            <th>Year</th>
            <th>Genre</th>
            <th>Length (Mins)</th>
            <th>Director</th>
            <th>Main Actor</th>
            <th>Ratings</th>
        </tr>
        <% for (MovieList c : catalog) { %>
            <tr>
                <td><%= c.getTitle() %></td>
                <td><%= c.getYear() %></td>
                <td><%= c.getGenre() %></td>
                <td><%= c.getLengthMovie() %></td>
                <td><%= c.getDirectorName() %></td>
                <td><%= c.getActorName() %></td>
                <td><%= c.getRating() %></td>
            </tr>
        <% } %>
    </table>
    <h3><a href="movie.jsp">Click Here to Return to your Watchlist</h3>
</body>
</html>
