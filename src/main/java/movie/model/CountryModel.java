package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import movie.entity.Countries;

public class CountryModel {

	private String url;

	public CountryModel(ServletContext context) {

		try {
			Class.forName("org.sqlite.JDBC");
			url = "jdbc:sqlite:" + context.getRealPath("WEB-INF/movies_data.db");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public List<Countries> findCountry() {

		List<Countries> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from countries order by countryid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Countries countries = new Countries();
				countries.setCountryid(rs.getInt("countryid"));
				countries.setCountryname(rs.getString("countryname"));

				result.add(countries);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
}
