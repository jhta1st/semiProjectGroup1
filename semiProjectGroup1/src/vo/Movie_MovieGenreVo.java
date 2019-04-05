package vo;

public class Movie_MovieGenreVo {
	private int genreNum;
	private int movieNum;

	public Movie_MovieGenreVo() {
	}

	public Movie_MovieGenreVo(int genreNum, int movieNum) {
		super();
		this.genreNum = genreNum;
		this.movieNum = movieNum;
	}

	public int getGenreNum() {
		return genreNum;
	}

	public void setGenreNum(int genreNum) {
		this.genreNum = genreNum;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

}
