<#import "default.ftl" as default>
<@default.mainLayout "Register">
<h1>Register Unit</h1>
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>

<div class="row">
	<form role="form" action="unit" method="post">
                
                <div class="form-group">
                        <label for="name">Code</label>                           
                        <input type="text" class="form-control" placeholder="Code" name="code">
                </div>                

                <div class="form-group">
                        <label for="name">Title</label>
                            <input type="text" class="form-control" placeholder="title" name="title">
                </div>

                <div class="form-group">
                    <label for="name">Description</label>       
                            <input type="text" class="form-control" placeholder="Description" name="description">
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary pull-right">Submit</button><a href="${baseContext}/unitList">Cancel</a>
                </div>

	</form>
</div>
</@default.mainLayout>
