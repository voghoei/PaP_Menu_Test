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
<div class="row">
    <section id="register" class="">
	                    
	 <div class="col-sm-6 col-sm-offset-3">
            <div class="form-box">
                <form role="form" action="beer" method="post">
                    <h2 class="text-center">Add Beer</h2>

                    <div class="form-group">
                            <label for="logoPath">Logo</label>                           
                            <input type="file" class="" placeholder="logoPath" name="logoPath">
                            <img class="img-responsive" width="200" height="400" alt="" id="preview">
                            <img id="preview">
                    </div> 

                    <div class="form-group">
                            <label for="code">Code</label>                           
                            <input type="text" class="form-control" placeholder="Code" name="code">
                    </div> 

                    <div class="form-group">
                            <label for="name">Name</label>                           
                            <input type="text" class="form-control" placeholder="Name" name="name">
                    </div> 

                    <div class="form-group">
                            <label for="brand">Brewery</label>
                                <input type="text" class="form-control" placeholder="Brand" name="brand">
                    </div>

                    <div class="form-group">
                            <label for="type">Style</label>
                                <input type="text" class="form-control" placeholder="type" name="type">
                    </div>

                    <div class="form-group">
                            <label for="abv">ABV</label>
                                <input type="text" class="form-control" placeholder="abv" name="ABV">
                    </div>

                    <div class="form-group">
                            <label for="ibu">IBU</label>
                                <input type="text" class="form-control" placeholder="ibu" name="IBU">
                    </div>

                    <div class="form-group">
                        <label for="name">Description</label>       
                                <input type="text" class="form-control" placeholder="Description" name="description">
                    </div>
                    <div class="row">
                        <div class="form-actions pull-right">
                            <input type="submit" value="Submit" class="btn btn-primary "/><span class="btn"><a href="${baseContext}/beerList">Cancel</a></span>
                        </div>
                    </div>

                </form>
                    <script src="https://www.cse.ust.hk/~rossiter/dating_web_site.js"></script>
            </div>
        </div>
    </section>
</div>
</@default.mainLayout>