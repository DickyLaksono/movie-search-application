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

@WebServlet("/MovieListController")
public class MovieListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//		HttpSession session = request.getSession();
		//		if (session.getAttribute("email") == null) {
		//			response.sendRedirect("login.jsp");
		//			return;
		//
		//		}

		//parameter

		//model 
		MovieModel mm = new MovieModel(getServletContext());
		List<Item> movies = mm.findAll();
		List<Item> latest = mm.latest();
		List<Item> trending = mm.trending();
		List<Item> recommended = mm.recommended();
		List<Item> commingsoon = mm.commingsoon();

		GenreModel gm = new GenreModel(getServletContext());
		List<Genre> genre = gm.findGenre();

		YearModel ym = new YearModel(getServletContext());
		List<Year> year = ym.findYear();
		List<Year> countYear = ym.countMovie();

		CountryModel cm = new CountryModel(getServletContext());
		List<Countries> countries = cm.findCountry();

		//view
		request.setAttribute("movies", movies);
		request.setAttribute("countYear", countYear);

		request.setAttribute("latest", latest);
		request.setAttribute("trending", trending);
		request.setAttribute("recommended", recommended);
		request.setAttribute("commingsoon", commingsoon);
		request.setAttribute("genre", genre);
		request.setAttribute("year", year);
		request.setAttribute("countries", countries);

		request.getRequestDispatcher("/Index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
