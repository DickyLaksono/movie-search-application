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
    List<Item> movies = (List<Item>) request.getAttribute("movies");
    String word = (String) request.getAttribute("word");
    List<Genre> genre = (List<Genre>) request.getAttribute("genre");
    List<Year> year = (List<Year>) request.getAttribute("year");
    List<Countries> countries = (List<Countries>) request.getAttribute("countries");
	
    User user= (User) session.getAttribute("user");
	String email = (String) session.getAttribute("email");
	
    %>
    
<title>All Movies</title>
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

      <!-- Dropdown Genres -->
      <div class="dropdown-genres">
      <% for(Genre g : genre){ %>
        <a href="MovieAllController?genreid=<%= g.getGenreid() %>&&yearid=&&countryid="><div class="nav-genre"><%= g.getGenrename() %></div></a>
      <% } %>
      </div>

      <!-- Dropdown Year -->
      <div class="dropdown-year">
      <% for(Year y : year){ %>
        <a href="MovieAllController?genreid=&&yearid=<%= y.getYearid() %>&&countryid="><div class="nav-year"><%= y.getYearindex() %></div></a>
      <% } %>
      </div>

      <!-- Dropdown Country -->
      <div class="dropdown-country">
      <% for(Countries c : countries){ %>
        <a href="MovieAllController?genreid=&&yearid=&&countryid=<%=c.getCountryid() %>"><div class="nav-country"><%= c.getCountryname() %></div></a>
      <% } %>
      </div>
    </nav>
    <!-- navbar end -->

    <!-- Carousel Start -->
    <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item item-1 active" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG9G_B_Keppc13LQzrtMiqWAUaE1jbiQ-UAN_Sgc7N9exp6QaOOdNCdNhGtxGe7ucCmhOPlvbjxAe-g_GQ_t4p8zMj63tfbDGovofC6l_iQ9GpBlLdkMawjnED_rK9vAjyuMC-XWDjli0HtivWR34Ilc=/434809.jpg?errorImage=false')">
          <!-- <img src="img/banner-movies-1.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content"style="">
            <div class="main-movie-tittle">The Lord of the Rings: The Fellowship of the Ring</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i>8.9</div>
              <div class="main-genres">Genres: Action, Adventure, Drama, Fantasy</div>
            </div>
            <p>Director: Peter Jackson</p>
            <p class="text-truncate">An ancient Ring thought lost for centuries has been found, and through a strange twist of fate has been given to a small Hobbit named Frodo. When Gandalf discovers the Ring is in fact the One Ring of the Dark Lord Sauron, Frodo must make an epic quest to the Cracks of Doom in order to destroy it. However, he does not go alone. He is joined by Gandalf, Legolas the elf, Gimli the Dwarf, Aragorn, Boromir, and his three Hobbit friends Merry, Pippin, and Samwise. Through mountains, snow, darkness, forests, rivers and plains, facing evil and danger at every corner the Fellowship of the Ring must go. Their quest to destroy the One Ring is the only hope for the end of the Dark Lords reign.</p>
            <a href="MovieDetailController?movieid=25" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
          </main>
        </div>
        <div class="carousel-item item-2" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG2joAh_GZ4I0SzK0jdeNatFpTqHK0H09kQm4eWUNhk_U2mat7DmT4O9jX3ohNKyLbnvXvlcbHuACGIPgUS1tJoSyyl9X8jARS9G09LzfTK6ZIOeaaz5Tvi_wbtbDASWxOA98pyHwWYn-A5r752vuTCMeuIBWLJlp-C5nkg2AqbkFA5KimZXuUspwyDPNtjDkfAvAV7dYrnY_QMj2XNix_6GDZNRaifXhNCs_BugWVA5o/interstellar_banner.png?errorImage=false')">
          <!-- <img src="img/banner-movies-1.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content">
            <div class="main-movie-tittle">Interstellar</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i> 8.7</div>
              <div class="main-genres">Genres: Adventure, Drama, Sci-fi</div>
            </div>
            <p>Director: Christopher Nolan</p>
            <p class="text-truncate">Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.</p>
            <a href="MovieDetailController?movieid=21" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
          </main>
        </div>
        <div class="carousel-item item-3" style="background-image:url('https://msp.c.yimg.jp/images/v2/FUTi93tXq405grZVGgDqG9TgtPlluOrAqlXnGFHfnWXCkH_usoq9MHOYlyFmQQgvB4f4mJU9_Unl7Vd1nVt2sWEAwy-Bjk3LfEztmhYIrExnae5QVqaB7mo5GCkP7KI0xQhyljdFpe63ojB9NoU8XSw3HABh_2mzLcD45rofg2naW1dks-fyNFmxGpuJC1kmvv0SQpiOSQaTi3YocwR7IU7LWK45BGdy3ocQeYqqJtU=/m8JTwHFwX7I7JY5fPe4SjqejWag.jpg?errorImage=false')">
          <!-- <img src="img/main-coffe.jpg" class="d-block w-100" alt="..." /> -->
          <main class="content">
            <div class="main-movie-tittle">Ant-Man and the Wasp</div>
            <div class="main-movie-genres">
              <div class="star"><i class="bi bi-star"></i> 7.0</div>
              <div class="main-genres">Genres: Adventure, Sci-fi</div>
            </div>
            <p>Director: Peyton Reed</p>
            <p class="text-truncate">Tepat ketika waktunya dalam tahanan rumah akan segera berakhir, Scott Lang sekali lagi mempertaruhkan kebebasannya untuk membantu Hope van Dyne dan Dr. Hank Pym terjun ke dunia kuantum dan mencoba mencapai, melawan waktu dan peluang sukses, sebuah misi penyelamatan yang sangat berbahaya.</p>
            <a href="MovieDetailController?movieid=11" style="z-index:9999;">Detail <i class="bi bi-box-arrow-up-right"></i></a>
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

    <!-- Main Content -->
    <div class="main-container">
      <section class="main-content-1">
        <h3>All Movies <span class="content-4"></span></h3>
        <div class="card-container">
        <% for(Item i : movies){ %>
          <a href="MovieDetailController?movieid=<%= i.getMovieid()%>">
            <div class="card">
              <div class="card-img">
                <div class="card-rating"><i class="bi bi-star star-1"></i> <%= i.getRating() %></div>
                <img src="<%= i.getImg() %>" alt="" />
              </div>
              <div class="card-body">
                <div class="card-tittle"><%= i.getMoviename() %></div>
              </div>
            </div>
          </a>
        <% } %>
        </div>
      </section>
      <div class="side-right">
        <h5 style="margin-top: 10px">Released Year</h5>
        <div class="check-container-1">
        <% int index = 1; %>
          <form action="">
          <% for(Year y: year){ %>
            <label for="year-<%= index++ %>"> <input type="checkbox" name="year-<%= index++ %>" value="year-<%=index++%>" id="year<%= index++ %>" /> <%= y.getYearindex() %></label>
          <% } %>
          </form>
        </div>
        <h5 style="margin-top: 30px">Genres</h5>
        <div class="check-container-2">
          <form action="">
            <label for="all"> <input type="checkbox" name="all" value="all" checked="checked" id="all" /> All</label>
            <% for(Genre g: genre){ %>
            <label for="genre-<%= index++ %>"> <input type="checkbox" name="genre-<%= index++ %>" value="genre-<%= index++ %>" id="genre-<%= index++ %>" /> <%= g.getGenrename() %></label>
            <% } %>
          </form>
        </div>
        <h5 style="margin-top: 30px">Country</h5>
        <div class="check-container-2">
          <form action="">
          <% for(Countries c: countries){ %>
            <label for="country-<%= index++ %>"> <input type="checkbox" name="country-<%= index++ %>" value="country-<%= index++ %>" id="country-1" /> <%= c.getCountryname() %></label>
          <% } %>
          </form>
        </div>
      </div>
    </div>
    
     <div class="page-container">
      <a href="MovieAllController?genreid=&&countryid=&&yearid=&&page=1" class="page"><i class="bi bi-caret-left"></i></a>
      <a href="MovieAllController?genreid=&&countryid=&&yearid=&&page=1" class="page">1</a>
      <a href="MovieAllController?genreid=&&countryid=&&yearid=&&page=2" class="page">2</a>
      <a href="MovieAllController?genreid=&&countryid=&&yearid=&&page=2" class="page"><i class="bi bi-caret-right"></i></a>
    </div>
    <!-- Main Content -->

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