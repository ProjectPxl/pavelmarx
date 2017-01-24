$ ->
  if $(window).width() >= 960
      $('.bio').innerHeight( $(window).innerHeight() )

  $.fn.emailForm = ->
    $(this).find( $('.send-email') ).click (event) =>
      event.preventDefault()

      $sender = $(this).find( $(".sender") ).val().trim() 
      $msg    = $(this).find( $(".msg") ).val().trim()

      if ( $sender.length ) && ( $msg.length )
          $.ajax
              url: "https://formspree.io/maltsevp@gmail.com", 
              method: "POST",
              data: {message: $msg, email:$sender},
              dataType: "json"
              error: (jqXHR, textStatus, errorThrown) ->
                  
              success: (data, textStatus, jqXHR) =>
                  $(this).find( $('.sender') ).val('')
                  $(this).find( $('.msg') ).val('')
      else
          console.log "else"
   
  $( ".bar-email" ).emailForm();
  $( ".footer-email" ).emailForm();