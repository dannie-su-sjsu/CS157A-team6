package toMovie;
import java.sql.*;
import java.util.*;

@SuppressWarnings("unused")
public class MovieDao {
	//connection to database
	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157aprojectteam6","root","Halo4mlg!");	
		}catch(SQLException | ClassNotFoundException e) {
		e.printStackTrace();
		}
		return con;
	}
	
	//Method gets Watchlist
	public static List<MovieList>getWatchlist(){
		List<MovieList> list = new ArrayList<MovieList>();
		try {
			Connection con = MovieDao.getConnection();
			PreparedStatement ar = con.prepareStatement("SELECT * FROM `cs157aprojectteam6`.`WatchList`");
			ResultSet rs = ar.executeQuery();
			while(rs.next()) {
				MovieList w = new MovieList();
				w.setListID(rs.getInt(1));
				w.setTitle(rs.getString(2));
				w.setStatus(rs.getString(3));
				list.add(w);
			}
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//Method gets Movie Information
	public static List<MovieList>getCatalog(){
		List<MovieList> catalog = new ArrayList<MovieList>();
		try {
			Connection con2 = MovieDao.getConnection();
			PreparedStatement c2 = con2.prepareStatement
					("SELECT Movie.title, Movie.year, Movie.genre,Movie.length, Directed.DirectorName, Starred.ActorName, MovieDetail.rating\n"
								+ "FROM `cs157aprojectteam6`.`Movie`\n"
								+ "JOIN `cs157aprojectteam6`.`Directed`ON Movie.title = Directed.title\n"
								+ "JOIN `cs157aprojectteam6`.`Starred`ON Movie.title = Starred.title\n"
								+ "JOIN `cs157aprojectteam6`.`MovieDetail` ON Movie.MovieID = MovieDetail.MovieID");
			ResultSet rs = c2.executeQuery();
			while(rs.next()) {
				MovieList c = new MovieList();
				c.setTitle(rs.getString(1));
				c.setYear(rs.getInt(2));
				c.setGenre(rs.getString(3));
				c.setLengthMovie(rs.getInt(4));
				c.setDirectorName(rs.getString(5));
				c.setActorName(rs.getString(6));
				c.setRating(rs.getInt(7));
				catalog.add(c);
			}
			con2.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return catalog;
	}
		
	//Method adds film into Watchlist
	public static int insertFilm(MovieList w) {
		int entry = 0;
	    try {
	        Connection con = MovieDao.getConnection();
	        PreparedStatement ps = con.prepareStatement("INSERT INTO `cs157aprojectteam6`.`WatchList` (movieID, title, status) VALUES (?, ?, ?)");
	        ps.setInt(1, w.getMovieID()); // Set the movieID
	        ps.setString(2, w.getTitle());
	        ps.setString(3, w.getStatus());
	        entry = ps.executeUpdate();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return entry;
	}
	
	//Method removes film into Watchlist
	public static int removeFilm(String title) {
		int entry = 0;
		try {
			Connection con = MovieDao.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM`cs157aprojectteam6`.`WatchList` WHERE title = ?");
			ps.setString(1, title); 
	        entry = ps.executeUpdate();
	        con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return entry;
	}
	
	//Method gets film details by title
	public static MovieList getFilmDetailByTitle(String title) {
	    MovieList movieDetail = null;
	    try {
	        Connection con = MovieDao.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM `cs157aprojectteam6`.`MovieDetail` WHERE title = ?");
	        ps.setString(1, title);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            movieDetail = new MovieList();
	            movieDetail.setMovieID(rs.getInt("ID"));
	            movieDetail.setTitle(rs.getString("title"));
	            movieDetail.setDescription(rs.getString("description"));
	            movieDetail.setRating(rs.getInt("rating")); 
	            movieDetail.setComment(rs.getString("comment"));
	        }

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return movieDetail;
	}
	
	//Method gets movie title by MovieID
	public static String getMovieTitleByID(int movieID) {
		 String title = null;
		    try {
		        Connection con = MovieDao.getConnection();
		        PreparedStatement ps = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`MovieDetail` WHERE MovieID = ?");
		        ps.setInt(1, movieID);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            title = rs.getString("title");
		        }
		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return title;
	}
	
	//Method gets film detail by movieID
	public static MovieList getFilmDetailByMovieID(int movieID) {
	    MovieList movieDetail = null;
	    try {
	        Connection con = MovieDao.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM `cs157aprojectteam6`.`MovieDetail` WHERE movieID = ?");
	        ps.setInt(1, movieID);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            movieDetail = new MovieList();
	            movieDetail.setMovieID(rs.getInt("movieID"));
	            movieDetail.setTitle(rs.getString("title"));
	            movieDetail.setDescription(rs.getString("description"));
	            movieDetail.setRating(rs.getInt("rating"));
	            movieDetail.setComment(rs.getString("comment"));
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return movieDetail;
	}
	
	//Method gets movie by title
	public static MovieList getMovieByTitle(String title) {
        MovieList movieDetail = null;
        ResultSet rs = null;
        try {
		        Connection con = MovieDao.getConnection();
		        PreparedStatement ps = con.prepareStatement("SELECT * FROM `cs157aprojectteam6`.`MovieDetail` WHERE title = ?");
	            ps.setString(1, title);
	            rs = ps.executeQuery();
	            if (rs.next()) {
	                int movieID = rs.getInt("movieID");
	                String description = rs.getString("description");
	                int rating = rs.getInt("rating");
	                String comment = rs.getString("comment");
	                movieDetail = new MovieList(movieID, title, description, rating, comment);
	        }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return movieDetail;
    }
	
	//Method updates movie rating
	public static void updateMovieRating(int movieID, int rating) {
	    try {
	        Connection con = MovieDao.getConnection();
	        PreparedStatement pstmtUpdate = con.prepareStatement("UPDATE `cs157aprojectteam6`.`MovieDetail` SET rating=? WHERE movieID=?");
	        pstmtUpdate.setInt(1, rating); 
	        pstmtUpdate.setInt(2, movieID); 
	        pstmtUpdate.executeUpdate();
	        pstmtUpdate.close();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	//Method saves movie comment
	public static void saveMovieComment(int movieID, String comment) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement("UPDATE `cs157aprojectteam6`.`MovieDetail` SET comment=? WHERE movieID=?");
            pstmt.setString(1, comment);
            pstmt.setInt(2, movieID);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	//Method gets all genres in Movie table
	public static List<String> getAllGenres() {
        List<String> genres = new ArrayList<>();
        try (Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT genre FROM `cs157aprojectteam6`.`Movie`")) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                genres.add(rs.getString("genre"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
	
	//Method gets all actors in the Starred table
	public static List<String> getAllActors() {
	    List<String> actors = new ArrayList<>();
	    try (Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT ActorName FROM `cs157aprojectteam6`.`Starred`")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            actors.add(rs.getString("ActorName"));  
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return actors;
	}
	
	//Method gets all directors in the directed table
	public static List<String> getAllDirectors() {
	    List<String> directors = new ArrayList<>();
	    try (Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT DirectorName FROM `cs157aprojectteam6`.`directed`")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            directors.add(rs.getString("DirectorName"));  
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return directors;
	}
	
	//Method gets all lengths of the films in the Movie table
	public static List<Integer> getAllLengths() {
	    List<Integer> lengths = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT length FROM `cs157aprojectteam6`.`Movie` ORDER BY length ASC")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            lengths.add(rs.getInt("length"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return lengths;
	}
	
	//Method gets all ratings in the MovieDetail table
	public static List<Integer> getAllRatings() {
	    List<Integer> ratings = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT rating FROM `cs157aprojectteam6`.`MovieDetail` ORDER BY rating DESC")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            ratings.add(rs.getInt("rating"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ratings;
	}
	
	//Method gets all zip codes in the Theater table
	public static List<Integer> getAllZips() {
	    List<Integer> zips = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT zip FROM `cs157aprojectteam6`.`Theater` ORDER BY zip ASC")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            zips.add(rs.getInt("zip"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return zips;
	}
	
	//Method gets the theater detemined by zip 
	public static List<String> getTheaterByZip(String zip) {
	    List<String> theaters = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT TheaterName FROM `cs157aprojectteam6`.`Theater` WHERE zip =? ")) {
	    	 pstmt.setString(1,zip);
	    	ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            theaters.add(rs.getString("TheaterName"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return theaters;
	}
	
	//Method gets the film that matches the genre
	public static List<String> getFilmsByGenre(String genre) {
	    List<String> filmTitles = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`Movie` WHERE genre = ?")) {
	        pstmt.setString(1, genre);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            filmTitles.add(rs.getString("title"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return filmTitles;
	}
	
	//Method gets the film that matches the actor
	public static List<String> getFilmsByActors(String ActorName) {
	    List<String> filmTitles = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`Starred` WHERE ActorName = ?")) {
	        pstmt.setString(1, ActorName);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            filmTitles.add(rs.getString("title"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return filmTitles;
	}
	
	//Method gets the film that matches the director
	public static List<String> getFilmsByDirectors(String DirectorName) {
	    List<String> filmTitles = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`directed` WHERE DirectorName = ?")) {
	        pstmt.setString(1, DirectorName);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            filmTitles.add(rs.getString("title"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return filmTitles;
	}
	
	//Method gets the film that matches the length runtime
	public static List<String> getFilmsByLength(String length) {
	    List<String> filmTitles = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`Movie` WHERE length = ?")) {
	        pstmt.setString(1, length);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            filmTitles.add(rs.getString("title"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return filmTitles;
	}
	
	//Method gets the film that matches the rating made by the user
	public static List<String> getFilmsByRatings(String rating) {
	    List<String> filmTitles = new ArrayList<>();
	    try (Connection con = getConnection();
	         PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`MovieDetail` WHERE rating = ?")) {
	        pstmt.setString(1, rating);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            filmTitles.add(rs.getString("title"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return filmTitles;
	}
	
	//Method inserts the films into the SearchRecommendations table
	public static void insertSearchRecommendations(List<String> filmTitles) {
	    try (Connection con = getConnection()) {
	        for (String title : filmTitles) {
	            PreparedStatement pstmt = con.prepareStatement("INSERT INTO SearchRecommendations (title) VALUES (?)");
	            pstmt.setString(1, title);
	            pstmt.executeUpdate();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	//Method gets the films from the SearchRecommendations table
	public static List<MovieList> getSearchRecommendations() {
	    List<MovieList> list = new ArrayList<>();
	    try (
	    	Connection con = getConnection();
	        PreparedStatement pstmt = con.prepareStatement("SELECT title FROM `cs157aprojectteam6`.`SearchRecommendations`")) {
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	        	MovieList w = new MovieList();
				w.setTitle(rs.getString(1));
				list.add(w);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	//Method clearss the films from the SearchRecommendations table
	public static void clearSearchRecommendations() {
	    try (Connection con = getConnection()) {
	        PreparedStatement pstmt = con.prepareStatement("DELETE FROM `cs157aprojectteam6`.`SearchRecommendations`");
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

}
