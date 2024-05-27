<%@page import="movie.entity.User"%>
<%@page import="movie.entity.Countries"%>
<%@page import="movie.entity.Year"%>
<%@page import="movie.entity.Genre"%>
<%@page import="java.util.List"%>
<%@page import="movie.entity.Item"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 	<!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />

    <!--  Style -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="style.css" />
    
    <%
    Item detail = (Item) request.getAttribute("movie");
    String word = (String) request.getAttribute("word");
    
    List<Item> recent = (List<Item>) request.getAttribute("recent");
    List<Item> related = (List<Item>) request.getAttribute("related");
    List<Genre> genre = (List<Genre>) request.getAttribute("genre");
    List<Year> year = (List<Year>) request.getAttribute("year");
    List<Countries> countries = (List<Countries>) request.getAttribute("countries");
    
    User user= (User) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
    %>
    
<title>Detail Movie</title>
</head>
<body>

	<!-- navbar start -->
    <nav class="navbar">
      <a href="MovieListController" class="navbar-logo">Movie<span>Matrix</span> <i class="bi bi-camera-reels-fill"></i></a>

      <div class="navbar-nav">
        <a href="MovieListController">Home</a><a href="MovieAllController?genreid=&&countryid=&&yearid=">All</a><a href="#" class="genre-button">Genres <i class="bi bi-caret-down-fill"></i></a><a href="#" class="year-button">Year <i class="bi bi-caret-down-fill"></i></a
        ><a href="#" class="country-button">Country <i class="bi bi-caret-down-fill"></i></a><a href="#">Help</a>
      </div>

      <form action="MovieAllController?genreid=&&yearid=&&countryid=&&">
        <input type="search" id="search-input"name="word" placeholder="Search Here..." />
        <button type="submit"><i class="bi bi-search"></i></button>
      </form>
      <% if (email == null && user == null) { %>
      <div class="sign-in">
        <a href="Login.jsp"><div class="signin">Sign In</div></a>
        <a href=""><div class="signin">Sign Up</div></a>
      </div>
      <% } else { %>
      <div class="sign-in">
        <a href="LogoutController"><div class="signin"style="background-color: #b60202">Logout</div></a>
        <a href=""><div class="signin">Sign Up</div></a>
      </div>
      <% } %>

      <!-- Dropdown Genres -->
      <div class="dropdown-genres">
      <% for(Genre g : genre){ %>
        <a href="MovieAllController?genreid=<%= g.getGenreid() %>&&yearid=&&countryid="><div class="nav-genre"><%= g.getGenrename() %></div></a>
      <% } %>
      </div>

      <!-- Dropdown Year -->
      <div class="dropdown-year">
      <% for(Year y: year) { %>
        <a href="MovieAllController?genreid=&&yearid=<%= y.getYearid() %>&&countryid="><div class="nav-year"><%= y.getYearindex() %></div></a>
      <% } %>
      </div>

      <!-- Dropdown Country -->
      <div class="dropdown-country">
      <% for(Countries c : countries) { %>
        <a href="MovieAllController?genreid=&&yearid=&&countryid=<%=c.getCountryid() %>"><div class="nav-country"><%= c.getCountryname() %></div></a>
      <% } %>
      </div>
    </nav>
    <!-- navbar end -->

    <!-- Main Section Start-->
    <div class="main-detail-container">
	    <div class="trailer">
	      <%= detail.getTrailer() %>
	    </div>
	
	    <div class="tittle-container" style="background-image:url('<%= detail.getImg()%>')">
		    <div class="opacity">
		      <img src="<%= detail.getImg() %>" alt="" />
		      <div class="tittle">
		        <div class="movie-name"><%= detail.getMoviename() %></div>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>	
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <i class="bi bi-star-fill"></i>
		        <div class="rating"><%= detail.getRating() %> Rating</div>
		        <div class="votes">1500 votes</div>
		      </div>
		    </div>  
	    </div>
	
	    <div class="detail-container">
	      <section class="detail-content-1">
	        <h2>Synopsis</h2>
	        <div class="synopsis">
	        <%= detail.getDetail() %>
	        </div>
	        <div class="details">
	          <div class="">Posted on: 6 August 2023</div>
	          <div class="">Tagline: <%= detail.getTagline() != null ? detail.getTagline() : "-" %></div>
	          <div class="">Genre: <%= detail.getGenre1().getGenrename() != null ? detail.getGenre1().getGenrename() : ""%><%= detail.getGenre2().getGenrename() != null ? ", "+detail.getGenre2().getGenrename()  : "" %><%= detail.getGenre3().getGenrename() != null ? ", "+detail.getGenre3().getGenrename() : "" %><%= detail.getGenre4().getGenrename()  != null ? ", "+detail.getGenre4().getGenrename()  : "" %></div>
	          <div class="">Year: <%= detail.getYear1().getYearindex()!= 0 ? detail.getYear1().getYearindex(): "-" %></div>
	          <div class="">Duration: <%= detail.getDuration() %> Min</div>
	          <div class="">Country: <%= detail.getCountry1().getCountryname() %></div>
	          <div class="">Release: <%= detail.getRelease() %></div>
	          <div >Budget; $ <%= detail.getBudget() != 0 ? detail.getBudget() : "-"%></div>
	          <div class="">Director: <%= detail.getDirector() %></div>
	          <div class="">Cast: <%= detail.getCast() %></div>
	        </div>
	        <h3>Related Movies <span class="content-5"></span></h3>
	        
	        <div class="bottom-card-container">
	        <% for(Item r : related){ %>
            <a href="">
              <div class="bottom-card">
                <div class="bottom-card-img">
                  <div class="bottom-card-rating"><i class="bi bi-star star-1"></i> <%= r.getRating() %></div>
                  <a href="#"
                    ><div class="favorite"><i class="bi bi-heart"></i></div
                  ></a>
                  <img
                    src="<%= r.getImg() %>"
                    alt=""
                  />
                </div>
                <div class="bottom-card-body">
                  <div class="bottom-card-tittle"><%= r.getMoviename() %></div>
                </div>
              </div>
            </a>
            <% } %>
          </div>
           
	      </section>
	
	      <div class="side-right">
	        <h5>Recent Movies</h5>
	        <% for(Item r : recent){ %>
	        <div class="main-card-body">
	          <a href="">
	            <div class="side-card">
	              <div class="side-card-img">
	                <!-- <div class="card-soon">Comming Soon</div> -->
	                <img src="<%= r.getImg() %>" alt="" />
	              </div>
	            </div>
	          </a>
	          <div class="side-card-body">
	            <a href="">
	              <div class="tittle-side"><%= r.getMoviename() %></div>
	            </a>
	            <div class="genre">Action, Comedy, Romance</div>
	            <!-- <div class="side-card-tittle">Movie Tittle ssss</div> -->
	          </div>
	        </div>
	        <% } %>
	      </div>
	    </div>
	    
	    <!-- Review Section -->
	    <section class="review-container">
        <h3>Give Your Review <span class="content-6"></span></h3>
        <textarea name="review" id="" placeholder="Review This Movie"></textarea>
        <div>
          <button type="submit">Review</button>
        </div>
        <div class="count-reviews">
          <div class="count">0 Reviews</div>
          <div class="share"><i class="bi bi-share"></i></div>
        </div>
        <div class="reviews"></div>
      	</section>
	    <!-- Review Section -->
    </div>
    <!-- Main Section End-->

    <!-- Footer Start -->
    <footer>
      <div class="terms">
        <h5>Terms and Conditions</h5>
        <a href=""><div>Privacy Policy</div></a>
        <a href=""><div>Terms and Conditions</div></a>
        <a href=""><div>Cookie policy</div></a>
      </div>
      <div class="help">
        <h5>Help and feedback</h5>
        <a href=""><div>Feedback</div></a>
        <a href=""><div>FAQs</div></a>
      </div>
      <div class="aboutus">
        <h5>About us</h5>
        <a href=""><div>Join us</div></a>
        <a href=""><div>Contact us</div></a>
        <div class="icons">
          <a href=""><i class="bi bi-facebook"></i></a>
          <a href=""><i class="bi bi-instagram"></i></a>
          <a href=""><i class="bi bi-twitter"></i></a>
          <a href=""><i class="bi bi-youtube"></i></a>
        </div>
      </div>
      <div class="copy">
        <div>Copyright © 2024 Created & Desained by Dicky Laksono.</div>
      </div>
    </footer>
    <!-- Footer End-->

    <!-- Script -->
    <script src="script2.js"></script>

</body>
</html>