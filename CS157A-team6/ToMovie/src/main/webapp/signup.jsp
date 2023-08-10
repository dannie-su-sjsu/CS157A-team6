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
      h2
      {
         font-size: 50px;
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
		<title>Sign up</title>
	</head>
	<body>
   <div>
            <center>
                <h1>
                <%
                    String profile = request.getParameter("profile");
                    String zip = request.getParameter("zip");
                    String db = "jdbc:mysql://localhost:3306/cs157aprojectteam6?autoReconnect=true&useSSL=false";
                    String user = "root";
                    String password = "Halo4mlg!";
                    boolean success = false;

                    if (request.getParameter("signup") != null && profile != null && !profile.isEmpty() && zip != null && !zip.isEmpty()) {
                        try {
                            Connection con = DriverManager.getConnection(db, user, password);
                            String query = "INSERT INTO `cs157aprojectteam6`.`Users` (profileName, zip) VALUES (?, ?)";
                            try (PreparedStatement pstmt = con.prepareStatement(query)) {
                                pstmt.setString(1, profile);
                                pstmt.setString(2, zip);
                                int rowsAffected = pstmt.executeUpdate();
                                if (rowsAffected > 0) {
                                    success = true;
                                }
                            } catch (SQLException e) {
                                out.println("PreparedStatement error: " + e.getMessage());
                            }
                            con.close();
                        } catch (SQLException e) {
                            out.println("Connection error: " + e.getMessage());
                        }
                    } else if (request.getParameter("signup") != null) {
                        out.println("Invalid input. Please provide valid values for profile and zip.");
                    }
                %>
                </h1><br>
                <form method="post">
                    Profile Name: <input type="text" name="profile"><br>
                    Zip: <input type="text" name="zip"><br>
                    <input type="submit" name="signup" value="Sign Up">
                </form>
                <%
                    if (success) {
                %>
                    Registered<br><br>
                    <a href="login.html">Login</a><br><br>
                <%
                    } else if (request.getParameter("signup") != null && (profile == null || profile.isEmpty())) {
                %>
                    <a href="login.html">Login</a><br><br>
                <%
                    }
                %>
                <button onclick="window.location.href='homepage.html'">Back to Homepage</button>
            </center>
            </center>
        </div>
	</body>
</html>