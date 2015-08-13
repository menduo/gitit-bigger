<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=0">
        <meta charset="UTF-8" />
        <title>$wikititle$ - $pagetitle$</title>
        <link rel="stylesheet" href="$base$/css/bootstrap.min.css" />
        <link rel="stylesheet" href="$base$/css/gitit.min.css" />
        <link href='$base$/img/favicon.ico' rel='icon' type='image/x-icon'/>
        $if(feed)$
        <link href="$base$/_feed/" type="application/atom+xml" rel="alternate" title="Sitewide ATOM Feed" />
        <link href="$base$/_feed$pageUrl$" type="application/atom+xml" rel="alternate" title="This page's ATOM Feed" />
        $endif$
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 " id="maincol">
                    <div class="hidden-print">
                        $userbox()$
                        $tabs$
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

    <style type="text/css" media="screen">
        body{
            word-wrap: break-word;
        }
        #editor {
          height: 400px;
          width: 100%;
          border: 1px solid #ddd;
          /*border-radius: 4px;*/
          /*font-size: 14px;*/
          /*font-family: Monaco, "Liberation Mono", Courier, monospace;*/
        }
        #editedText {
          visibility: hidden;
          display: none;
        }
        pre > code{
            white-space:pre!important;
        }

        div#categoryList {
            padding: 0em;
            padding-top: 10px;
            margin: 1em 0 0 0;
            border: 1px dashed #ccc;
        }

        #categoryList > ul:before{
            content: 'Categories: ';
            font-size: 153.9%;
            font-weight: bold;
            line-height: 30px;
        }

        ul > li{
            margin-bottom: 5px!important;
        }

        </style>

        <script src="$base$/js/ace/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
        <script>

            document.addEventListener("click", function (e) {
                if (e.target.tagName == "A" && !e.target.hasAttribute("target")) {
                        if (e.target.getAttribute("href").search('http://')>=0){
                            // e.target.setAttribute("target", "_blank");
                        }
                }
            });

            var ta = document.getElementById("editedText");
            if (ta){
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
            }

        </script>
    </body>
</html>
