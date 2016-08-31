<#import "default.ftl" as default>
<@default.mainLayout "Register">
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>
<div class="container">
    <div class="row">
        <div class="col-sm-12">

            <section id="shopping-cart">

                <h2>Menu selection</h2>
                <form action="menuSelection" method="post">
                    <div class="form-group col-sm-6 col-sm-offset-3">
                        <label for="sel1">Select a Unit:</label>
                        <select name="unit" class="form-control" id="unit">
                            <#list units as unit>
                                <option value="${unit.id}">${unit.title}</option>
                            </#list>
                          
                        </select>
                    </div>
                    <table id="cart" class="table table-hover table-condensed">
                        <thead>
                            <tr>
                                    <th style="width:50%">Product</th>
                                    <th >Brand</th>                        
                                    <th style="width:15%">Please select not more than ten beers</th>
                            </tr>
                        </thead>
                        <tbody>
                            <#list beers as beer>
                            <tr>                                                                                                    
                                    <td data-th="Product">
                                            <div class="row">
                                                    <div class="col-sm-12">
                                                            
                                                            <h4 class="nomargin">${beer.name}</h4>
                                                            <p>${beer.desc}</p>
                                                    </div>
                                            </div>
                                    </td>
                                    <td data-th="Brand">${beer.brand}</td>
                                    <td data-th="">
                                    <label>
                                        
                                        <input class="cb-beers"  name="beerId" value="${beer.id}" type="checkbox"  >
                                    </label>
                                    </td>
                                
                              
                            </tr>
                            </#list>  
                                    
                            
                            
                        </tbody>
                        <tfoot>
                            
                            <tr>                                    
                                    <td colspan="2" class="hidden-xs"></td>                                    
                                    
                                    <td><input type="submit" value="Save" class="btn btn-primary btn-block"/></td>
                            </tr>
                        </tfoot>
                        </table>

                </form> <!-- Form ends -->
                
                
                

            </section>
        <div>
    </div>
</div>
</@default.mainLayout>