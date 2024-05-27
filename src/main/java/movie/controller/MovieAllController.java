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

@WebServlet("/MovieAllController")
public class MovieAllController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String word = request.getParameter("word");
		if (word == null) {
			word = "";
		}
		String countryid = request.getParameter("countryid");
		if (countryid == null || countryid.equals("")) {
			countryid = "0";
		}
		String yearid = request.getParameter("yearid");
		if (yearid == null || yearid.equals("")) {
			yearid = "0";
		}
		String genreid = request.getParameter("genreid");
		if (genreid == null || genreid.equals("")) {
			genreid = "0";
		}
		String page = request.getParameter("page");
		if (page == null || page.equals("")) {
			page = "0";
		}

		MovieModel mm = new MovieModel(getServletContext());
		List<Item> movies = mm.showAll(word, Integer.parseInt(countryid), Integer.parseInt(yearid),
				Integer.parseInt(genreid), Integer.parseInt(page));

		GenreModel gm = new GenreModel(getServletContext());
		List<Genre> genre = gm.findGenre();

		YearModel ym = new YearModel(getServletContext());
		List<Year> year = ym.findYear();

		CountryModel cm = new CountryModel(getServletContext());
		List<Countries> countries = cm.findCountry();

		request.setAttribute("page", page);
		request.setAttribute("word", word);
		request.setAttribute("movies", movies);
		request.setAttribute("genre", genre);
		request.setAttribute("year", year);
		request.setAttribute("countries", countries);
		request.getRequestDispatcher("All.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
