package vo;

public class Movie_CharInfo {
	private int charNum;
	private String charName;
	private String charOrgFileName;
	private String charSavFileName;

	public Movie_CharInfo() {
	}

	public Movie_CharInfo(int charNum, String charName, String charOrgFileName, String charSavFileName) {
		super();
		this.charNum = charNum;
		this.charName = charName;
		this.charOrgFileName = charOrgFileName;
		this.charSavFileName = charSavFileName;
	}

	public int getCharNum() {
		return charNum;
	}

	public void setCharNum(int charNum) {
		this.charNum = charNum;
	}

	public String getCharName() {
		return charName;
	}

	public void setCharName(String charName) {
		this.charName = charName;
	}

	public String getCharOrgFileName() {
		return charOrgFileName;
	}

	public void setCharOrgFileName(String charOrgFileName) {
		this.charOrgFileName = charOrgFileName;
	}

	public String getCharSavFileName() {
		return charSavFileName;
	}

	public void setCharSavFileName(String charSavFileName) {
		this.charSavFileName = charSavFileName;
	}

}
