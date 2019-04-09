package vo;

public class Admin_charInfoVo {
	private int charNum;
	private String charName;
	private String charOrgFileName;
	private String charSavFileName;
	public Admin_charInfoVo() {}
	public Admin_charInfoVo(int charNum, String charName, String charOrgFileName, String charSavFileName) {
		super();
		this.charNum = charNum;
		this.charName = charName;
		this.charOrgFileName = charOrgFileName;
		this.charSavFileName = charSavFileName;
	}
	public int getCharNum() {
		return charNum;
	}
	public String getCharName() {
		return charName;
	}
	public String getCharOrgFileName() {
		return charOrgFileName;
	}
	public String getCharSavFileName() {
		return charSavFileName;
	}
	public void setCharNum(int charNum) {
		this.charNum = charNum;
	}
	public void setCharName(String charName) {
		this.charName = charName;
	}
	public void setCharOrgFileName(String charOrgFileName) {
		this.charOrgFileName = charOrgFileName;
	}
	public void setCharSavFileName(String charSavFileName) {
		this.charSavFileName = charSavFileName;
	}
	
}
