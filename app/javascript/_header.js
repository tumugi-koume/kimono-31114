function pullDown(){

  const pullDownButton = document.getElementById("menu")
  const pullDownParents = document.getElementById("pull-down")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownParents.removeAttribute("style", "display:none;")
  })

  // pullDownButton.addEventListener('click', function(){
  // })
}

window.addEventListener('load', pullDown)