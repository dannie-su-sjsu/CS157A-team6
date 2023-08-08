package toMovie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TheaterServlet
 */
@WebServlet("/TheaterServlet")
public class TheaterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TheaterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String selectedZip = request.getParameter("zipSelect");

	        // Call the DAO method to get theaters by the selected zip
	        List<String> theaters = MovieDao.getTheaterByZip(selectedZip);

	        // Pass theaters data to JSP or perform other actions
	        request.setAttribute("theaters", theaters);
	        request.getRequestDispatcher("theater.jsp").forward(request, response);

}}
