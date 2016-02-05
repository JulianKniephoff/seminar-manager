# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleTopicDetails = (id) ->
  # reset all classes (remove `active`)
  for elem in document.getElementsByClassName("topic-detail active")
    elem.className = "topic-detail" if elem.id != id
  toggleClass(id, "active")


toggleClass = (id, cssClass) ->
  obj = document.getElementById(id)
  regex = new RegExp("(?:^|\\s)" + cssClass +  "(?!\\S)", "g")
  if (obj.className.match(regex))
    obj.className = obj.className.replace(regex , '')
  else
    obj.className += " " + cssClass

@topicReady = ->
  for tr in document.getElementsByClassName("topic-title")
    detailId = tr.id;
    do (detailId) ->
      chs = Array.prototype.slice.call(tr.children)
      for td in chs.slice(0, chs.length - 1)
        td.onclick = ->
          toggleTopicDetails(detailId.replace("title", "detail"))

$(document).ready(topicReady)
