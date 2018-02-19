$(document).on 'turbolinks:load', ->
  $('select').material_select();

$(document).on 'turbolinks:before-cache', ->
  $('select').material_select('destroy')
  $('.toast').remove();

$(document).on 'turbolinks:load', ->

  $('.update_task').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'PUT'
        dataType: 'json',
        data: $(".update_task").serialize()
        success: (data, text, jqXHR) ->
          Materialize.toast('Task updated', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Error on update Task', 4000, 'red')
    return false

  $('.remove_task').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {}
        success: (data, text, jqXHR) ->
          $(location).attr('href','/tasks');
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem on remove Task', 4000, 'red')
    return false
