window.viewSite = (siteId) ->
  $("#view_site_id_"+siteId).submit()

window.deleteSite = (siteId) ->
  $.ajax({
        type: 'DELETE',
        url: '/site/' + siteId,
        contentType: 'application/json',
        data: '{"id": '+siteId+'}',
        success: (res) ->
          $("#site_row_id_"+ siteId).detach()
      });
