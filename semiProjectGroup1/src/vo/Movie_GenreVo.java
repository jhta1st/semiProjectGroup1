package vo;

public class Movie_GenreVo {
	private int genreNum;
	private String genreName;

	public Movie_GenreVo() {
	}

	public Movie_GenreVo(int genreNum, String genreName) {
		super();
		this.genreNum = genreNum;
		this.genreName = genreName;
	}

	public int getGenreNum() {
		return genreNum;
	}

	public void setGenreNum(int genreNum) {
		this.genreNum = genreNum;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

}
