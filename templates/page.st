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
    </head>
    <body>

        $siteHeaderNav()$

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 " id="maincol">
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
        <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
        <script src="$base$/js/gitit.min.js"></script>

        $expire()$
        $getuser()$

        <script src="$base$/js/ace/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/isMobile.min.js" type="text/javascript" charset="utf-8"></script>
        <script>

        function getParam(n) {
                // get param value from url.
                var half = location.search.split('&' + n + '=')[1];
                if (!half) half = location.search.split('?' + n + '=')[1];
                return half !== undefined ? decodeURIComponent(half.split('&')[0]) : null;
        }

        \$(document).ready(function(){

            // update buttons or inputs into bootstrap style.
            \$('input[type="submit"], input[type="button"]').each(function(idx,item){
                \$(item).addClass('btn btn-default btn-sm');
            });


            // detect device type
            var is_phone = isMobile.phone;
            var is_tablet = isMobile.tablet;
            var is_seven_inch = isMobile.seven_inch;

            var is_mobile_device = is_phone || is_tablet || is_seven_inch;

            var ta = document.getElementById("editedText"); // get editor text area

            if(ta){
                // if is on an edit page.

                // update summary notice.

                var logMsg = document.getElementById("logMsg");
                logMsg.setAttribute("placeholder", "Edit summary (Briefly describe your changes)")

                if (!is_mobile_device){
                    // Enable ace editor if current device is not a mobile.
                    var editorDiv = document.createElement("div");
                    editorDiv.setAttribute("id", "editor");
                    ta.parentNode.insertBefore(editorDiv, ta.nextSibling);
                    var editor = ace.edit(editorDiv);
                    editor.getSession().setValue(ta.value);
                    editor.getSession().on('change', function(){
                      ta.value = editor.getSession().getValue();
                    });
                    editor.setTheme("ace/theme/github");
                    editor.getSession().setMode("ace/mode/markdown");
                    editor.setShowPrintMargin(false);
                    editor.getSession().setUseWrapMode(true);
                    // editor.setKeyboardHandler("ace/keyboard/ace");
                    // editor.focus();
                }else{
                    // on mobile page, use the default text area.
                    \$('#editedText').css('visibility',"visible").css('display',"block");
                }
            }

            if(is_mobile_device){
                //
            }

            // set query value to input if on a search result page.
            if (location.pathname == "/_search"){
                var search_text = getParam('patterns');
                if(search_text && search_text != ""){
                    \$('.input-search-form').each(function(idx,item){
                        \$(item).val(search_text)
                    });
                }
            }


        });



        </script>
    </body>
</html>
