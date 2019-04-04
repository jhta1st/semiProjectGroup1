package vo;

public class Movie_RateTableVo {
	private double rate;
	private String rateComm;
	private String UserId;
	private int movieNum;

	public Movie_RateTableVo() {
	}

	public Movie_RateTableVo(double rate, String rateComm, String userId, int movieNum) {
		super();
		this.rate = rate;
		this.rateComm = rateComm;
		UserId = userId;
		this.movieNum = movieNum;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getRateComm() {
		return rateComm;
	}

	public void setRateComm(String rateComm) {
		this.rateComm = rateComm;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

}
