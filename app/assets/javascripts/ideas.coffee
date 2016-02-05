# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleTopicDetails = (id) ->
  # reset all classes (remove `active`)
  for elem in document.getElementsByClassName("topic-detail active")
    elem.className = "topic-detail";
  toggleClass(id, "active")


toggleClass = (id, cssClass) ->
  obj = document.getElementById(id)
  regex = new RegExp("(?:^|\\s)" + cssClass +  "(?!\\S)", "g")
  if (obj.className.match(regex))
    obj.className = obj.className.replace(regex , '')
  else
    obj.className += " " + cssClass
