/**
 * 
 */

 const navbar = document.querySelector(".navbar");

window.addEventListener("scroll", function () {
  let scrollPosition = window.scrollY;

  if (scrollPosition > 80) {
    navbar.classList.add("nav-opacity");
  } else {
    navbar.classList.remove("nav-opacity");
  }
});

// Dropdown Genres
const dropdownGenres = document.querySelector(".dropdown-genres");
const genreButton = document.querySelector(".genre-button");
genreButton.addEventListener("click", function (e) {
  dropdownGenres.classList.toggle("active");
  e.preventDefault();
});

// Dropdown Year
const dropdownYear = document.querySelector(".dropdown-year");
const YearButton = document.querySelector(".year-button");
YearButton.addEventListener("click", function (e) {
  dropdownYear.classList.toggle("active");
  e.preventDefault();
});

// Dropdown Country
const dropdownCountry = document.querySelector(".dropdown-country");
const countryButton = document.querySelector(".country-button");
countryButton.addEventListener("click", function (e) {
  dropdownCountry.classList.toggle("active");
  e.preventDefault();
});

// Side Bar Menu Year
const sideYear = document.querySelector(".arrow-year");
const sideDropdownYear = document.querySelector(".side-dropdown-year");
sideYear.addEventListener("click", function (e) {
  sideDropdownYear.classList.toggle("down");
  e.preventDefault();
});

// Side Bar Menu Genres
const sideGenres = document.querySelector(".arrow-genres");
const sideDropdownGenres = document.querySelector(".side-dropdown-genres");
sideGenres.addEventListener("click", function (e) {
  sideDropdownGenres.classList.toggle("down");
  e.preventDefault();
});

document.addEventListener("click", function (e) {
  // "target" ini adalah saat  mouse di klik
  if (!genreButton.contains(e.target)) {
    dropdownGenres.classList.remove("active");
  }
  if (!YearButton.contains(e.target)) {
    dropdownYear.classList.remove("active");
  }
  if (!countryButton.contains(e.target)) {
    dropdownCountry.classList.remove("active");
  }
   if (!hamburgerButton.contains(e.target) && !hamburgerMenu.contains(e.target)) {
    hamburgerMenu.classList.remove("hbg-menu");
  }
});


// Hamburger Button
const hamburgerButton = document.querySelector(".hamburger-button");
const hamburgerMenu = document.querySelector(".hamburger-menu");
hamburgerButton.addEventListener("click", function (e) {
  hamburgerMenu.classList.toggle("hbg-menu");
});

// Hbg menu genres
const hbgGenreButton = document.querySelector(".hbg-genre-button");
const hbgGenres = document.querySelector(".hbg-genres");
hbgGenreButton.addEventListener("click", function (e) {
  hbgGenres.classList.toggle("hbg-down");
  e.preventDefault();
});

// Hbg menu year
const hbgYearButton = document.querySelector(".hbg-year-button");
const hbgYear = document.querySelector(".hbg-year");
hbgYearButton.addEventListener("click", function (e) {
  hbgYear.classList.toggle("hbg-down");
  e.preventDefault();
});

// Hbg menu country
const hbgCountryButton = document.querySelector(".hbg-country-button");
const hbgCountry = document.querySelector(".hbg-country");
hbgCountryButton.addEventListener("click", function (e) {
  hbgCountry.classList.toggle("hbg-down");
  e.preventDefault();
});
