package toMovie;

import java.io.IOException;
import java.io.PrintWriter;  

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

	    // Adding film to watchlist, communicating with addFilm.jsp
	    int movieID = Integer.parseInt(request.getParameter("movieID")); // Fetch selected movieID
	    String status = request.getParameter("status");

	    // Fetch the movie title using the MovieID
	    String title = MovieDao.getMovieTitleByID(movieID);

	    MovieList w = new MovieList();
	    w.setMovieID(movieID);
	    w.setTitle(title);
	    w.setStatus(status);

	    int entry = MovieDao.insertFilm(w);
	    if (entry > 0) {
	        out.print("<p>Movie added to your ToMovie Watchlist!");
	        request.getRequestDispatcher("addFilm.jsp").include(request, response);
	    } else {
	        out.println("Unable to add film to the database :(");
	    }
	    out.close();
	}
}