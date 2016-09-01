<#import "default.ftl" as default>
<@default.mainLayout "PaP">

<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>
    
    
<div class="container-fluid" id="main-container">
     <div class="row" id="main-row">
        <div class="container">
            <div class="row">
		<div class="col-sm-12">
                <section id="shopping-cart">
                <div class="panel panel-default">
        
                    <font size="5"><b>List of Units</b></font>
        
                </div>

            <table class="table table-striped table-hover">  <!-- table-bordered, table-hover table-condensed -->
            <thead>
              <tr>
                <th class="text-center">Id</th>
                <th class="text-center">Code</th>
                <th class="text-center">Title</th>
                <th class="text-center">Description</th>
                <th class="text-center"></th>
                <th class="text-center"></th>
              </tr>
            </thead>
            <tbody>
            <#list units as unit>
                <tr>
                    <td class="text-center">${unit.id}</td>
                    <td class="text-center">${unit.code}</td>
                    <td class="text-center">${unit.title}</td>
                    <td class="text-center">${unit.desc}</td>
                    <td class="text-center">
                        <a href="${baseContext}/unitEdit?id=${unit.id}" class="btn btn-success custom-width">edit</a>
                    </td>
                    <td class="text-center">
                        <a href="${baseContext}/unitDelete?id=${unit.id}" class="btn btn-danger custom-width">delete</a>
                    </td>
                </tr>
            </#list>
            </tbody>

        </table>
       
        <a href="${baseContext}/unit" class="btn btn-primary custom-width">New Unit</a>
 
    </section>
</div>
</div>
</div>	  
</div>
            <!-- /#main-row -->
        </div>
        <!-- /#main-container --> 
</@default.mainLayout>
