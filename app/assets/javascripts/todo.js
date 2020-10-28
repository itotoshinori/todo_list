<script>
  $(function() {
    $( "#linkbutton" ).click( function ()
    {
      var input = $( '#input' ).val();
      var input2 = $( '#input2' ).val();
      var body = $( '#body' ).val();
      $( '#input' ).val( "" );
      $( '#input2' ).val( "" );
      if ( !input2 ) {
        input2 = "Link"
      }
      if ( body ) {
        link = '\n' + "<a href =" + "'" + input + "'" + ">" + input2 + "</a>"
      } else {
        link = "<a href =" + "'" + input + "'" + ">" + input2 + "</a>"
      }
      if ( !input ) {
        alert( 'Urlを入力して下さい' );
      } else {
        $( '#body' ).focus().val( body + link );
      }
    } );
    $("#imagelinkbutton").click(function() {
    var input3 = $( '#input3' ).val();
    var body = $('#body').val();
		$('#input3').val( "" );
    if(body) {
    link = '\n' + "<a href =" + "'" + input3 + "'" + "><img src='" + input3 + "' width='100%'></a>"
  } else {
    link = "<a href =" + "'" + input3 + "'" + "><img src='" + input3 + "' width='100%'></a>"
  }
    if(!input3){
    alert( 'Urlを入力して下さい' );
    } else {
    $( '#body' ).focus().val( body + link );
      }
	  });
    $("#bodyclear").click(function() {
    $( '#body' ).val( "" );
	  });
  }
);
</script>