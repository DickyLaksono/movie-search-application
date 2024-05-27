package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import movie.entity.Genre;

public class GenreModel {

	private String url;

	public GenreModel(ServletContext context) {

		try {
			Class.forName("org.sqlite.JDBC");
			url = "jdbc:sqlite:" + context.getRealPath("WEB-INF/movies_data.db");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public List<Genre> findGenre() {

		List<Genre> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from genres order by genreid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Genre genre = new Genre();
				genre.setGenreid(rs.getInt("genreid"));
				genre.setGenrename(rs.getString("genrename"));

				result.add(genre);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
