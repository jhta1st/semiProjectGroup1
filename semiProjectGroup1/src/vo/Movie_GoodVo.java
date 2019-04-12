package vo;

import java.sql.Date;

public class Movie_GoodVo {
	private String userId;
	private int movienum;
	private Date movieReleaseDate;
	private int rate;
	private int genreNum;

	public Movie_GoodVo() {}

	public Movie_GoodVo(String userId, int movienum, Date movieReleaseDate, int rate, int genreNum) {
		super();
		this.userId = userId;
		this.movienum = movienum;
		this.movieReleaseDate = movieReleaseDate;
		this.rate = rate;
		this.genreNum = genreNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getMovienum() {
		return movienum;
	}

	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}

	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}

	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public int getGenreNum() {
		return genreNum;
	}

	public void setGenreNum(int genreNum) {
		this.genreNum = genreNum;
	}
	
}