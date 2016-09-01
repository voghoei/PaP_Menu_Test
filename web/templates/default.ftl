<#macro mainLayout title="PaP Menu">
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- meta -->
        <meta charset="UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- css <link rel="stylesheet" href="${baseContext}/resources/css/style.css"> -->
        
        <link rel="stylesheet" href="${baseContext}/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${baseContext}/resources/css/font-awesome.css">
        <link rel="stylesheet" href="${baseContext}/resources/css/animate.css">
        <link rel="stylesheet" href="${baseContext}/resources/css/swipebox.css">
        <link rel="stylesheet" href="${baseContext}/resources/css/swiper.min.css">
        <link rel="stylesheet" href="${baseContext}/resources/css/chateau-theme.css">
	<link rel="stylesheet" href="${baseContext}/resources/css/style.css">	               
        
        <!-- google fonts -->
        <link href="http://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Merriweather:300,400,700,900,900italic,700italic,400italic,300italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
        
	<!-- head js -->
        <script src="${baseContext}/resources/js/modernizr-2.6.2.min.js"></script>                      
    </head>
    <body>
    
        <div class="container-fluid" id="main-container">
            <div class="row" id="main-row">
                <header>
                    <nav id="main-nav-bar" class="navbar navbar-default">
                        <div class="container">

                            <div class="navbar-header">
                                <a class="navbar-brand hidden-xs hidden-sm" href="${baseContext}/index"><img alt="" src="${baseContext}/resources/images/logo-1x.png" srcset="${baseContext}/resources/images/logo-1x.png 1x, ${baseContext}/resources/images/logo-2x.png 2x"></a>
                                <a class="navbar-brand hidden-lg hidden-md" href="${baseContext}/index"><img alt="" src="${baseContext}/resources/images/logo-mobile-1x.png" srcset="${baseContext}/resources/images/logo-mobile-1x.png 1x, ${baseContext}/resources/images/logo-mobile-2x.png 2x"></a>
                                <button class="navbar-toggle collapsed" data-target="#navigation" data-toggle="collapse" type="button"><span class="fa fa-navicon"></span></button>
                            </div>
                            <!-- navbar-header -->

                            <div class="collapse navbar-collapse navbar-right" id="navigation">
                                
                                <ul id="main-nav" class="nav navbar-nav">
                                    <#if loggedInUser??>
                                    
                                    <li><a href="${baseContext}/menu">Show</a></li>
                                    <li><a href="${baseContext}/menuSelection">Menu</a></li>
                                    <li><a href="${baseContext}/unitList">Unit</a></li>
                                    <li><a href="${baseContext}/beerList">Beer</a></li>

                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">${loggedInUser.getFirstName()} <span class="fa fa-angle-down"></span></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="${baseContext}/logout">Log Out</a></li>                                            
                                        </ul>
                                    </li>  
                                    <#else>
                                    <li><a href="${baseContext}/index">Home</a></li>
                                    <li><a href="${baseContext}/login">Login</a></li>
                                    </#if>
                                </ul>                               
							
                            </div>
                            <!-- /.navbar-collapse -->

	                        <!-- /.container -->
                        </div>
                        <!-- /.container-fluid -->
                    </nav>
                </header>
                <div class="container-fluid bg-cover">
                    <#nested/>
                </div>
                <!-- Abbas removed
                <footer>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">
                                <ul class="list-group">                                                    
                                    <li class="list-group-item style-1"><a href="${baseContext}/menu">Menu</a></li>
                
                                </ul>    	
                            </div>
                            <div class="col-sm-3">
                                <ul class="list-group">                                                    
                                    <li class="list-group-item style-1"><a href="${baseContext}/unitList">Unit</a></li>
                
                                </ul>    	
                            </div>
                            <div class="col-sm-3">
                                <ul class="list-group">
                                    <li class="list-group-item style-1"><a href="${baseContext}/unitBeer">Beer</a></li>
                                </ul>    	
                            </div>
                            <div class="col-sm-3">
                                <ul class="list-group">
                                    <li class="list-group-item style-1"><a href="${baseContext}/logout">Log Out</a></li>                                    
                                </ul>    	
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-4 pad-v text-center">
                                <img alt="" src="${baseContext}/resources/images/logo-1x.png" class="img-responsive" srcset="${baseContext}/resources/images/logo-1x.png 1x, ${baseContext}/resources/images/logo-2x.png 2x">
                            </div>
                        </div>

                    </div>
                </footer>
                
                <footer class="credits">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                    Develop and design by <a href="http://www.pluginandpour.com/">Plug And Pour</a> / <a href="#">FMF CONSULTING, LLC</a>
                            </div>
                            <div class="col-sm-6 text-right social">
                                    <a href="#"><span class="fa fa-facebook-square"></span></a>
                                    <a href="#"><span class="fa fa-twitter-square"></span></a>
                                    <a href="#"><span class="fa fa-google-plus-square"></span></a>
                                    <a href="#"><span class="fa fa-pinterest-square"></span></a>
                            </div>
                        </div>
                    </div>
                </footer> 
                -->
		</div>
            <!-- /#main-row -->
        </div>
        <!-- /#main-container -->	
	
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

        <script src="${baseContext}/resources/bootstrap/js/bootstrap.min.js"></script> 
        <script src="${baseContext}/resources/js/jquery.swipebox.min.js"></script> 
        <script src="${baseContext}/resources/js/jquery.stellar.js"></script> 
        <script src="${baseContext}/resources/js/swiper.jquery.min.js"></script> 
        <script src="${baseContext}/resources/js/jquery.waypoints.min.js"></script> 
        <script src="${baseContext}/resources/js/sticky.js"></script> 
        <script src="${baseContext}/resources/js/isotope.pkgd.min.js"></script> 
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script src="${baseContext}/resources/js/chateau-script.js"></script>         
        <script type="text/javascript">
        ;( function( $ ) {

                $( '.swipebox' ).swipebox();

        } )( jQuery );
        </script>  
        
    </body>
</html>
</#macro>
