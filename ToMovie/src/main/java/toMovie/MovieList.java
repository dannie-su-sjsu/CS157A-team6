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

}