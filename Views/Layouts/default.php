<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Mercado SoftExpert</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/market_softexpert/Webroot/assets/bootstrap/css/bootstrap.min.css">
</head>

<body>
<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Mercado</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
        <li class="active"><a href="/market_softexpert/">Vendas</a></li>
        <li><a href="/market_softexpert/products/index">Produtos</a></li>
        <li><a href="/market_softexpert/group_products/index">Grupos de Produtos</a></li>     
        </ul>
        
    </div><!--/.nav-collapse -->
    </div>
</nav>

<main role="main" class="container">

    <div class="starter-template">

        <?php
        echo $content_for_layout;
        ?>

    </div>

</main>
    <script src="/market_softexpert/Webroot/assets/jquery/jquery-3.4.1.min.js"></script>
    <script src="/market_softexpert/Webroot/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/market_softexpert/Webroot/assets/app/app.js"></script> 
</body>
</html>