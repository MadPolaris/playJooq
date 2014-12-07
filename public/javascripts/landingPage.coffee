editEnglishNameTd =
"""
<input id="english_name_id_{#id}" class="form-control col-xs-1" value="{#val}"></input>
"""

saveActionTd=
"""
<button type="button" class="btn btn-danger" onclick="javascript:window.savePage({#id})">Save</button>
"""

viewModeActionsTd=
"""
 <button type="button" class="btn btn-primary" onclick="javascript:window.editPage({#id})">Edit</button>
 <button type="button" class="btn btn-danger" onclick="javascript:window.deletePage({#id})">Delete</button>
"""

window.editPage = (pageId) ->
  $("#english_name_td_id_" + pageId).html(editEnglishNameTd.replace(/{#id}/g, pageId).replace(/{#val}/g, $("#english_name_td_id_" + pageId)[0].innerHTML))
  $("#actions_td_id_" + pageId).html(saveActionTd.replace(/{#id}/g, pageId))

window.deletePage = (pageId) ->
  $.ajax({
      type: 'DELETE',
      url: '/landingPage/' + pageId,
      contentType: 'application/json',
      data: '{"id": '+pageId+'}',
      success: (res) ->
        $("#page_row_id_"+ pageId).detach()
    });

window.savePage = (pageId) ->
  englishName = $("#english_name_id_"+pageId)[0].value
  $("#english_name_td_id_" + pageId).html(englishName)
  $.ajax({
    type: 'PUT',
    url: '/landingPage/' + pageId,
    data: '{"englishName": "' + englishName + '"}',
    contentType: 'application/json',
    success: (res) ->
      $("#actions_td_id_" + pageId).html(viewModeActionsTd.replace(/{#id}/g, pageId))

  });
