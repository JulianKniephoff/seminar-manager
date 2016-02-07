
@toggleClass = (id, cssClass) ->
  obj = document.getElementById(id)
  regex = new RegExp("(?:^|\\s)" + cssClass +  "(?!\\S)", "g")
  if (obj.className.match(regex))
    obj.className = obj.className.replace(regex , '')
  else
    obj.className += " " + cssClass
