const slideArea = document.querySelector("div.slides")
const images = slideArea.querySelectorAll("img")

let currentSlide = 0
let z = 1

slideArea.addEventListener("click", function () {
  currentSlide = currentSlide + 1
  z = z + 1

  images[currentSlide].style.zIndex = z
})
