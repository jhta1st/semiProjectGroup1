package vo;

import java.sql.Date;

public class User_UserInfoVo {
	private String UserId;
	private String UserPwd;
	private String UserNickName; 
	private int UserLev; 
	private int UserExp; 
	private Date UserJdate;
	private int UserPower;
	
	public User_UserInfoVo() {}

	public User_UserInfoVo(String userId, String userPwd, String userNickName, int userLev, int userExp, Date userJdate,
			int userPower) {
		super();
		UserId = userId;
		UserPwd = userPwd;
		UserNickName = userNickName;
		UserLev = userLev;
		UserExp = userExp;
		UserJdate = userJdate;
		UserPower = userPower;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getUserPwd() {
		return UserPwd;
	}

	public void setUserPwd(String userPwd) {
		UserPwd = userPwd;
	}

	public String getUserNickName() {
		return UserNickName;
	}

	public void setUserNickName(String userNickName) {
		UserNickName = userNickName;
	}

	public int getUserLev() {
		return UserLev;
	}

	public void setUserLev(int userLev) {
		UserLev = userLev;
	}

	public int getUserExp() {
		return UserExp;
	}

	public void setUserExp(int userExp) {
		UserExp = userExp;
	}

	public Date getUserJdate() {
		return UserJdate;
	}

	public void setUserJdate(Date userJdate) {
		UserJdate = userJdate;
	}

	public int getUserPower() {
		return UserPower;
	}

	public void setUserPower(int userPower) {
		UserPower = userPower;
	}
	
}
