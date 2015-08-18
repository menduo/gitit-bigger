<nav id="header-navbar" class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/" title="$wikititle$">$wikititle$</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="header-navbar-collapse">

      <ul class="nav navbar-nav">
        $header_nav_links()$
      </ul>

      <form action="$base$/_search" method="get" id="searchform" class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" name="patterns" id="patterns" class="form-control input-search-form input-search-form-in-header" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>

      <ul class="nav navbar-nav navbar-right">
            <li><a class="loginlink " href="$base$/_login">Login</a></li>
            <li><a class="logoutlink hide" href="$base$/_logout">Logout @<span class="logged_in_user"></span></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>