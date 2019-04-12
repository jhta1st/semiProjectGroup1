package vo;

public class Movie_favTableVo {
	private String userId;
	private int movieNum;
	public Movie_favTableVo() {}
	public Movie_favTableVo(String userId, int movieNum) {
		super();
		this.userId = userId;
		this.movieNum = movieNum;
	}
	public String getUserId() {
		return userId;
	}
	public int getMovieNum() {
		return movieNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}
	
}
