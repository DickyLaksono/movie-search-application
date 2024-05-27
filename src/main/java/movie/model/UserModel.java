package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;

import movie.entity.User;

public class UserModel {

	private String url;

	public UserModel(ServletContext context) {

		try {
			Class.forName("org.sqlite.JDBC");
			url = "jdbc:sqlite:" + context.getRealPath("WEB-INF/movies_data.db");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public User findByIdAndPassword(String email, String password) {

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from user where email like ? or password like ? ";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				User user = new User();
				user.setUserid(rs.getInt("userid"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
