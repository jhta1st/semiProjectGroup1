package vo;

public class Movie_CastInfoVo {
	private int castNum;
	private int charNum;
	private int castDoNum;
	private String castDoName;
	private int movieNum;

	public Movie_CastInfoVo() {
	}

	public Movie_CastInfoVo(int castNum, int charNum, int castDoNum, String castDoName, int movieNum) {
		super();
		this.castNum = castNum;
		this.charNum = charNum;
		this.castDoNum = castDoNum;
		this.castDoName = castDoName;
		this.movieNum = movieNum;
	}

	public int getCastNum() {
		return castNum;
	}

	public void setCastNum(int castNum) {
		this.castNum = castNum;
	}

	public int getCharNum() {
		return charNum;
	}

	public void setCharNum(int charNum) {
		this.charNum = charNum;
	}

	public int getCastDoNum() {
		return castDoNum;
	}

	public void setCastDoNum(int castDoNum) {
		this.castDoNum = castDoNum;
	}

	public String getCastDoName() {
		return castDoName;
	}

	public void setCastDoName(String castDoName) {
		this.castDoName = castDoName;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

}
