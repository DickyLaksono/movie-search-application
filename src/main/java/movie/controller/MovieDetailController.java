package movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.entity.Countries;
import movie.entity.Genre;
import movie.entity.Item;
import movie.entity.Year;
import movie.model.CountryModel;
import movie.model.GenreModel;
import movie.model.MovieModel;
import movie.model.YearModel;

@WebServlet("/MovieDetailController")
public class MovieDetailController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//Parameter
		String movieId = request.getParameter("movieid");
		if (movieId == null) {
			movieId = "";
		}
		//		String countryId = request.getParameter("countryid");
		//		if (countryId == null) {
		//			countryId = "";
		//		}
		//		String yearId = request.getParameter("countryid");
		//		if (yearId == null) {
		//			yearId = "";
		//		}

		//Model
		MovieModel mm = new MovieModel(getServletContext());
		Item movie = mm.detailMovie(Integer.parseInt(movieId));
		List<Item> recent = mm.recent();
		List<Item> related = mm.related();

		GenreModel gm = new GenreModel(getServletContext());
		List<Genre> genre = gm.findGenre();

		YearModel ym = new YearModel(getServletContext());
		List<Year> year = ym.findYear();

		CountryModel cm = new CountryModel(getServletContext());
		List<Countries> countries = cm.findCountry();

		//View
		request.setAttribute("movieId", movieId);
		request.setAttribute("movie", movie);
		request.setAttribute("recent", recent);
		request.setAttribute("related", related);
		request.setAttribute("genre", genre);
		request.setAttribute("year", year);
		request.setAttribute("countries", countries);
		request.getRequestDispatcher("/Detail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
