
// navigation

const nav = document.querySelector(".main-nav")
const navToggler = document.querySelector(".nav-toggler")
const togglerImg = navToggler.querySelector("img")
const navLinks = document.querySelectorAll(".main-nav a")
navLinks.forEach(link => link.addEventListener("click", toggleNav ))

navToggler.addEventListener("click", toggleNav)

function toggleNav(){
    console.log("salut")
    nav.classList.toggle("active");
    if(togglerImg.src.includes("hamburger")){
        togglerImg.src = "/assets/img/cross.svg"
    } else{
        togglerImg.src = "/assets/img/hamburger.svg"
    }
}