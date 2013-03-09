$ ->
  $("#start_test").click ->
    $("#instructions").hide()
    $("#image").show()

    delay = (ms, func) -> setTimeout func, ms
    delay 6000, ->
      $("#image").hide()
      $("#questions").show()
      $("#answer_field_1").focus()

  window.question = 1

  $('.answer-field').keypress (e) ->
    if (e.which == 13)
      next_question(e)
      e.preventDefault()

  $('.next_question').click (e) -> next_question(e)

  next_question = (e) ->
    e.preventDefault()
    $("#question_#{window.question}").hide()
    window.question+=1
    next = $("#question_#{window.question}")
    $('#answer').submit() if next.length == 0
    next.show()
    $("#answer_field_#{window.question}").focus()
