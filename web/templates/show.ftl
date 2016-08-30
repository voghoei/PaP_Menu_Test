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
    <div class="shop-item col-sm-6 col-lg-4">
        <article>
            <figure class="red-wines">
                <a href="product-sheet.html"><img class="img-responsive" src="${baseContext}/resources/images/heineken.png" alt="" width="300" height="600"></a>
                <!--<a href="cart.html" class="add-to-cart fa fa-shopping-cart"></a>-->
            </figure>
            <div>
            <h3><a href="#">${beer.name}</a></h3>
            <h4 class="red-wines-text">${beer.brand}</h4>
            <h5 class="price">${beer.type}</h5>
            </div>
        </article>
    </div>
    </#list>
</div>

</@default.mainLayout>