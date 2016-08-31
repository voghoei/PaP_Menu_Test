<#import "default.ftl" as default>
<@default.mainLayout "Register">
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
                <form role="form" action="menu" method="post">
                    <div class="row">    
                    <div class="form-group col-sm-6 col-sm-offset-3">
                        <label for="sel1">Select a Unit:</label>
                        <select name="unit" class="form-control" id="unit">
                            <#list units as unit>
                                <option value="${unit.id}">${unit.title}</option>
                            </#list>

                        </select>
                    </div> 
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6 col-sm-offset-3">
                            <input type="submit" value="Show" class="btn btn-primary pull-right"/>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </section>
</div>

</@default.mainLayout>