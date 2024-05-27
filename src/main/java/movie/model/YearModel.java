package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import movie.entity.Year;

public class YearModel {

	private String url;

	public YearModel(ServletContext context) {

		try {
			Class.forName("org.sqlite.JDBC");
			url = "jdbc:sqlite:" + context.getRealPath("WEB-INF/movies_data.db");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public List<Year> findYear() {

		List<Year> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from year order by yearid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Year year = new Year();
				year.setYearid(rs.getInt("yearid"));
				year.setYearindex(rs.getInt("yearindex"));

				result.add(year);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	public List<Year> countMovie() {
		List<Year> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "SELECT *, count(movieid) as movie_count FROM year y left outer join movies m on y.yearid = m.yearid GROUP by y.yearid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Year year = new Year();
				year.setYearid(rs.getInt("yearid"));
				year.setYearindex(rs.getInt("yearindex"));
				year.setMovie_count(rs.getInt("movie_count"));

				result.add(year);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
