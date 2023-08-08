package toMovie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FilterServlet
 */
@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FilterServlet() {
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
	    String filterOption = request.getParameter("filter");
	    MovieDao.clearSearchRecommendations();

	    if ("genre".equals(filterOption)) {
	        String selectedGenre = request.getParameter("genreSelect");
	        List<String> filmTitles = MovieDao.getFilmsByGenre(selectedGenre);
	        MovieDao.insertSearchRecommendations(filmTitles);
	        request.setAttribute("filmTitles", filmTitles);
	        
	    } else if ("actors".equals(filterOption)) {
	        String selectedActor = request.getParameter("actorSelect");
	        List<String> filmTitles = MovieDao.getFilmsByActors(selectedActor);
	        MovieDao.insertSearchRecommendations(filmTitles);
	        request.setAttribute("filterData", filmTitles);
	        
	    } else if ("directors".equals(filterOption)) {
	    	String selectedDirector = request.getParameter("directorSelect");
	        List<String> filmTitles = MovieDao.getFilmsByDirectors(selectedDirector);
	        MovieDao.insertSearchRecommendations(filmTitles);
	        request.setAttribute("filterData", filmTitles);
	        
	    } else if ("length".equals(filterOption)) {
	    	String selectedLength = request.getParameter("lengthSelect");
	        List<String> filmTitles = MovieDao.getFilmsByLength(selectedLength);
	        MovieDao.insertSearchRecommendations(filmTitles);
	        request.setAttribute("filterData", filmTitles);
	        
	    } else if ("rating".equals(filterOption)) {
	    	String selectedRating = request.getParameter("ratingSelect");
	        List<String> filmTitles = MovieDao.getFilmsByRatings(selectedRating);
	        MovieDao.insertSearchRecommendations(filmTitles);
	        request.setAttribute("filmTitles", filmTitles);
	    }

	    request.setAttribute("selectedFilter", filterOption);
	    request.getRequestDispatcher("recommendation.jsp").forward(request, response);
	}
}
