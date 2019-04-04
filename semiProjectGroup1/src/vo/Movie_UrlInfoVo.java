package vo;

public class Movie_UrlInfoVo {
	private int urlNum;
	private int urlType;
	private String urlAddr;
	private int movieNum;

	public Movie_UrlInfoVo() {
	}

	public Movie_UrlInfoVo(int urlNum, int urlType, String urlAddr, int movieNum) {
		super();
		this.urlNum = urlNum;
		this.urlType = urlType;
		this.urlAddr = urlAddr;
		this.movieNum = movieNum;
	}

	public int getUrlNum() {
		return urlNum;
	}

	public void setUrlNum(int urlNum) {
		this.urlNum = urlNum;
	}

	public int getUrlType() {
		return urlType;
	}

	public void setUrlType(int urlType) {
		this.urlType = urlType;
	}

	public String getUrlAddr() {
		return urlAddr;
	}

	public void setUrlAddr(String urlAddr) {
		this.urlAddr = urlAddr;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

}
