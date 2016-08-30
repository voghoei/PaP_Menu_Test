/**
 * 
 */

$(document).ready(function(){
	
	
	$( ":submit" ).click(function() {
		var firstName = $('#firstName').val();
		var lastName = $('#lastName').val();
//		alert(firstName + " " + lastName);
		
		var ssoId = firstName + "." + lastName
		var pass = ssoId;
		
		$('#ssoId').val(ssoId);
		$('#password').val(ssoId);
	});
	

	
	
});