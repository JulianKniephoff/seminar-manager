# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@toggleTalkDetails = (id) ->
  # reset all classes (remove `active`)
  for elem in document.getElementsByClassName("talk-detail active")
    elem.className = "talk-detail" if elem.id != id
  toggleClass(id, "active")

@talkReady = ->
  for tr in document.getElementsByClassName("talk-title")
    detailId = tr.id;
    do (detailId) ->
      chs = Array.prototype.slice.call(tr.children)
      for td in chs.slice(0, chs.length - 1)
        td.onclick = ->
          toggleTalkDetails(detailId.replace("title", "detail"))

$(document).ready(talkReady)
