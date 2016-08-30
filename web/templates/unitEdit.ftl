f<#import "default.ftl" as default>
<@default.mainLayout "PaP">

<#if error??>
<div class="row">
	<div class="col-md-12 alert alert-danger" role="alert">
		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
		<span class="sr-only">Error:</span>
		${error}
	</div>
</div>
</#if>

<div class="row">
    <section id="register" class="">
	                    
	 <div class="col-sm-6 col-sm-offset-3">
         
            <div class="form-box">
                
                <form role="form" action="unitEdit" method="post">
                    <h2 class="text-center">Edit Unit</h2>
                    <input type="hidden" name="id" value="${unit.id}" />
                    <div class="form-group">
                            <label for="name">Code</label>                           
                            <input type="text" class="form-control input-sm" placeholder="Code" name="code" value="${unit.code}">
                    </div>                

                    <div class="form-group">
                            <label for="name">Title</label>
                                <input type="text" class="form-control input-sm" placeholder="title" name="title" value="${unit.title}">
                    </div>

                    <div class="form-group">
                        <label for="name">Description</label>       
                                <input type="text" class="form-control input-sm" placeholder="Description" name="description" value="${unit.desc}">
                    </div>
                    <div class="row">
                        <div class="form-actions pull-right">
                            <input type="submit" value="Edit" class="btn btn-primary "/><span class="btn"><a href="${baseContext}/unitList">Cancel</a></span>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </section>
</div>
</@default.mainLayout>
