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
        <script src="http://cdn.bootcss.com/mathjax/2.5.3/MathJax.js"></script>
        <script src="$base$/js/gitit.min.js"></script>

        $expire()$
        $getuser()$

        <script src="$base$/js/ace/src-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
        <script src="$base$/js/gen_breadcrumb.js" type="text/javascript" charset="utf-8"></script>

        <div class="hide page-more-scripts">
            $page_more_scripts()$
        </div>

        <script>

            function getParam(n) {
                    // get param value from url.
                    var half = location.search.split('&' + n + '=')[1];
                    if (!half) half = location.search.split('?' + n + '=')[1];
                    return half !== undefined ? decodeURIComponent(half.split('&')[0]) : null;
            }

            function setShortcuts (editor, snippetManager) {
                // snippets from https://github.com/shajiquan/bootstrap-markdown-editor/blob/master/src/bootstrap-markdown-editor.js
                editor.commands.addCommand({
                    name: 'bold',
                    bindKey: {win: 'Ctrl-B',  mac: 'Command-B'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '**\${1:text}**');
                        } else {
                            snippetManager.insertSnippet(editor, '**' + selectedText + '**');
                        }
                    },
                    readOnly: false
                });

                editor.commands.addCommand({
                    name: 'italic',
                    bindKey: {win: 'Ctrl-I',  mac: 'Command-I'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '*\${1:text}*');
                        } else {
                            snippetManager.insertSnippet(editor, '*' + selectedText + '*');
                        }
                    },
                    readOnly: false
                });

                editor.commands.addCommand({
                    name: 'link',
                    bindKey: {win: 'Ctrl-L',  mac: 'Command-L'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '[\${1:text}](http://\$2)');
                        } else {
                            if(selectedText.search('http://') == 0 || selectedText.search("https://")==0 ){
                                snippetManager.insertSnippet(editor, '[' + selectedText + ']('+selectedText+')');
                            }else{
                                snippetManager.insertSnippet(editor, '[' + selectedText + '](http://\$1)');
                            }

                        }
                    },
                    readOnly: false
                });


                editor.commands.addCommand({
                    name: 'image',
                    bindKey: {win: 'Ctrl-I',  mac: 'Ctrl-I'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '![\${1:Image Description}](http://\$2)');
                        } else {
                            snippetManager.insertSnippet(editor, '![' + selectedText + '](http://\$1)');
                        }
                    },
                    readOnly: false
                });


                editor.commands.addCommand({
                    name: 'iline-code',
                    bindKey: {win: 'Ctrl-K',  mac: 'Command-K'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '`\${1:text}`');
                        } else {
                            snippetManager.insertSnippet(editor, '`' + selectedText + '`');
                        }
                    },
                    readOnly: false
                });


                editor.commands.addCommand({
                    name: 'code',
                    bindKey: {win: 'Ctrl-Shift-K',  mac: 'Command-Shift-K'},
                    exec: function (editor) {
                        var selectedText = editor.session.getTextRange(editor.getSelectionRange());

                        if (selectedText === '') {
                            snippetManager.insertSnippet(editor, '```\${1:text}```');
                        } else {
                            snippetManager.insertSnippet(editor, '```' + selectedText + '```');
                        }
                    },
                    readOnly: false
                });

            }


        \$(document).ready(function(){

            // detect device type
            var is_phone = isMobile.phone;
            var is_tablet = isMobile.tablet;
            var is_seven_inch = isMobile.seven_inch;
            var is_mobile_device = is_phone || is_tablet || is_seven_inch;
            var ta = document.getElementById("editedText"); // get editor text area

            function _get_ace_editor_settings(){
                if(typeof(BIGGER_WITH_ACE) != 'object' ){
                    BIGGER_WITH_ACE = {
                        "enable": true,
                        "enable_markdown_shortcuts": true,
                        "setTheme": "ace/theme/github",
                        "setMode": "ace/mode/markdown",
                        "setShowPrintMargin":false,
                        "setShowGutter": false,
                        "setUseWrapMode":true,
                        "fontsize": "13px",
                    }

                    return BIGGER_WITH_ACE;
                }
                return null;
            }


            function init_ace_editor(ta, ace_settings){
                    // Enable ace editor if current device is not a mobile.
                    var editorDiv = document.createElement("div");
                    editorDiv.setAttribute("id", "editor");
                    ta.parentNode.insertBefore(editorDiv, ta.nextSibling);

                    document.getElementById('editor').style.fontSize = ace_settings.fontsize || "13px";
                    document.getElementById('editor').style.color = "#333";
                    document.getElementById('editor').style.fontWeight = "normal";

                    var editor = ace.edit(editorDiv);
                    editor.\$blockScrolling = Infinity;

                    editor.getSession().setValue(ta.value);
                    editor.getSession().on('change', function(){
                      ta.value = editor.getSession().getValue();
                    });

                    editor.setTheme(ace_settings.setTheme || "ace/theme/github");
                    editor.getSession().setMode(ace_settings.setMode || "ace/mode/markdown");
                    editor.setShowPrintMargin(ace_settings.setShowPrintMargin || false);
                    editor.getSession().setUseWrapMode(ace_settings.setUseWrapMode || true);
                    editor.renderer.setShowGutter(ace_settings.setShowGutter || false);


                    if(!ace_settings.enable_markdown_shortcuts || ace_settings.enable_markdown_shortcuts == true){
                        editor.commands.bindKey("Command-L", null);
                        editor.commands.bindKey("Ctrl-L", null);

                        ace.config.loadModule('ace/ext/language_tools', function () {
                            snippetManager = ace.require('ace/snippets').snippetManager;
                            setShortcuts(editor, snippetManager);
                        });
                    }
            }

            if(ta){
                // if is on an edit page.
                // update summary notice.
                var logMsg = document.getElementById("logMsg");
                logMsg.setAttribute("placeholder", "Edit summary (Briefly describe your changes)")

                var _bigger_ace_setting = _get_ace_editor_settings()

                if (!is_mobile_device && _bigger_ace_setting!=null && _bigger_ace_setting.enable == true){
                        init_ace_editor(ta, _bigger_ace_setting);
                }else{
                    // on mobile page, use the default text area.
                    \$('#editedText').css('visibility',"visible").css('display',"block");
                }
            }

        });
        </script>



    </body>
</html>
