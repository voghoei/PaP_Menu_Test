<#import "default.ftl" as default>
<@default.mainLayout "Register">
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
        
                    <font size="5"><b>Menu Selection</b></font>
        
                </div>
               
                <form action="menuSelection" method="post">
                    <div class="form-group col-sm-6 col-sm-offset-3">
                        <label for="sel1">Select a Unit:</label>
                        <select name="unit" class="form-control" id="unit">
                            <#list units as unit>
                                <option value="${unit.id}">${unit.title}</option>
                            </#list>
                          
                        </select>
                    </div>
                    <table class="table table-striped table-hover">  <!-- table-bordered, table-hover table-condensed -->
            <thead>
                            <tr>
                                    <th class="text-center">Logo</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Brewery</th>
                                    <th class="text-center">Style</th>
                                    <th class="text-center">ABV</th>
                                    <th class="text-center">IBU</th>                   
                                    <th class="text-center" style="width:15%">Please select for your menu</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list beers as beer>
                            <tr>                                                                                                    
                                    <<td class="text-center"> 
                                        <img class="pull-center product-thumb" src="${baseContext}/resources/images/${beer.logo}" >
                                    </td>                                    
                                    <td class="text-center">${beer.name}</td>
                                    <td class="text-center">${beer.brand}</td>
                                    <td class="text-center">${beer.type}</td>
                                    <td class="text-center">${beer.ABV}</td>
                                    <td class="text-center">${beer.IBU}</td>
                                    <td class="text-center" >
                                        <input class="cb-beers"  name="beerId" value="${beer.id}" type="checkbox"  >
                                   </td>
                            </tr>
                            </#list>  
                        </tbody>
                        <tfoot>
                            <tr>                                    
                                    <td colspan="2" class="hidden-xs"></td>                                    
                                    
                                    <td><input type="submit" value="Save" class="btn btn-primary  btn-block"/></td>
                            </tr>
                        </tfoot>
                        </table>


                </form> <!-- Form ends -->
              </section>
</div>
</div>
</div>	  
</div>
            <!-- /#main-row -->
        </div>
        <!-- /#main-container --> 
</@default.mainLayout>