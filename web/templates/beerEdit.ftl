<#import "default.ftl" as default>

<@default.mainLayout "PaP: - Edit Beer">

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
                <form role="form" action="beerEdit" method="post">
                    <h2 class="text-center">Edit Beer</h2>
                    <input type="hidden" name="id" value="${beer.id}" />
                    <div class="form-group">
                            <label for="name">Code</label>                           
                            <input type="text" class="form-control input-sm" placeholder="Code" name="code" value="${beer.code}">
                    </div>                               

                    <div class="form-group">
                            <label for="name">Name</label>
                                <input type="text" class="form-control input-sm" placeholder="name" name="name" value="${beer.name}">
                    </div>

                    <div class="form-group">
                            <label for="brand">Brand</label>
                                <input type="text" class="form-control input-sm" placeholder="brand" name="brand" value="${beer.brand}">
                    </div>

                    <div class="form-group">
                            <label for="type">Style</label>
                                <input type="text" class="form-control input-sm" placeholder="type" name="type" value="${beer.type}">
                    </div>

                    <div class="form-group">
                            <label for="ABV">ABV</label>
                                <input type="text" class="form-control input-sm" placeholder="ABV" name="ABV" value="${beer.ABV}">
                    </div>

                    <div class="form-group">
                            <label for="IBU">IBU</label>
                                <input type="text" class="form-control input-sm" placeholder="IBU" name="IBU" value="${beer.IBU}">
                    </div>

                    <div class="form-group">
                        <label for="name">Description</label>       
                                <input type="text" class="form-control input-sm" placeholder="Description" name="description" value="${beer.desc}">
                    </div>

                    <div class="row">
                        <div class="form-actions pull-right">
                            <input type="submit" value="Edit" class="btn btn-primary "/><span class="btn"><a href="${baseContext}/beerList">Cancel</a></span>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </section>
</div>
</@default.mainLayout>
