
window.editContact = (orgId, tableId, objectId) -> editContact(orgId, tableId, objectId)

window.viewContact = (orgId, tableId, objectId) -> viewContact(orgId, tableId, objectId)

window.saveContact = (orgId, tableId, objectId) -> saveContact(orgId, tableId, objectId)



editContact = (orgId, tableId, objectId) ->
  contact = contactOfViewMode(orgId, tableId, objectId);
  window.oldContact = contact
  content = editTemplate
    .replace(/{#orgId}/g,       contact.organizationId.toString())
    .replace(/{#tableId}/g,     contact.tableId.toString())
    .replace(/{#objectId}/g,    contact.objectId.toString())
    .replace(/{#firstName}/g,   contact.firstName.toString())
    .replace(/{#lastName}/g,    contact.lastName.toString())
    .replace(/{#email}/g,       contact.email.toString());
  $('#row_' + orgId + '_' + tableId + '_' + objectId).html(content);

viewContact = (orgId, tableId, objectId) ->
  contact = window.oldContact
  content = viewTemplate
      .replace(/{#orgId}/g,       contact.organizationId.toString())
      .replace(/{#tableId}/g,     contact.tableId.toString())
      .replace(/{#objectId}/g,    contact.objectId.toString())
      .replace(/{#firstName}/g,   contact.firstName.toString())
      .replace(/{#lastName}/g,    contact.lastName.toString())
      .replace(/{#email}/g,       contact.email.toString());
  $('#row_' + orgId + '_' + tableId + '_' + objectId).html(content);

saveContact = (orgId, tableId, objectId) ->
  contact = contactOfEditMode(orgId, tableId, objectId)
  $.ajax({
    type: 'PUT',
    url: '/contact',
    contentType: 'application/json',
    data: $.toJSON(contact),
    success: (res) ->
      window.oldContact = contact
      viewContact(orgId, tableId, objectId)
      window.oldContact = null
  });


contactOfViewMode = (orgId, tableId, objectId)->
  organizationId : orgId,
  tableId : tableId,
  objectId : objectId,
  firstName : $('#firstName_' + orgId + '_' + tableId + '_' + objectId)[0].innerText.trim(),
  lastName : $('#lastName_' + orgId + '_' + tableId + '_' + objectId)[0].innerText.trim(),
  email : $('#email_' + orgId + '_' + tableId + '_' + objectId)[0].innerText.trim()

contactOfEditMode = (orgId, tableId, objectId) ->
  organizationId : orgId,
  tableId : tableId,
  objectId : objectId,
  firstName : $('#firstName_' + orgId + '_' + tableId + '_' + objectId)[0].value.trim(),
  lastName : $('#lastName_' + orgId + '_' + tableId + '_' + objectId)[0].value.trim(),
  email : $('#email_' + orgId + '_' + tableId + '_' + objectId)[0].value.trim()


editTemplate = """
<form>
    <input type="hidden" id="organizationId" value="{#orgId}"></input>
    <input type="hidden" id="tableId" value="{#tableId}"></input>
    <input type="hidden" id="objectSeq" value="{#objectId}"></input>
    <td class="col-xs-2">{#orgId}</td>
    <td class="col-xs-2">{#tableId}</td>
    <td class="col-xs-1">{#objectId}</td>
    <td class="col-xs-1">
      <input type="text" class="form-control" id="firstName_{#orgId}_{#tableId}_{#objectId}" name="firstName" placeholder="First Name" value="{#firstName}"/>
    </td>
    <td class="col-xs-1">
      <input type="text" class="form-control" id="lastName_{#orgId}_{#tableId}_{#objectId}" name="lastName" placeholder="Last Name" value="{#lastName}"/>
    </td>
    <td class="col-xs-3">
      <input type="text" class="form-control" id="email_{#orgId}_{#tableId}_{#objectId}" name="email" placeholder="EMail" value="{#email}"/>
    </td>
    <td class="col-xs-2">
      <div class="minibutton ok"
        onclick="javascript:window.saveContact('{#orgId}', '{#tableId}', '{#objectId}')">Save
      </div>
      <div class="minibutton ok"
        onclick="javascript:window.viewContact('{#orgId}', '{#tableId}', '{#objectId}')">Cancel
      </div>
    </td>
</form>
"""

viewTemplate =
"""
<td class="col-xs-2">{#orgId}</td>
<td class="col-xs-2">{#tableId}</td>
<td class="col-xs-1">{#objectId}</td>
<td class="col-xs-1">
    <label id="firstName_{#orgId}_{#tableId}_{#objectId}">
    {#firstName}
    </label>
</td>
<td class="col-xs-1">
    <label id="lastName_{#orgId}_{#tableId}_{#objectId}">
    {#lastName}
    </label>
</td>
<td class="col-xs-3">
    <label id="email_{#orgId}_{#tableId}_{#objectId}">
    {#email}
    </label>
</td>
<td class="col-xs-2">
    <div id="actions_{#orgId}_{#tableId}_{#objectId}">
        <div class="minibutton ok"
             onclick="javascript:window.editContact('{#orgId}', '{#tableId}', '{#objectId}')">Edit
        </div>
    </div>
</td>
"""

