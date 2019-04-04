package dao;

public class LoginDao {
	private static LoginDao instance = new LoginDao();

	private LoginDao() {
	}

	public static LoginDao getInstance() {
		return instance;
	}
}
