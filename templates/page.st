<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <meta charset="UTF-8" />
        <title>$wikititle$ - $pagetitle$</title>
        <link href='$base$/img/favicon.ico' rel='icon' type='image/x-icon'/>
        <link rel="stylesheet" href="$base$/css/bootstrap.min.css" />
        <link rel="stylesheet" href="$base$/css/gitit.min.css?version=2015-8-14-15-27-4" />
        <link rel="stylesheet" href="$base$/css/custom.css?version=2015-8-14-15-27-4" />
        $if(feed)$
        <link href="$base$/_feed/" type="application/atom+xml" rel="alternate" title="Sitewide ATOM Feed" />
        <link href="$base$/_feed$pageUrl$" type="application/atom+xml" rel="alternate" title="This page's ATOM Feed" />
        $endif$
        <meta name="poweredby" content="https://github.com/shajiquan/gitit-package">
    </head>
    <body>

        $header_nav()$

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 " id="maincol">

                <div class="">
                    <ol id="breadcrumb" class="breadcrumb">
                      <li><a href="/" class="active">Home</a></li>
                    </ol>
                </div>

                    <div class="hidden-print">
                        $userbox()$
                        <div id="page-tabs">
                            $tabs$
                        </div>

                    </div>
                    $content()$
                    $if(markuphelp)$
                        $markuphelp()$
                    $endif$
                </div>
                <div class="col-md-2 hidden-print" id="sidebar">
                    <div class="row">
                        $sidebar()$
                    </div>
                </div>
                <div class="col-md-10 hidden-print">
                    $footer()$
                </div>
            </div>
        </div>
        <script src="$base$/js/jquery.min.js"></script>
        <script src="$base$/js/bootstrap.min.js"></script>
        <script src="$base$/js/jquery-ui-1.10.4.custom.min.js"></script>
        <script src="$base$/js/isMobile.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/gitit.min.js"></script>

        $expire()$
        $getuser()$

        <script src="$base$/js/ace/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/common_utils.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/gen_breadcrumb.js" type="text/javascript" charset="utf-8"></script>

        <div class="hide page-more-scripts">$page_more_scripts()$</div>

        <script src="$base$/js/base_config.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/ace_config.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/page.js" type="text/javascript" charset="utf-8"></script>
    </body>
</html>
