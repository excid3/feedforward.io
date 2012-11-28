$("#link_url").on "paste", ->

  # Don't retrieve the title if there is already text
  if $("#link_title").val() == ""

    # Wait 20ms so we can retrieve the pasted content
    setTimeout ( ->
      $.get "/links/title",
        page: $("#link_url").val(),
        (data) ->

          # Don't write the title if it took too long and the user wrote something
          if $("#link_title").val() == ""
            $("#link_title").val(data)
    ), 20
