delay = (ms, func) -> setTimeout func, ms
delay 1000, ->
  $("#image").hide()
  $("#questions").show()