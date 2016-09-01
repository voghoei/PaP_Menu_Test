<#import "defaultShow.ftl" as default>
<@default.mainLayout "pap">
<#if error??>
        <div class="col-md-12 alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span class="sr-only"> Error: </span>
                ${error}
        </div>
</#if>
<div class="row">
    <#list beers as beer>
    <div class="shop-item col-sm-20 col-lg-4">
        <article>
            <figure class="red-wines">
                <img class="img-responsive" src="${baseContext}/resources/images/${beer.logo}" alt="" width="100" height="200">
                
            </figure>
            <div>
            <h3><a href="#">${beer.name}</a></h3>
            <h4 class="red-wines-text">${beer.brand}</h4>
            <h5 class="red-wines-text">${beer.IBU}</h5>
            <h5 class="red-wines-text">${beer.ABV}</h5>

            </div>
        </article>
    </div>
    </#list>
</div>

</@default.mainLayout>