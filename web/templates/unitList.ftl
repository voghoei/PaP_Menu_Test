<#import "default.ftl" as default>
<@default.mainLayout "Register">
<h1>List of Units</h1>
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>

    <div class="row">

            <table class="table table-striped table-hover">  <!-- table-bordered, table-hover table-condensed -->
            <thead>
              <tr>
                <th>Id</th>
                <th>Code</th>
                <th>Title</th>
                <th>Description</th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            <#list units as unit>
                <tr>
                    <td>${unit.id}</td>
                    <td>${unit.code}</td>
                    <td>${unit.title}</td>
                    <td>${unit.desc}</td>
                    <td>
                        <a href="${baseContext}/unitEdit?id=${unit.id}" class="btn btn-success custom-width">edit</a>
                    </td>
                    <td>
                        <a href="${baseContext}/unitDelete?id=${unit.id}" class="btn btn-danger custom-width">delete</a>
                    </td>
                </tr>
            </#list>
            </tbody>

        </table>

        <a href="${baseContext}/unit" class="btn btn-primary custom-width">New Unit</a>

    </div>
</@default.mainLayout>
