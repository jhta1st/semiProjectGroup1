package vo;

import java.sql.Date;

public class FreeBoard_FreeBoardVo {
	private int freeBoardNum;
	private String freeBoardTitle;
	private String freeBoardContent;
	private Date freeBoardWdate;
	private String userId;
	public FreeBoard_FreeBoardVo(){}
	public FreeBoard_FreeBoardVo(int freeBoardNum, String freeBoardTitle, String freeBoardContent, Date freeBoardWdate,
			String userId) {
		super();
		this.freeBoardNum = freeBoardNum;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardContent = freeBoardContent;
		this.freeBoardWdate = freeBoardWdate;
		this.userId = userId;
	}
	public int getFreeBoardNum() {
		return freeBoardNum;
	}
	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}
	public String getFreeBoardContent() {
		return freeBoardContent;
	}
	public Date getFreeBoardWdate() {
		return freeBoardWdate;
	}
	public String getUserId() {
		return userId;
	}
	public void setFreeBoardNum(int freeBoardNum) {
		this.freeBoardNum = freeBoardNum;
	}
	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}
	public void setFreeBoardContent(String freeBoardContent) {
		this.freeBoardContent = freeBoardContent;
	}
	public void setFreeBoardWdate(Date freeBoardWdate) {
		this.freeBoardWdate = freeBoardWdate;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
