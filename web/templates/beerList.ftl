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
    <h2 class="text-center">List of Beers</h2>

    <div class="panel panel-default">
        <!-- Default panel contents -->
        

        <table class="table table-striped table-hover">  <!-- table-bordered, table-hover table-condensed -->
            <thead>
              <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Name</th>
                <th>Brand</th>
                <th>Style</th>
                <th>ABV</th>
                <th>IBU</th>

                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <#list beers as beer>
                <tr>
                    <td>${beer.id}</td>
                    <td>${beer.code}</td>
                    <td>${beer.name}</td>
                    <td>${beer.brand}</td>
                    <td>${beer.type}</td>
                    <td>${beer.ABV}</td>
                    <td>${beer.IBU}</td>

                    <td>
                        <a href="${baseContext}/beerEdit?id=${beer.id}" class="btn btn-success custom-width">edit</a>
                    </td>
                    <td>
                        <a href="${baseContext}/beerDelete?id=${beer.id}" class="btn btn-danger custom-width">delete</a>
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
