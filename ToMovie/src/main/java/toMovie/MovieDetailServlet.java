package toMovie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MovieDetailServlet
 */
@WebServlet("/MovieDetailServlet")
public class MovieDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");

        if (title != null && !title.isEmpty()) {
            MovieList movieDetail = MovieDao.getMovieByTitle(title);
            request.setAttribute("movieDetail", movieDetail);
            request.getRequestDispatcher("movieDetail.jsp").forward(request, response);
        } else {
            response.sendRedirect("movie.jsp");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//int movieID = Integer.parseInt(request.getParameter("movieID"));
        //int rating = Integer.parseInt(request.getParameter("rating"));
        //MovieDao.updateMovieRating(movieID, rating);

    	 String action = request.getParameter("action");

         if ("rating".equals(action)) {
             int movieID = Integer.parseInt(request.getParameter("movieID"));
             int rating = Integer.parseInt(request.getParameter("rating"));
             MovieDao.updateMovieRating(movieID, rating);
         } 
         else if ("comment".equals(action)) {
             int movieID = Integer.parseInt(request.getParameter("movieID"));
             String comment = request.getParameter("comment");
             MovieDao.saveMovieComment(movieID, comment);
         }
         doGet(request, response);
    }
}
