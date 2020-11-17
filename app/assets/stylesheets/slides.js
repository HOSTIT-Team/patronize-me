const slideArea = document.querySelector("div.slides")
const images = slideArea.querySelectorAll("img")

let currentSlide = 0
let z = 1

slideArea.addEventListener("click", function () {
  currentSlide = currentSlide + 1

  if (currentSlide > images.length -1){
    currentSlide = 0
  }

  z = z + 1

  images.forEach(image => {
    image.style.animation = ""
  })

  images[currentSlide].style.zIndex = z
  images[currentSlide].style.animation = "fade 0.5s"
})

slideArea.addEventListener("mouseover", function () {
  images.forEach(image => {
    const x = 100 * Math.random() - 50
    const y = 100 * Math.random() - 50

    image.style.transform = 'translate($(x)px, $(y)px)'
  })
})
