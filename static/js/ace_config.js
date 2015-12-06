// init ace editor
function init_ace_editor(editorEle, aceConfigObj) {
    var editorDiv = document.createElement("div");
    editorDiv.setAttribute("id", "editor");
    editorEle.parentNode.insertBefore(editorDiv, editorEle.nextSibling);
    var editorInner = document.getElementById('editor');

    if (aceConfigObj.styles) {
        for (attr in aceConfigObj.styles) {
            editorInner.style[attr] = aceConfigObj.styles[attr];
        }
    }

    var editor = ace.edit(editorDiv);
    editor.$blockScrolling = Infinity;

    editor.getSession().setValue(editorEle.value);
    editor.getSession().on('change', function() {
        editorEle.value = editor.getSession().getValue();
    });

    editor.setTheme(aceConfigObj.setTheme || "ace/theme/github");
    editor.setShowPrintMargin(aceConfigObj.setShowPrintMargin || false);
    editor.getSession().setUseWrapMode(aceConfigObj.setUseWrapMode || true);
    editor.renderer.setShowGutter(aceConfigObj.setShowGutter || false);

    editor.getSession().setUseSoftTabs(aceConfigObj.setUseSoftTabs || false);


    editor.getSession().setMode(aceConfigObj.setMode || "ace/mode/markdown");

    // activate markdown shortcuts
    if (aceConfigObj.markdowns.enable) {
        editor.getSession().setMode("ace/mode/markdown");
        if (aceConfigObj.markdowns.shortcuts) {
            editor.commands.bindKey("Command-L", null);
            editor.commands.bindKey("Ctrl-L", null);

            ace.config.loadModule('ace/ext/language_tools', function() {
                snippetManager = ace.require('ace/snippets').snippetManager;
                // check markdown_shortcut_func and call it if it is a function
                var markdownShortcutFunc = aceConfigObj.markdowns.shortcutsFunc;
                var isValidFunction = typeof(markdownShortcutFunc) == 'function';

                // check the function obj is really a function
                if (isValidFunction) {
                    markdownShortcutFunc(editor, snippetManager);
                }
            });
        }
    }

}
