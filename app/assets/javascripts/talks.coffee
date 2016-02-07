# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleTalkDetails = (id) ->
  toggleClass(id, "active")


@expandAll = ->
  button = document.getElementById("show-all-talks");
  if button.innerHTML == "Alle ausklappen"
    for elem in document.getElementsByClassName("talk-detail")
      elem.className += " active" if elem.className.indexOf("active") == -1
    button.innerHTML = "Alle einklappen"
  else
    elems = document.getElementsByClassName("talk-detail active")
    for i in [0...elems.length]
      console.log(elems[0])
      elems[0].className = "talk-detail"
    button.innerHTML = "Alle ausklappen"

@talkReady = ->
  # attach onclick handler for table rows
  for tr in document.getElementsByClassName("talk-title")
    detailId = tr.id;
    do (detailId) ->
      chs = Array.prototype.slice.call(tr.children)
      for td in chs.slice(0, chs.length - 1)
        td.onclick = ->
          toggleTalkDetails(detailId.replace("title", "detail"))

  # attach button handler
  document.getElementById("show-all-talks").onclick = expandAll



$(document).ready(talkReady)
