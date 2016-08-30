<#import "default.ftl" as default>
<@default.mainLayout "Login">

<#if error??>
<div class="row">
	<div class="col-md-12 alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only">Error:</span>
		${error}
	</div>
</div>
</#if>
<#if message??>
<div class="row">
	<div class="col-md-12 alert alert-success" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only">Message:</span>
		${message}
	</div>
</div>
</#if>
<!--<div class="row">
	<div class="col-md-12 alert alert-info">
		<span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span>
		Need to register? <a href="register">Click here!</a>
	</div>
</div>-->
<div class="row">
    <section id="register" class="">
	                    
	 <div class="col-sm-6 col-sm-offset-3">
            <div class="form-box">
            
                <form role="form" action="login" method="post">
                <h2 class="text-center">Login</h2>
                    <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" placeholder="Username" name="username" id="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" placeholder="Password" id="password" name="password">
                    </div>
                    
                    <div class="row">
                        <div class="form-actions ">
                            <input type="submit" value="Submit" class="btn btn-primary center-block"/>
                        </div>
                    </div>

                </form>
                <div class="form-box-msg text-center">
                You don't have an account yet? <a href="register">Register here</a>
              </div>
            </div>
        </div>
    </section>
            
</div>
</@default.mainLayout>
