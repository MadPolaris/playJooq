window.abort = (id) ->
  $("#abortSpidermanForm").submit()

window.delete = (id) ->
  $.ajax({
        type: 'DELETE',
        url: '/spiderman/' + id,
        contentType: 'application/json',
        data: '{"id": '+id+'}',
        success: (res) ->
          $("#spiderman_id_"+id).detach()
  });

window.fork = (id) ->
  $("#fork_form_"+id).submit()