package vo;

public class FreeBoard_FreeBoardImageVo {
	private int freeBoardImgNum;
	private String freeBoardOrgImgName;
	private String freeBoardSavImgName;
	private int freeBoardNum;
	public FreeBoard_FreeBoardImageVo(){}
	public FreeBoard_FreeBoardImageVo(int freeBoardImgNum, String freeBoardOrgImgName, String freeBoardSavImgName,
			int freeBoardNum) {
		super();
		this.freeBoardImgNum = freeBoardImgNum;
		this.freeBoardOrgImgName = freeBoardOrgImgName;
		this.freeBoardSavImgName = freeBoardSavImgName;
		this.freeBoardNum = freeBoardNum;
	}
	public int getFreeBoardImgNum() {
		return freeBoardImgNum;
	}
	public String getFreeBoardOrgImgName() {
		return freeBoardOrgImgName;
	}
	public String getFreeBoardSavImgName() {
		return freeBoardSavImgName;
	}
	public int getFreeBoardNum() {
		return freeBoardNum;
	}
	public void setFreeBoardImgNum(int freeBoardImgNum) {
		this.freeBoardImgNum = freeBoardImgNum;
	}
	public void setFreeBoardOrgImgName(String freeBoardOrgImgName) {
		this.freeBoardOrgImgName = freeBoardOrgImgName;
	}
	public void setFreeBoardSavImgName(String freeBoardSavImgName) {
		this.freeBoardSavImgName = freeBoardSavImgName;
	}
	public void setFreeBoardNum(int freeBoardNum) {
		this.freeBoardNum = freeBoardNum;
	}
	
}
