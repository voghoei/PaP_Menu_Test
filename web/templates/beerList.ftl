<#import "default.ftl" as default>
<@default.mainLayout "Register">
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>

<section id="register" class="">
   <div class="panel panel-default">
        
        <font size="5"><b>List of Beers</b></font>
        
  </div>

    <div class="panel panel-default" >
        <!-- Default panel contents -->
        
        <table class="table table-striped table-hover">  <!-- table-bordered, table-hover table-condensed -->
            <thead>
              <tr>
                
                <th class="text-center">Logo</th>
                <th class="text-center">Name</th>
                <th class="text-center">Brewery</th>
                <th class="text-center">Style</th>
                <th class="text-center">ABV</th>
                <th class="text-center">IBU</th>
            
                <th></th>
                
              </tr>
            </thead>
            <tbody>
            <#list beers as beer>
                <tr>
                    <td class="text-center"> 
                        <img class="pull-center product-thumb" src="${baseContext}/resources/images/${beer.logo}" alt="" width="40" height="60">
                    </td>
                    <td class="text-center">${beer.name}</td>
                    <td class="text-center">${beer.brand}</td>
                    <td class="text-center">${beer.type}</td>
                    <td class="text-center">${beer.ABV}</td>
                    <td class="text-center">${beer.IBU}</td>
                    <td>
                        <a href="${baseContext}/beerEdit?id=${beer.id}" class="btn btn-success custom-width">edit</a>
                    </td>
                    
                </tr>
            </#list>
            </tbody>

        </table>
        </div>
        <a href="${baseContext}/beer" class="btn btn-primary custom-width">New Beer</a>

    </div>
    </section>
</@default.mainLayout>
