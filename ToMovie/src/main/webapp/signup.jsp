<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>Sign up</title>
	</head>
	<body>
	<%
		String profile = request.getParameter("profile");
		String zip = request.getParameter("zip");
		String db = "ToMovie";
    	String user; // assumes database name is the same as username
          user = "root";
        String password = "password"; //Change password if needed

        try
        {  
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ToMovie?autoReconnect=true&useSSL=false",user, password);
            //out.println(db + " database successfully opened.<br/><br/>");
            
            //out.println("Initial entries in table \"Student\": <br/>");
            Statement stmt = con.createStatement();
            int rs = stmt.executeUpdate("INSERT into User (profileName, zip) VALUES ('" + profile + "'," + zip + ")");

            out.println("Registered");

            stmt.close();
            con.close();
        } 
        catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
	%>
	<br>
	<a href = "search.html">Search</a><br><br>
	<a href = "watchlist.html">Watch List</a><br>
	</body>
</html>