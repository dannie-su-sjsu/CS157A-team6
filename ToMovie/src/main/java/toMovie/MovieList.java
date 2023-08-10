package toMovie;
import java.io.*;

public class MovieList implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int movieID;
	private String title;
	private int year;
	private int listID;
	private String status;
	private int lengthMovie;
	private String genre;
	private int actorID;
	private String actorName;
	private int yearBorn;
	private String directorName;
	private String description;
	private String comment;
	private int rating;
	private int searchID;
	private String TheaterName;
	private int zip;
	
	
	public MovieList() {
		super();
	}

	public MovieList(int movieID, String title, int year, int lengthMovie, String genre) {
		super();
		this.movieID = movieID;
		this.title = title;
		this.year = year;
		this.lengthMovie = lengthMovie;
		this.genre = genre;
	}
	public MovieList(int listID, String title, String status) {
		super();
		this.listID = listID;
		this.title = title;
		this.status = status;
	}
	public MovieList(int actorID, String actorName, int yearBorn) {
		super();
		this.actorID = actorID;
		this.actorName = actorName;
		this.yearBorn = yearBorn;
	}
	
	public MovieList(int movieID, String title, String description, int rating, String comment) {
		super();
		this.movieID = movieID;
		this.title = title;
		this.description = description;
		this.rating = rating;
		this.comment = comment;
	}
	public MovieList(String theaterName,int zip) {
		super();
		this.TheaterName = theaterName;
		this.zip = zip;
	}
	
	public MovieList(int searchID, String title) {
		super();
		this.searchID = searchID;
		this.title = title;
	}
	
	public int getMovieID() {
		return movieID;
	}
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getListID() {
		return listID;
	}
	public void setListID(int listID) {
		this.listID = listID;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getLengthMovie() {
		return lengthMovie;
	}
	public void setLengthMovie(int lengthMovie) {
		this.lengthMovie = lengthMovie;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getActorID() {
		return actorID;
	}
	public void setActorID(int actorID) {
		this.actorID = actorID;
	}
	public String getActorName() {
		return actorName;
	}
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	public int getYearBorn() {
		return yearBorn;
	}
	public void setYearBorn(int yearBorn) {
		this.yearBorn = yearBorn;
	}

	public String getDirectorName() {
		return directorName;
	}

	public void setDirectorName(String directorName) {
		this.directorName = directorName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getSearchID() {
		return searchID;
	}

	public void setSearchID(int searchID) {
		this.searchID = searchID;
	}

	public String getTheaterName() {
		return TheaterName;
	}

	public void setTheaterName(String theaterName) {
		TheaterName = theaterName;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

}