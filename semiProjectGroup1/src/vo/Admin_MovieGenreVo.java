package vo;

public class Admin_MovieGenreVo {
	private int genreNum;
	private int movieNum;
	public Admin_MovieGenreVo() {}
	public Admin_MovieGenreVo(int genreNum, int movieNum) {
		super();
		this.genreNum = genreNum;
		this.movieNum = movieNum;
	}
	public int getGenreNum() {
		return genreNum;
	}
	public int getMovieNum() {
		return movieNum;
	}
	public void setGenreNum(int genreNum) {
		this.genreNum = genreNum;
	}
	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}
	
}
