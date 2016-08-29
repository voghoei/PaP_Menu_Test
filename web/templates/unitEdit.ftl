<#import "default.ftl" as default>

<@default.mainLayout "PaP: - Edit Unit">
<h1>Edit Unit</h1>
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
	<form role="form" action="unitEdit" method="post">
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

                <div class="form-group">
                    <button type="submit" class="btn btn-primary pull-right">Edit</button><a href="${baseContext}/unitList">Cancel</a>
                </div>

	</form>
</div>
</@default.mainLayout>
