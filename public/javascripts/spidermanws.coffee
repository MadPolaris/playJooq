String::withLink = ->
  this.split("\n").map (step) ->
    lastIndex = step.lastIndexOf("http")
    prefix = step.substring(0, lastIndex)
    postfix = step.substring(lastIndex).trim()
    prefix + postfix.replace /(https?[^\n|\s]*)/gi,  "<a href=\"$1\">$1</a><br/>"
  .join("\n")

String::urlReplace = (pattern, replacement) ->
  this.replace(pattern, replacement.replace(/\-/g,"####").replace(/\$\&/g, "##@@")).replace(/####/g, "\-").replace(/##/g, "\$").replace(/@@/g, "&")


bugOfViewMode = (id)->
  id : id,
  spidermanId : $("#spidermanId_" + id)[0].value.trim(),
  responseCode : $("#responseCode_" + id)[0].value.trim(),
  createdOn : $("#createdOn_" + id)[0].value.trim(),
  state : $("#state_" + id)[0].value.trim(),
  title : $("#title_id_" + id)[0].innerText.trim(),
  actions : $("#actions_id_" + id)[0].innerText.trim(),
  expects : $("#expects_id_" + id)[0].innerText.trim(),
  actuals : $("#actuals_id_"+id)[0].innerText.trim(),
  errors : $("#errors_id_" + id)[0].innerText.trim(),
  additionals : $("#additional_id_" + id)[0].innerText.trim()

bugOfEditMode = (id) ->
  id : id,
  spidermanId : $("#spidermanId_" + id)[0].value.trim(),
  responseCode : $("#responseCode_" + id)[0].value.trim(),
  createdOn : $("#createdOn_" + id)[0].value.trim(),
  state : $("#state_" + id)[0].value.trim(),
  title : $("#title_id_" + id)[0].value.trim(),
  actions : $("#actions_id_" + id)[0].value.trim(),
  expects : $("#expects_id_" + id)[0].value.trim(),
  actuals : $("#actuals_id_"+id)[0].value.trim(),
  errors : $("#errors_id_" + id)[0].value.trim(),
  additionals : $("#additional_id_" + id)[0].value.trim()


onError = (message) ->
  id = message.error.id
  $("#HttpErrorFound").html("<label>" + message.quantity + "</label>")
  bug = message.error
  content = viewTemplate
    .urlReplace(/{#spidermanId}/g,   bug.spidermanId.toString())
    .urlReplace(/{#responseCode}/g,  bug.responseCode.toString())
    .urlReplace(/{#createdOn}/g,     bug.createdOn)
    .urlReplace(/{#state}/g,         bug.state)
    .urlReplace(/{#title}/g,         bug.title.withLink())
    .urlReplace(/{#actions}/g,       bug.actions.withLink())
    .urlReplace(/{#expects}/g,       bug.expects.withLink())
    .urlReplace(/{#actuals}/g,       bug.actuals.withLink())
    .urlReplace(/{#errors}/g,        bug.errors.withLink())
    .urlReplace(/{#additionals}/g,   bug.additionals.withLink().replace(/\n/g, "<br/>"))
    .urlReplace(/{#id}/g, id.toString())
  $("#bugsContainer").append(oddPanel.replace(/{#id}/g, id).replace("{#content}", content))

counter = 0

container = () ->
  counter += 1
  if (counter % 2 == 0)
    evenPanel
  else
    oddPanel

oddPanel =
"""
<div id="bug_id_{#id}" class="row panel panel-success">{#content}</div>
"""

evenPanel =
"""
<div id="bug_id_{#id}" class="row panel panel-warning">{#content}</div>
"""



editTemplate = """
<input type="hidden" id="bugId_{#id}" name="id" value="{#id}"></input>
<input type="hidden" id="spidermanId_{#id}" name="spidermanId" value="{#spidermanId}"></input>
<input type="hidden" id="responseCode_{#id}" name="responseCode" value="{#responseCode}"></input>
<input type="hidden" id="createdOn_{#id}" name="createdOn" value="{#createdOn}"></input>
<input type="hidden" id="state_{#id}" name="state" value="{#state}"></input>
<div class="panel-heading">
    <div class="panel-heading">
    Bug&nbsp;{#id}:&nbsp;<input type="text" class="form-control" id="title_id_{#id}" name="title" placeholder="Title" value="{#title}"/>
</div>
</div>
<div class="panel-body">

    <label style="margin:5px">Action Performed</label><br/>
    <textarea class="col-xs-12 form-control" rows="5" id="actions_id_{#id}" name="actionPerformed">
{#actions}
    </textarea>

    <label style="margin:5px">Expected Results</label><br/>
    <textarea class="col-xs-12 form-control" rows="2" id="expects_id_{#id}" name="expectedResult">
{#expects}
    </textarea>
    <label style="margin:5px">Actual Results</label><br/>
    <textarea class="col-xs-12 form-control" rows="2" id="actuals_id_{#id}" name="actualResult">
{#actuals}
    </textarea>
    <label style="margin:5px">Error Message</label><br/>
    <textarea class="col-xs-12 form-control" rows="2" id="errors_id_{#id}" name="errorMessage">
{#errors}
    </textarea>
    <label style="margin:5px">Additional Environment Info</label><br/>
    <textarea class="col-xs-12 form-control" rows="4" id="additional_id_{#id}" name="additionalInfo">
{#additionals}
    </textarea>
</div>
<div class="minibutton ok" onclick="javascript:window.deleteSpiderman({#id})">Delete</div>
<div class="minibutton ok" onclick="javascript:window.lockSpiderman({#id})">Lock</div>
<div class="minibutton ok" onclick="javascript:window.completeSpiderman({#id})">Complete</div>
<div class="minibutton ok" onclick="javascript:window.viewSpiderman({#id})">View</div>
<div class="minibutton ok" onclick="javascript:window.saveSpiderman({#id})">Save</div>
"""

viewTemplate =
"""
<input type="hidden" id="bugId_{#id}" name="id" value="{#id}"></input>
<input type="hidden" id="spidermanId_{#id}" name="spidermanId" value="{#spidermanId}"></input>
<input type="hidden" id="responseCode_{#id}" name="responseCode" value="{#responseCode}"></input>
<input type="hidden" id="createdOn_{#id}" name="createdOn_{#id}" value="{#createdOn}"></input>
<input type="hidden" id="state_{#id}" name="state" value="{#state}"></input>
<div class="panel-heading">
  Bug&nbsp;{#id}:&nbsp;<label id="title_id_{#id}">{#title}</label>
</div>
<div class="panel-body">

    <label style="margin:5px">Action Performed</label><br/>
    <div id="actions_id_{#id}" class="jumbotron">
        {#actions}
    </div>

    <label style="margin:5px">Expected Results</label><br/>
    <div id="expects_id_{#id}" class="jumbotron">
        {#expects}
    </div>
    <label style="margin:5px">Actual Results</label><br/>
    <div id="actuals_id_{#id}" class="jumbotron">
        {#actuals}
    </div>
    <label style="margin:5px">Error Message</label><br/>
    <div id="errors_id_{#id}" class="jumbotron">
        {#errors}
    </div>
    <label style="margin:5px">Additional Environment Info</label><br/>
    <div id="additional_id_{#id}" class="jumbotron">
        {#additionals}
    </div>
</div>
<div class="minibutton ok" onclick="javascript:window.deleteSpiderman({#id})">Delete</div>
<div class="minibutton ok" onclick="javascript:window.lockSpiderman({#id})">Lock</div>
<div class="minibutton ok" onclick="javascript:window.completeSpiderman({#id})">Complete</div>
<div class="minibutton ok" onclick="javascript:window.editSpiderman({#id})">Edit</div>
"""

editBug = (id) ->
  bug = bugOfViewMode(id);
  content = editTemplate
    .urlReplace(/{#spidermanId}/g,   bug.spidermanId.toString())
    .urlReplace(/{#responseCode}/g,  bug.responseCode.toString())
    .urlReplace(/{#createdOn}/g,     bug.createdOn)
    .urlReplace(/{#state}/g,         bug.state)
    .urlReplace(/{#title}/g,        bug.title)
    .urlReplace(/{#actions}/g,      bug.actions.replace(/<br\/>/g, "\n"))
    .urlReplace(/{#expects}/g,      bug.expects)
    .urlReplace(/{#actuals}/g,      bug.actuals)
    .urlReplace(/{#errors}/g,       bug.errors)
    .urlReplace(/{#additionals}/g,  bug.additionals.replace(/<br\/>/g, "\n"))
    .urlReplace(/{#id}/g, id.toString());
  $("#bug_id_" + id).html(content);

viewBug = (id) ->
  bug = bugOfEditMode(id);
  content = viewTemplate
  .urlReplace(/{#spidermanId}/g,   bug.spidermanId.toString())
  .urlReplace(/{#responseCode}/g,  bug.responseCode.toString())
  .urlReplace(/{#createdOn}/g,     bug.createdOn)
  .urlReplace(/{#state}/g,         bug.state)
  .urlReplace(/{#title}/g,         bug.title.withLink())
  .urlReplace(/{#actions}/g,       bug.actions.withLink())
  .urlReplace(/{#expects}/g,       bug.expects.withLink())
  .urlReplace(/{#actuals}/g,       bug.actuals.withLink())
  .urlReplace(/{#errors}/g,        bug.errors.withLink())
  .urlReplace(/{#additionals}/g,   bug.additionals.withLink().replace(/\n/g, "<br/>"))
  .urlReplace(/{#id}/g, id.toString())
  $("#bug_id_" + id).html(content);


window.viewSpiderman = (id) -> viewBug(id)

window.editSpiderman = (id) -> editBug(id)

window.deleteSpiderman = (id) ->
  $.ajax({
      type: 'DELETE',
      url: '/bug/' + id,
      contentType: 'application/json',
      data: '{"id": '+id+'}',
      success: (res) ->
        $("#bug_id_" + id).detach()
  });

window.lockSpiderman = (id) ->
  $.ajax({
        type: 'POST',
        url: '/lockedBugs/' + id,
        contentType: 'application/json',
        data: '{"id": '+id+'}',
        success: (res) ->
          $("#bug_id_" + id).removeClass("panel-warning", "panel-success")
          $("#bug_id_" + id).addClass("panel-danger")
  });

window.completeSpiderman = (id) ->
  $.ajax({
    type: 'POST',
    url: '/completedBugs/' + id,
    contentType: 'application/json',
    data: '{"id": '+id+'}',
    success: (res) ->
      $("#bug_id_" + id).detach()
  });

window.saveSpiderman = (id) ->
  $("#bug_edit_form_" + id).submit()

onSpidermanStopped = -> $("#state").html("Stopped")

onSpidermanStarted = -> $("#state").html("Running")

onUrlQueueSizeUpdated = (num) -> $("#UrlQueueSize").html(num)

onGettingUpdated = (num) -> $("#Getting").html(num)

onParsingUpdated = (num) -> $("#Parsing").html(num)

onProcessedUpdated = (num) -> $("#Processed").html(num)

onHttpErrorFoundUpdated = (num) -> $("#HttpErrorFound").html(num)


$ ->
  ws = new WebSocket $("#spidermanStatusDiv").data("ws-url")
  ws.onmessage = (event) ->
    message = JSON.parse event.data
    switch message.type
      when "message"
        $("#board tbody").append("<tr><td>" + message.uid + "</td><td>" + message.msg + "</td></tr>")
      when "Getting"
        $("#Getting").html("<label>" + message.quantity + "</label>")
      when "Parsing"
        $("#Parsing").html("<label>" + message.quantity + "</label>")
      when "Processed"
        $("#Processed").html("<label>" + message.quantity + "</label>")
      when "UrlQueueSize"
        $("#UrlQueueSize").html("<label>" + message.quantity + "</label>")
      when "HttpErrorFound"
        onError(message)
      else
        console.log(message)

