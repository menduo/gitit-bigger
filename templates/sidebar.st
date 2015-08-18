
<div class="hidden-xs hidden-sm col-md-12">
    $logo()$
</div>

<div class="col-md-12">
    <form action="$base$/_search" method="get" id="searchform">
        <input type="text" name="patterns" id="patterns"
               class="form-control input-search-form" placeholder="Search" />
    </form>
</div>


<div class="col-sm-6 col-md-12 col-toc hide">
    <div class="panel panel-default">
        <div class="panel-heading">TOC</div>
        <div class="panel-body">

        </div>
    </div>
</div>

<div class="col-sm-6 col-md-12 hide">
    <div class="panel panel-default">
        <div class="panel-heading">Site</div>
        <div class="panel-body">
            <ul>
                $header_nav_links()$
            </ul>
        </div>
    </div>
</div>

<div class="col-sm-6 col-md-12">
    <div class="panel panel-default">
        <div class="panel-heading">This page</div>
        <div class="panel-body">
            <ul>
                <li><a href="$base$/">Front page</a></li>
                <li><a href="$base$/_showraw$pageUrl$$if(revision)$?revision=$revision$$endif$">Raw page source</a></li>
                <li><a href="$base$/_delete$pageUrl$">Delete this page</a></li>
                $if(feed)$
                <li><a href="$base$/_feed$pageUrl$" type="application/atom+xml" rel="alternate" title="This page's ATOM Feed">Atom feed</a></li>
                $endif$
            </ul>
            $exportbox$
        </div>
    </div>
</div>


<div class="col-sm-6 col-md-12 hide">
    <div class="panel panel-default">
        <div class="panel-heading">Userbox</div>
        <div class="panel-body">
            <ul>
                <li><a class="registerlink hide" href="$base$/_register">Create account</a></li>
                <li><a class="loginlink" href="$base$/_login">Login</a></li>
                <li><a class="logoutlink" href="$base$/_logout">Logout <span class="logged_in_user"></span></a></li>
            </ul>
        </div>
    </div>
</div>
