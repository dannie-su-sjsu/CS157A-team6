<%@ page import="java.sql.*"%>
<html>
    <style>
      div 
      {
         background-color: #fdebb5;
         border-width: 50px;
         border-style: solid;
         border-color: #ea8607;
         margin: 20px;
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
    <head>
	   <title>User Login</title>
    </head>
    <body>
        <center>
              <div>
                <h1>
                <%
                    String profile = request.getParameter("profile");
                    String zip = request.getParameter("zip");
                    String db = "cs157aprojectteam6"; // May be different
                    String user = "root";
                    String password = "Halo4mlg!"; // Change password if needed

                    try
                    {  
                        java.sql.Connection con; 
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6?autoReconnect=true&useSSL=false", user, password);
                        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM Users WHERE profileName = ?");
                        pstmt.setString(1, profile);
                        ResultSet rs = pstmt.executeQuery();
                        
                        if (rs.next()) 
                        {
                            if (rs.getString("zip").equals(zip)) {
                                out.println("Welcome " + profile);
                            } else {
                                out.println("Invalid zip code for the profile name.");
                            }
                        }
                        else
                        {
                            out.println("Invalid profile name.");
                        }
                        
                        rs.close();
                        pstmt.close();
                        con.close();
                    } 
                    catch(SQLException e) { 
                        out.println("SQLException caught: " + e.getMessage()); 
                    }
                %>
                </h1>
        	    <br>
        	    <a href="recommendation.jsp">Search for Movies</a><br><br>
        	    <a href="movie.jsp">Watch List</a><br><br>
                <a href="theater.jsp">Look for nearby Theaters</a><br><br>
            </div>
        </center>
	</body>
</html>