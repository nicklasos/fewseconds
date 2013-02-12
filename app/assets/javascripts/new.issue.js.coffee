question_tpl = '<div class="field"><input size="30" type="text" name="issue[questions_attributes][%key][body]"> <a class="btn remove_question"><i class="icon-minus"></i> Remove</a></div>'

questions = key = 1

$("#add_question").click (event)->
  
  event.preventDefault()

  $("#questions").append(question_tpl.replace(/%key/, key))
  key += 1
  questions += 1


  $("#add_question").hide() if questions == 4


$(".remove_question").live('click', ->
  $(this).parent().remove()
  questions -= 1
  $("#add_question").show()
)
