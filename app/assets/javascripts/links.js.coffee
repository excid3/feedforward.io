$("#link_url").on "paste", ->
  if $("#link_title").val() == ""
    setTimeout ( ->
      $.get "/links/title",
        page: $("#link_url").val(),
        (data) ->
          $("#link_title").val(data)
    ), 20
