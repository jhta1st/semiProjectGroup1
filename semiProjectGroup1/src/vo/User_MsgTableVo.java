package vo;

import java.sql.Date;

public class User_MsgTableVo {
	private int msgNum;
	private String msgContent;
	private String SendUserId;
	private String ReceiveUserId;
	private Date msgWdate;
	private int msgCheck;
	private String msgDelete;
	
	public User_MsgTableVo() {}
	
	public User_MsgTableVo(int msgNum, String msgContent, String sendUserId, String receiveUserId, Date msgWdate,
			int msgCheck, String msgDelete) {
		super();
		this.msgNum = msgNum;
		this.msgContent = msgContent;
		SendUserId = sendUserId;
		ReceiveUserId = receiveUserId;
		this.msgWdate = msgWdate;
		this.msgCheck = msgCheck;
		this.msgDelete = msgDelete;
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public String getSendUserId() {
		return SendUserId;
	}
	public void setSendUserId(String sendUserId) {
		SendUserId = sendUserId;
	}
	public String getReceiveUserId() {
		return ReceiveUserId;
	}
	public void setReceiveUserId(String receiveUserId) {
		ReceiveUserId = receiveUserId;
	}
	public Date getMsgWdate() {
		return msgWdate;
	}
	public void setMsgWdate(Date msgWdate) {
		this.msgWdate = msgWdate;
	}
	public int getMsgCheck() {
		return msgCheck;
	}
	public void setMsgCheck(int msgCheck) {
		this.msgCheck = msgCheck;
	}
	public String getMsgDelete() {
		return msgDelete;
	}
	public void setMsgDelete(String msgDelete) {
		this.msgDelete = msgDelete;
	}
	
}

