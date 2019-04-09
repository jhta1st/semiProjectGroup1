package vo;

public class Admin_MovieInfoVo {
	private int movieNum;
	private String movieName;
	private String movieIntro;
	private String movieReleaseDate;
	private int movieRunTime;
	private String movieProduction;
	private String movieDistributer;
	private String nation;
	private int movieAge;
	public Admin_MovieInfoVo() {}
	public Admin_MovieInfoVo(int movieNum, String movieName, String movieIntro, String movieReleaseDate,
			int movieRunTime, String movieProduction, String movieDistributer, String nation, int movieAge) {
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
	public String getMovieName() {
		return movieName;
	}
	public String getMovieIntro() {
		return movieIntro;
	}
	public String getMovieReleaseDate() {
		return movieReleaseDate;
	}
	public int getMovieRunTime() {
		return movieRunTime;
	}
	public String getMovieProduction() {
		return movieProduction;
	}
	public String getMovieDistributer() {
		return movieDistributer;
	}
	public String getNation() {
		return nation;
	}
	public int getMovieAge() {
		return movieAge;
	}
	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public void setMovieIntro(String movieIntro) {
		this.movieIntro = movieIntro;
	}
	public void setMovieReleaseDate(String movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}
	public void setMovieRunTime(int movieRunTime) {
		this.movieRunTime = movieRunTime;
	}
	public void setMovieProduction(String movieProduction) {
		this.movieProduction = movieProduction;
	}
	public void setMovieDistributer(String movieDistributer) {
		this.movieDistributer = movieDistributer;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public void setMovieAge(int movieAge) {
		this.movieAge = movieAge;
	}
	
}
