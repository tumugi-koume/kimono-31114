function pullDown(){

  // 検索
  const searchButton = document.getElementById("search-logo")
  const searchParents = document.getElementById("search-pull-down")

  searchButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.5;")
  })

  searchButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 0.5;")
  })

  searchButton.addEventListener('click', function(){
    if (searchParents.getAttribute("style") == "display:block;"){
      searchParents.removeAttribute("style", "display:block;")
    } else {
      searchParents.setAttribute("style", "display:block;")
    }
  })

  // メニュー
  const menuButton = document.getElementById("menu-logo")
  const menuParents =document.getElementById("pull-down")

  menuButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.5;")
  })

  menuButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 0.5;")
  })

  menuButton.addEventListener('click', function(){
    if (menuParents.getAttribute("style") == "display:block;"){
      menuParents.removeAttribute("style", "display:block;")
    } else {
      menuParents.setAttribute("style", "display:block;")
    }
  })

}

window.addEventListener('load', pullDown)