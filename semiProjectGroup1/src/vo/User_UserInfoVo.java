package vo;

import java.sql.Date;

public class User_UserInfoVo {
	private String userId;
	private String userPwd;
	private String userNickName;
	private int userLev;
	private int userExp;
	private Date userJdate;
	private int userPower;

	public User_UserInfoVo() {}

	public User_UserInfoVo(String userId, String userPwd, String userNickName, int userLev, int userExp, Date userJdate,
			int userPower) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userNickName = userNickName;
		this.userLev = userLev;
		this.userExp = userExp;
		this.userJdate = userJdate;
		this.userPower = userPower;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getUserLev() {
		return userLev;
	}

	public void setUserLev(int userLev) {
		this.userLev = userLev;
	}

	public int getUserExp() {
		return userExp;
	}

	public void setUserExp(int userExp) {
		this.userExp = userExp;
	}

	public Date getUserJdate() {
		return userJdate;
	}

	public void setUserJdate(Date userJdate) {
		this.userJdate = userJdate;
	}

	public int getUserPower() {
		return userPower;
	}

	public void setUserPower(int userPower) {
		this.userPower = userPower;
	}

}