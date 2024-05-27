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
});
