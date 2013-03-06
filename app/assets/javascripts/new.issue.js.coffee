question_tpl = '<div class="control-group"><div class="controls"><input size="30" type="text" name="issue[questions_attributes][%key][body]" data-validates="presence|minlength:3|maxlength:255" class="question-field"> <a class="btn remove_question"><i class="icon-minus"></i> Remove</a></div></div>'

questions = key = 1

$("#add_question").click (event)->
  
  event.preventDefault()

  $("#questions").append(question_tpl.replace(/%key/, key))
  key += 1
  questions += 1


  $("#add_question").hide() if questions == 4


$(".remove_question").live('click', ->
  $(this).parent().parent().remove()
  questions -= 1
  $("#add_question").show()
)


validates_params =
  error: (err_field)->
    $(err_field).parent().parent().addClass('error')
  ,
  ok: (ok_field)->
    $(ok_field).parent().parent().removeClass('error')

$("#new_issue").validates(validates_params)
