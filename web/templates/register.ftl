<#import "default.ftl" as default>
<@default.mainLayout "Register">
<h1>Register Manager</h1>
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>
<div class="row">
	<div class="col-md-12">
		<form role="form" action="register" method="post">
                
		<div class="form-group">
			<label for="username">Username</label>
			<input type="text" class="form-control" placeholder="Username" name="username">
		</div>
                <div class="form-group">
                        <label for="password">First Name</label>
                        <input type="text" class="form-control" placeholder="First Name" name="fname">
                </div>
                <div class="form-group">
                        <label for="lname">Last Name</label>
                        <input type="text" class="form-control" placeholder="Last Name" name="lname">
                </div>
                <div class="form-group">
                        <label for="state">State</label>
                        <input type="text" class="form-control" placeholder="State" name="state">
                </div>
                <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" placeholder="Address" name="address">
                </div>
		<div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" placeholder="Email" name="email">
                </div>
                <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" class="form-control" placeholder="Phone Number" name="phone">
                </div>
                <div class="form-group">
                        <label for="password">Enter a password</label>
                        <input type="password" class="form-control" placeholder="Password" name="password">
                </div>
                <div class="form-group">
                        <label for="passwordReEnter">Re-enter password</label>
                        <input type="password" class="form-control" placeholder="Re-enter Password" name="passwordRe">
                </div>
                <div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
                </div>

	</form>
    </div>
</div>
</@default.mainLayout>
