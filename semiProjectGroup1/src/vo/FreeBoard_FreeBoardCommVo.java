package vo;

import java.sql.Date;

public class FreeBoard_FreeBoardCommVo {
	private int freeBoardCommNum;
	private String freeBoardCommContent;
	private Date freeBoardCommWdate;
	private int freeBoardNum;
	private String userId;
	public FreeBoard_FreeBoardCommVo(){}
	public FreeBoard_FreeBoardCommVo(int freeBoardCommNum, String freeBoardCommContent, Date freeBoardCommWdate,
			int freeBoardNum, String userId) {
		super();
		this.freeBoardCommNum = freeBoardCommNum;
		this.freeBoardCommContent = freeBoardCommContent;
		this.freeBoardCommWdate = freeBoardCommWdate;
		this.freeBoardNum = freeBoardNum;
		this.userId = userId;
	}
	public int getFreeBoardCommNum() {
		return freeBoardCommNum;
	}
	public String getFreeBoardCommContent() {
		return freeBoardCommContent;
	}
	public Date getFreeBoardCommWdate() {
		return freeBoardCommWdate;
	}
	public int getFreeBoardNum() {
		return freeBoardNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setFreeBoardCommNum(int freeBoardCommNum) {
		this.freeBoardCommNum = freeBoardCommNum;
	}
	public void setFreeBoardCommContent(String freeBoardCommContent) {
		this.freeBoardCommContent = freeBoardCommContent;
	}
	public void setFreeBoardCommWdate(Date freeBoardCommWdate) {
		this.freeBoardCommWdate = freeBoardCommWdate;
	}
	public void setFreeBoardNum(int freeBoardNum) {
		this.freeBoardNum = freeBoardNum;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
