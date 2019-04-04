package vo;

import java.sql.Date;

public class Movie_MovieInfoVo {
	private int movieNum;
	private String movieName;
	private String movieIntro;
	private Date movieReleaseDate;
	private int movieRunTime;
	private String movieProduction;
	private String movieDistributer;
	private String nation;
	private int movieAge;

	public Movie_MovieInfoVo() {
	}

	public Movie_MovieInfoVo(int movieNum, String movieName, String movieIntro, Date movieReleaseDate, int movieRunTime,
			String movieProduction, String movieDistributer, String nation, int movieAge) {
		super();
		this.movieNum = movieNum;
		this.movieName = movieName;
		this.movieIntro = movieIntro;
		this.movieReleaseDate = movieReleaseDate;
		this.movieRunTime = movieRunTime;
		this.movieProduction = movieProduction;
		this.movieDistributer = movieDistributer;
		this.nation = nation;
		this.movieAge = movieAge;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieIntro() {
		return movieIntro;
	}

	public void setMovieIntro(String movieIntro) {
		this.movieIntro = movieIntro;
	}

	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}

	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}

	public int getMovieRunTime() {
		return movieRunTime;
	}

	public void setMovieRunTime(int movieRunTime) {
		this.movieRunTime = movieRunTime;
	}

	public String getMovieProduction() {
		return movieProduction;
	}

	public void setMovieProduction(String movieProduction) {
		this.movieProduction = movieProduction;
	}

	public String getMovieDistributer() {
		return movieDistributer;
	}

	public void setMovieDistributer(String movieDistributer) {
		this.movieDistributer = movieDistributer;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public int getMovieAge() {
		return movieAge;
	}

	public void setMovieAge(int movieAge) {
		this.movieAge = movieAge;
	}

}
