package movie.entity;

public class Item {

	private int movieid;
	private String moviename;
	private String tagline;
	private String director;
	private int budget;
	//private String country;
	private String release;
	//	private int year;
	private int genreid1;
	private int genreid2;
	private int genreid3;
	private int genreid4;
	private int duration;
	private String cast;
	private String detail;
	private double rating;
	private String img;
	private String trailer;
	private int latest;
	private int trending;
	private int recommended;
	private int commingsoon;
	private int recent;
	private int related;
	private int countryid;
	private int yearid;

	private Genre genre1;
	private Genre genre2;
	private Genre genre3;
	private Genre genre4;

	private Countries country1;

	private Year year1;

	public Countries getCountry1() {
		return country1;
	}

	public void setCountry1(Countries country1) {
		this.country1 = country1;
	}

	public Year getYear1() {
		return year1;
	}

	public void setYear1(Year year1) {
		this.year1 = year1;
	}

	public Genre getGenre1() {
		return genre1;
	}

	public void setGenre1(Genre genre1) {
		this.genre1 = genre1;
	}

	public Genre getGenre2() {
		return genre2;
	}

	public void setGenre2(Genre genre2) {
		this.genre2 = genre2;
	}

	public Genre getGenre3() {
		return genre3;
	}

	public void setGenre3(Genre genre3) {
		this.genre3 = genre3;
	}

	public Genre getGenre4() {
		return genre4;
	}

	public void setGenre4(Genre genre4) {
		this.genre4 = genre4;
	}

	public int getRecent() {
		return recent;
	}

	public void setRecent(int recent) {
		this.recent = recent;
	}

	public int getRelated() {
		return related;
	}

	public void setRelated(int related) {
		this.related = related;
	}

	public int getCountryid() {
		return countryid;
	}

	public void setCountryid(int countryid) {
		this.countryid = countryid;
	}

	public int getYearid() {
		return yearid;
	}

	public void setYearid(int yearid) {
		this.yearid = yearid;
	}

	public int getCommingsoon() {
		return commingsoon;
	}

	public void setCommingsoon(int commingsoon) {
		this.commingsoon = commingsoon;
	}

	private Genre genre;

	public int getMovieid() {
		return movieid;
	}

	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}

	public String getMoviename() {
		return moviename;
	}

	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}

	public String getTagline() {
		return tagline;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	//	public String getCountry() {
	//		return country;
	//	}
	//
	//	public void setCountry(String country) {
	//		this.country = country;
	//	}

	public String getRelease() {
		return release;
	}

	public void setRelease(String release) {
		this.release = release;
	}

	//	public int getYear() {
	//		return year;
	//	}
	//
	//	public void setYear(int year) {
	//		this.year = year;
	//	}

	public int getGenreid1() {
		return genreid1;
	}

	public void setGenreid1(int genreid1) {
		this.genreid1 = genreid1;
	}

	public int getGenreid2() {
		return genreid2;
	}

	public void setGenreid2(int genreid2) {
		this.genreid2 = genreid2;
	}

	public int getGenreid3() {
		return genreid3;
	}

	public void setGenreid3(int genreid3) {
		this.genreid3 = genreid3;
	}

	public int getGenreid4() {
		return genreid4;
	}

	public void setGenreid4(int genreid4) {
		this.genreid4 = genreid4;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getCast() {
		return cast;
	}

	public void setCast(String cast) {
		this.cast = cast;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public int getLatest() {
		return latest;
	}

	public void setLatest(int latest) {
		this.latest = latest;
	}

	public int getTrending() {
		return trending;
	}

	public void setTrending(int trending) {
		this.trending = trending;
	}

	public int getRecommended() {
		return recommended;
	}

	public void setRecommended(int recommended) {
		this.recommended = recommended;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

}
