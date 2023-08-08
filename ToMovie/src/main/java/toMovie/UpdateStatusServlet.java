package toMovie;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateStatusServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 String title = request.getParameter("title");
         String newStatus = request.getParameter("status");

         if (title != null && !title.isEmpty() && newStatus != null && !newStatus.isEmpty()) {
             try {
                 Class.forName("com.mysql.cj.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6", "root",
                         "Halo4mlg!");
                 PreparedStatement ps = con.prepareStatement("UPDATE WatchList SET status=? WHERE title=?");
                 ps.setString(1, newStatus);
                 ps.setString(2, title);
                 ps.executeUpdate();
                 ps.close();
                 con.close();
             } catch (ClassNotFoundException | SQLException e) {
                 e.printStackTrace();
             }
         }
         response.sendRedirect("movie.jsp");
     }
}

