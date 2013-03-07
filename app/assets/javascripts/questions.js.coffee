delay = (ms, func) -> setTimeout func, ms
delay 1000, ->
  $("#image").hide()
  $("#questions").show()


window.question = 1
$ ->
  $('.next_question').click (e) ->
    $("#question_#{window.question}").hide()
    window.question+=1
    next_question = $("#question_#{window.question}")
    $('#answer').submit() if next_question.length == 0
    next_question.show()
    e.preventDefault()
