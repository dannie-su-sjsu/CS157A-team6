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
						("SELECT Movie.title, Movie.year, Movie.genre,Movie.length, Directed.DirectorName, Starred.ActorName\n"
								+ "FROM `cs157aprojectteam6`.`Movie`\n"
								+ "JOIN `cs157aprojectteam6`.`Directed`ON Movie.title = Directed.title\n"
								+ "JOIN `cs157aprojectteam6`.`Starred`ON Movie.title = Starred.title\n"
								+ "");
				ResultSet rs = c2.executeQuery();
				while(rs.next()) {
					MovieList c = new MovieList();
					c.setTitle(rs.getString(1));
					c.setYear(rs.getInt(2));
					c.setGenre(rs.getString(3));
					c.setLengthMovie(rs.getInt(4));
					c.setDirectorName(rs.getString(5));
					c.setActorName(rs.getString(6));
					catalog.add(c);
				}
				con2.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return catalog;
		}
}