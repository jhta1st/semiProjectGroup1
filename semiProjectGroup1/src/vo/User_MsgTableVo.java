package vo;

import java.sql.Date;

public class User_MsgTableVo {
	private int msgNum;
	private String msgContent;
	private String ReceiveUserId;
	private String SendUserId;
	private Date msgWdate;
	private int msgCheck;
	
	public User_MsgTableVo() {}

	public User_MsgTableVo(int msgNum, String msgContent, String receiveUserId, String sendUserId, Date msgWdate,
			int msgCheck) {
		super();
		this.msgNum = msgNum;
		this.msgContent = msgContent;
		ReceiveUserId = receiveUserId;
		SendUserId = sendUserId;
		this.msgWdate = msgWdate;
		this.msgCheck = msgCheck;
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

	public String getReceiveUserId() {
		return ReceiveUserId;
	}

	public void setReceiveUserId(String receiveUserId) {
		ReceiveUserId = receiveUserId;
	}

	public String getSendUserId() {
		return SendUserId;
	}

	public void setSendUserId(String sendUserId) {
		SendUserId = sendUserId;
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
}

