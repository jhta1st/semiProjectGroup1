package vo;

public class Movie_ReviewImageVo {
	private int imageNum;
	private int imageType;
	private String imageOrgName;
	private String imageSavName;
	private int movieNum;

	public Movie_ReviewImageVo() {
	}

	public Movie_ReviewImageVo(int imageNum, int imageType, String imageOrgName, String imageSavName, int movieNum) {
		super();
		this.imageNum = imageNum;
		this.imageType = imageType;
		this.imageOrgName = imageOrgName;
		this.imageSavName = imageSavName;
		this.movieNum = movieNum;
	}

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public int getImageType() {
		return imageType;
	}

	public void setImageType(int imageType) {
		this.imageType = imageType;
	}

	public String getImageOrgName() {
		return imageOrgName;
	}

	public void setImageOrgName(String imageOrgName) {
		this.imageOrgName = imageOrgName;
	}

	public String getImageSavName() {
		return imageSavName;
	}

	public void setImageSavName(String imageSavName) {
		this.imageSavName = imageSavName;
	}

	public int getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}

}
