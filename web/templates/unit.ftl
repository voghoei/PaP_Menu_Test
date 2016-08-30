<#import "default.ftl" as default>
<@default.mainLayout "PaP">
<#if error??>
<div class="row">
	<div class="col-md-12 al    ert alert-danger" role="alert">
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

<div class="row">
    <section id="register" class="">
	                    
	 <div class="col-sm-6 col-sm-offset-3">
            <div class="form-box">
                <form role="form" action="unit" method="post">
                        <h2 class="text-center">Add Unit</h2>
                        <div class="form-group">
                                <label for="name">Code</label>                           
                                <input type="text" class="form-control" placeholder="Code" name="code">
                        </div>                

                        <div class="form-group">
                                <label for="title">Title</label>
                                    <input type="text" class="form-control" placeholder="title" name="title">
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>       
                                    <input type="text" class="form-control" placeholder="Description" name="description">
                        </div>
                      
                        <div class="row">
                            <div class="form-actions pull-right">
                                <input type="submit" value="Submit" class="btn btn-primary "/><span class="btn"><a href="${baseContext}/unitList">Cancel</a></span>
                            </div>
                        </div>

                </form>
            </div>
        </div>
    </section>
</div>
</@default.mainLayout>
