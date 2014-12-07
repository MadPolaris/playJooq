$ ->
  ws = new WebSocket $("body").data("ws-url")
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
        $("#HttpErrorFound").html("<label>" + message.quantity + "</label>")
        #when "Stopped"
        #when "ShuttingDown"
      else
        console.log(message)

  $("#msgform").submit (event) ->
    event.preventDefault()
    console.log($("#msgtext").val())
    # send the message to watch the stock
    ws.send(JSON.stringify({msg: $("#msgtext").val()}))
    # reset the form
    $("#msgtext").val("")


