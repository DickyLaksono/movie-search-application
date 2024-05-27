package movie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import movie.entity.Countries;
import movie.entity.Genre;
import movie.entity.Item;
import movie.entity.Year;

public class MovieModel {

	private String url;

	public MovieModel(ServletContext context) {

		try {
			Class.forName("org.sqlite.JDBC");
			url = "jdbc:sqlite:" + context.getRealPath("WEB-INF/movies_data.db");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	public Item detailMovie(int movieid) {

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "SELECT *, g1.genrename as g1name, "
					+ "				g2.genrename as g2name, "
					+ "				g3.genrename as g3name, "
					+ "				g4.genrename as g4name, "
					+ "				y1.yearindex as year1, "
					+ "				c1.countryname as country1 "
					+ "FROM movies m left outer JOIN genres g1 on m.genreid1 = g1.genreid "
					+ "left outer JOIN genres g2 on m.genreid2 = g2.genreid "
					+ "left outer  JOIN genres g3 on m.genreid3 = g3.genreid "
					+ "left outer  JOIN genres g4 on m.genreid4 = g4.genreid "
					+ "left outer join countries c1 on m.countryid = c1.countryid "
					+ "left outer JOIN year y1 on m.yearid = y1.yearid "
					+ "WHERE movieid = ?  order by movieid ";

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, movieid);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				Genre genre1 = new Genre();
				Genre genre2 = new Genre();
				Genre genre3 = new Genre();
				Genre genre4 = new Genre();
				genre1.setGenrename(rs.getString("g1name"));
				item.setGenre1(genre1);
				genre2.setGenrename(rs.getString("g2name"));
				item.setGenre2(genre2);
				genre3.setGenrename(rs.getString("g3name"));
				item.setGenre3(genre3);
				genre4.setGenrename(rs.getString("g4name"));
				item.setGenre4(genre4);

				Countries countries = new Countries();
				//				countries.setCountryid(rs.getInt("c1id"));
				countries.setCountryname(rs.getString("country1"));
				item.setCountry1(countries);

				Year year = new Year();
				//				year.setYearid(rs.getInt("y1id"));
				year.setYearindex(rs.getInt("year1"));
				item.setYear1(year);

				return item;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Item> findAll() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "SELECT *  FROM movies m LEFT OUTER JOIN genres g1 on m.genreid1 = g1.genreid "
					+ "					   LEFT OUTER JOIN genres g2 on m.genreid2 = g2.genreid "
					+ "					   LEFT OUTER JOIN genres g3 on m.genreid3 = g3.genreid "
					+ "					   LEFT OUTER JOIN genres g4 on m.genreid4 = g4.genreid "
					+ " 				   LEFT OUTER join countries c on m.countryid = c.countryid "
					+ "					   LEFT OUTER JOIN year y on m.yearid = y.yearid order by movieid";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setDirector(rs.getString("director"));
				item.setTagline(rs.getString("tagline"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				Genre genre = new Genre();
				genre.setGenreid(rs.getInt("genreid"));
				genre.setGenrename(rs.getString("genrename"));

				Countries countries = new Countries();
				countries.setCountryid(rs.getInt("countryid"));
				countries.setCountryname(rs.getString("countryname"));

				Year year = new Year();
				year.setYearid(rs.getInt("yearid"));
				year.setYearindex(rs.getInt("yearindex"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> showAll(String word, int countryid, int yearid, int genreid, int page) {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "SELECT *  FROM movies m LEFT OUTER JOIN genres g1 on m.genreid1 = g1.genreid "
					+ "					   LEFT OUTER JOIN genres g2 on m.genreid2 = g2.genreid "
					+ "					   LEFT OUTER JOIN genres g3 on m.genreid3 = g3.genreid "
					+ "					   LEFT OUTER JOIN genres g4 on m.genreid4 = g4.genreid "
					+ " 				   LEFT OUTER join countries c on m.countryid = c.countryid "
					+ "					   LEFT OUTER JOIN year y on m.yearid = y.yearid "
					+ "					   where (moviename like ? or detail like ? ) ";
			if (countryid > 0) {
				sql += " and m.countryid = ?";
			} else if (yearid > 0) {
				sql += " and m.yearid = ?";
			} else if (genreid > 0) {
				sql += " and m.genreid1 = ? or m.genreid2 = ? or m.genreid3 = ? or m.genreid4 = ? ";
			}
			sql += " order by movieid LIMIT 24 OFFSET ? ";

			PreparedStatement stmt = conn.prepareStatement(sql);
			int index = 1;
			stmt.setString(index++, "%" + word + "%");
			stmt.setString(index++, "%" + word + "%");
			stmt.setInt(index++, (page - 1) * 24);
			if (countryid > 0) {
				stmt.setInt(index++, countryid);
			} else if (yearid > 0) {
				stmt.setInt(index++, yearid);
			} else if (genreid > 0) {
				stmt.setInt(index++, genreid);
				stmt.setInt(index++, genreid);
				stmt.setInt(index++, genreid);
				stmt.setInt(index++, genreid);
			}
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setDirector(rs.getString("director"));
				item.setTagline(rs.getString("tagline"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				Genre genre = new Genre();
				genre.setGenreid(rs.getInt("genreid"));
				genre.setGenrename(rs.getString("genrename"));

				Countries countries = new Countries();
				countries.setCountryid(rs.getInt("countryid"));
				countries.setCountryname(rs.getString("countryname"));

				Year year = new Year();
				year.setYearid(rs.getInt("yearid"));
				year.setYearindex(rs.getInt("yearindex"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> latest() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where latest = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));
				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> trending() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where trending = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> recommended() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where recommended = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> commingsoon() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where commingsoon = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> recent() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where recent = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Item> related() {
		List<Item> result = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(url)) {

			String sql = "select * from movies where related = 1";

			PreparedStatement stmt = conn.prepareStatement(sql);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Item item = new Item();
				item.setMovieid(rs.getInt("movieid"));
				item.setMoviename(rs.getString("moviename"));
				item.setTagline(rs.getString("tagline"));
				item.setDirector(rs.getString("director"));
				item.setBudget(rs.getInt("budget"));
				//				item.setCountry(rs.getString("country"));
				item.setRelease(rs.getString("release"));
				//				item.setYear(rs.getInt("Year"));
				item.setGenreid1(rs.getInt("genreid1"));
				item.setGenreid2(rs.getInt("genreid2"));
				item.setGenreid3(rs.getInt("genreid3"));
				item.setGenreid4(rs.getInt("genreid4"));
				item.setDuration(rs.getInt("duration"));
				item.setCast(rs.getString("cast"));
				item.setDetail(rs.getString("detail"));
				item.setRating(rs.getDouble("rating"));
				item.setImg(rs.getString("image"));
				item.setTrailer(rs.getString("trailer"));
				item.setLatest(rs.getInt("latest"));
				item.setTrending(rs.getInt("trending"));
				item.setRecommended(rs.getInt("recommended"));
				item.setRecent(rs.getInt("recent"));
				item.setRelated(rs.getInt("related"));
				item.setCountryid(rs.getInt("countryid"));
				item.setYearid(rs.getInt("yearid"));

				//				Genre genre = new Genre();
				//				genre.setGenreid(rs.getInt("genreid"));
				//				genre.setGenrename(rs.getString("genrename"));

				result.add(item);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
