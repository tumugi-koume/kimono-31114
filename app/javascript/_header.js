function pullDown(){

  const pullDownButton = document.getElementById("menu-logo")
  const pullDownLists = document.getElementById("pull-down")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;")
  })

  pullDownLists.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownParents.removeAttribute("style", "display:none;")
  })

  pullDownLists.addEventListener('mouseout', function(){
    pullDownParents.removeAttribute("style", "display:none;")
  })

}

window.addEventListener('load', pullDown)