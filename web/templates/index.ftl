<#import "default.ftl" as default>
<@default.mainLayout "PaP">
<h1>Welcome to Plug and Poure</h1>
<#if !loggedInUser??>
<div class="row">
	<div class="col-md-12 alert alert-info">
		<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
		Need to register? <a href="${baseContext}/register">Click here!</a>
	</div>
</div>
</#if>
</@default.mainLayout>
