<%@page import="movie.entity.User"%>
<%@page import="movie.entity.Countries"%>
<%@page import="movie.entity.Year"%>
<%@page import="movie.entity.Genre"%>
<%@page import="movie.entity.Item"%>
<%@page import="java.util.List"%>
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
    String word = (String) request.getAttribute("word");
    List<Item> movies = (List<Item>) request.getAttribute("movies");
    List<Year> countYear = (List<Year>) request.getAttribute("countYear");
    
    
    List<Genre> genre = (List<Genre>) request.getAttribute("genre"); 
    List<Year> year = (List<Year>) request.getAttribute("year");
    List<Countries> countries = (List<Countries>) request.getAttribute("countries");
	
	List<Item> latest = (List<Item>) request.getAttribute("latest");
	List<Item> trending = (List<Item>) request.getAttribute("trending");
	List<Item> recommended = (List<Item>) request.getAttribute("recommended");
	List<Item> commingsoon = (List<Item>) request.getAttribute("commingsoon");
	
	User user= (User) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
	%>
    
<title>Home</title>
</head>
<body>

	<!-- navbar start -->
    <nav class="navbar">
      <a href="MovieListController" class="navbar-logo">Movie<span>Matrix</span> <i class="bi bi-camera-reels-fill"></i></a>

      <div class="navbar-nav">
        <a href="MovieListController">Home</a><a href="MovieAllController?genreid=&&countryid=&&yearid=&&page=1">All</a><a href="#" class="genre-button">Genres <i class="bi bi-caret-down-fill"></i></a><a href="#" class="year-button">Year <i class="bi bi-caret-down-fill"></i></a
        ><a href="#" class="country-button">Country <i class="bi bi-caret-down-fill"></i></a><a href="#">Help</a>
      </div>

      <form action="MovieAllController?genreid=&&yearid=&&countryid=&&">
        <input type="search" id="search-input" name="word" placeholder="Search Here..." />
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
      
      <div class="hamburger-button">
        <i class="bi bi-list"></i>
      </div>

      <!-- Hamburger Menu -->
      <div class="hamburger-menu">
        <div class="hamburger-nav">
          <a href="">Home</a>
          <a href="">All</a>
          <a href="#" class="hbg-genre-button">Genres <i class="bi bi-caret-down-fill"></i></a>
          <!-- Dropdown Hbg Menu Genres -->
          <div class="hbg-genres">
            <a href=""><div class="hbg-nav-genre">Action</div></a>
            <a href=""><div class="hbg-nav-genre">Adventure</div></a>
            <a href=""><div class="hbg-nav-genre">Comedy</div></a>
            <a href=""><div class="hbg-nav-genre">Horror</div></a>
            <a href=""><div class="hbg-nav-genre">Mistery</div></a>
            <a href=""><div class="hbg-nav-genre">Mistery</div></a>
          </div>
          <a href="" class="hbg-year-button">Year <i class="bi bi-caret-down-fill"></i></a>
          <!-- Dropdown Hbg Menu Year -->
          <div class="hbg-year">
            <a href=""><div class="hbg-nav-year">Action</div></a>
            <a href=""><div class="hbg-nav-year">Adventure</div></a>
            <a href=""><div class="hbg-nav-year">Comedy</div></a>
            <a href=""><div class="hbg-nav-year">Horror</div></a>
            <a href=""><div class="hbg-nav-year">Mistery</div></a>
            <a href=""><div class="hbg-nav-year">Mistery</div></a>
          </div>
          <a href="" class="hbg-country-button">Country <i class="bi bi-caret-down-fill"></i></a>
          <!-- Dropdown Hbg Menu Country -->
          <div class="hbg-country">
            <a href=""><div class="hbg-nav-country">Action</div></a>
            <a href=""><div class="hbg-nav-country">Adventure</div></a>
            <a href=""><div class="hbg-nav-country">Comedy</div></a>
            <a href=""><div class="hbg-nav-country">Horror</div></a>
            <a href=""><div class="hbg-nav-country">Mistery</div></a>
            <a href=""><div class="hbg-nav-country">Mistery</div></a>
          </div>
          <a href="">Help</a>
          <a href="">Sign In</a>
        </div>
      </div>
      <!-- Hamburger Menu -->

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

    <!-- Carousel Start -->
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
      
        <div class="carousel-item item-1 active" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG9TgtPlluOrAqlXnGFHfnWXCkH_usoq9MHOYlyFmQQgvWhnNx-xd6moWDDrW6S65i6OCzpBdRy7KKAiofl_CFcv5ElbKhxFWhaVrmaRwdegqxQhyljdFpe63ojB9NoU8XSw3HABh_2mzLcD45rofg2n_IH9NLEbWraEVrM_Hoxw7fYiB8ge3I2doQD2vfryb0xCo-1cF0bUw9MQnM882eks=/inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg?errorImage=false')">
          <!-- <img src="img/banner-movies-1.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content">
            <div class="main-movie-tittle">GODZILLA VS KONG</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i> 7.4</div>
              <div class="main-genres">Genres: Action, Sci-Fi, Thriller</div>
            </div>
            <p>Director: Adam Wingard</p>
            <p class="text-truncate">In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.
									Adam Wingard, Kerry Lyn McKissick, Brian Avery Galligan, Ashley Douglass
									Alexander Skarsgård, Millie Bobby Brown, Rebecca Hall, Brian Tyree Henry, Shun Oguri, Eiza González, Julian Dennison, Lance Reddick, Kyle Chandler, Demián Bichir, Hakeem Kae-Kazim, Kaylee Hottle, Zhang Ziyi, Van Marten, Erol Brandis, Daniel Nelson, Priscilla Doueihy, Jim Palmer, Chris Chalk, John Pirruccello, Ronny Chieng, Conlan Casal, Brad McMurray, Benjamin Rigby, Nick Turello, Kei Kudo, Bradd Buckley, David Castillo, Kofi Yiadom, Drew Walton</p>
            <a href="MovieDetailController?movieid=13" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
          </main>
        </div>
        
        <div class="carousel-item item-2" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG9G_B_Keppc13LQzrtMiqWAkI1RIeio5kffeGFFlgdWcKvqwcvuBthUu3uLq3I2GqSCB-F5PdVm9BBdSVKnteickHBSFKZot3GDnHsQ5zlQjuoljVAeR1Qf82n-DrAforD0A8gUVzjwSAU8kQ4Ra7M4=/1314905.jpeg?errorImage=false')">
          <!-- <img src="img/banner-movies-1.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content">
            <div class="main-movie-tittle">Oppenheimer</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i> 8.3</div>
              <div class="main-genres">Genres: Drama</div>
            </div>
            <p>Director: Christopher Nolan</p>
            <p class="text-truncate">A dramatization of the life story of J. Robert Oppenheimer, the physicist who had a large hand in the development of the atomic bomb, thus helping end World War 2. We see his life from university days all the way to post-WW2, where his fame saw him embroiled in political machinations.</p>
            <a href="MovieDetailController?movieid=17" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
          </main>
        </div>
        <div class="carousel-item item-3" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG0qcYPxKUjVOmF5PIkSmKl3qZovpUJ9Jp4nty95y35QiahBDhQk1iDRajWi05A9Q7msMxKDWGCCQNuKf9cQGzXbou2E-cu31G_5Oiy-jP1Sxgj5fSwjroVs-NQRFsdpWFSlH9EY5qKMGnjugR1Nc-2UWXa8iP890lQbB56KLzoioO8IRrJT5uECVTZqB_iaZLzydbw401UMqk10eXdjhJ2c-GwyHeG93V1naH9OSH0npA4Fj43MaUvO0B7FVTO3im_F6SRVIsJ_NbxYiLv_-eMlKnGD8SlI1TpheTyJEpipd6maL6VCfSaeJ7cvect-UImoQQ4UJNYg0Wo1otOQPUO5rDMSg1hggkDbin_XEBs126LthPnLt9Rv-Tosvoz9UsYI-X0sI66FbPjUERbHaVhUpR_RGOaijBp47oEdTXPtlFl2vIj_PdJUGweeii86IqDvCEayU-bhAlU2agf4mmS88nW8ONNVDKpNdHl3Y4SdnPhsMh3hvd1dZ2h_Tkh9J6QOBY-NzGlLztAexVUzt4puDZNRaifXhNCs_BugWVA5o/1686846423302?errorImage=false')">
          <!-- <img src="img/main-coffe.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content">
            <div class="main-movie-tittle">Transformers: Rise of the Beasts</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i> 7.5</div>
              <div class="main-genres">Genres: Action, Adventure, Sci-fi</div>
            </div>
            <p>Director: Steven Caple Jr.</p>
            <p class="text-truncate">When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.</p>
            <a href="MovieDetailController?movieid=6" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
          </main>
        </div>
        
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <!-- Carousel End -->

    <!-- Main Section Start-->
    <div class="main-container">
      <section class="main-content-1">
        <h3>Latest Movies <span class="content-1"></span></h3>
        <div class="card-container">
        <% for (Item i: latest) { %>
          <a href="MovieDetailController?movieid=<%= i.getMovieid()%>">
            <div class="card">
              <div class="card-img">
                <div class="card-rating"><i class="bi bi-star star-1"></i> <%= i.getRating() %></div>
                <img
                  src="<%= i.getImg() %>"
                  alt=""
                />
              </div>
              <div class="card-body">
                <div class="card-tittle"><%= i.getMoviename() %></div>
              </div>
            </div>
          </a>
          <% } %>
        </div>

        <h3>Best Rating <span class="content-2"></span></h3>
        <div class="card-container">
        <% for(Item l: trending) {%>
          <a href="MovieDetailController?movieid=<%= l.getMovieid()%>">
            <div class="card">
              <div class="card-img">
                <div class="card-rating"><i class="bi bi-star star-1"></i> <%= l.getRating() %></div>
                <img src="<%= l.getImg() %>" alt="" />
              </div>
              <div class="card-body">
                <div class="card-tittle"><%= l.getMoviename() %></div>
              </div>
            </div>
          </a>
         <% } %>
        </div>

        <h3>Recommended for You <span class="content-3"></span></h3>
        <div class="card-container">
        <% for(Item r: recommended){ %>
          <a href="MovieDetailController?movieid=<%= r.getMovieid()%>">
            <div class="card">
              <div class="card-img">
                <div class="card-rating"><i class="bi bi-star star-1"></i> <%= r.getRating() %></div>
                <img src="<%= r.getImg() %>" alt="" />
              </div>
              <div class="card-body">
                <div class="card-tittle"><%= r.getMoviename() %></div>
              </div>
            </div>
          </a>
          <% } %>
        </div>
      </section>
      <!-- Side Right Start -->
      <div class="side-right">
        <h5>Comming Soon</h5>
        <% for(Item c : commingsoon) { %>
        <a href="">
          <div class="side-card">
            <div class="side-card-img">
              <div class="card-soon">Comming Soon</div>
              <img src="<%= c.getImg() %>" alt="" />
            </div>

            <div class="side-card-body">
              <div class="side-card-tittle"><%= c.getMoviename() %></div>
            </div>
          </div>
        </a>
        <% } %>

        <h5 style="margin-top: 40px">Released Year</h5>
        <div class="list-year">
        <% for(Year sy : countYear) { %>
          <a href="MovieAllController?genreid=&&yearid=<%= sy.getYearid() %>&&countryid="
            ><div class="list">
              <span><%= sy.getMovie_count() %> <i class="bi bi-list-task"></i></span><%= sy.getYearindex() %>
            </div></a
          >
        <% } %>
          <div class="side-dropdown-year">
            <div class="layer-1">
              <i class="bi bi-caret-down-fill arrow-year"></i>
              <div class="layer-2">
                <h5 style="background-color: black">Genres</h5>
                <div class="list-genres">
                <% for(Genre sg : genre) { %>
                  <a href="MovieAllController?genreid=<%= sg.getGenreid() %>&&yearid=&&countryid="><div class="genre"><%= sg.getGenrename() %></div></a>
                <% } %>
                  <div class="layer-3">
                    <div class="side-dropdown-genres"><i class="bi bi-caret-down-fill arrow-genres"></i></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Side Right End -->
    </div>
    <!-- Main Section End -->

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
    <script src="script.js"></script>

</body>
</html>