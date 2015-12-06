function setShortcuts(editor, snippetManager) {
    // snippets from https://github.com/shajiquan/bootstrap-markdown-editor/blob/master/src/bootstrap-markdown-editor.js
    editor.commands.addCommand({
        name: 'bold',
        bindKey: {
            win: 'Ctrl-B',
            mac: 'Command-B'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor,
                    '**${1:text}**');
            } else {
                snippetManager.insertSnippet(editor, '**' +
                    selectedText + '**');
            }
        },
        readOnly: false
    });

    editor.commands.addCommand({
        name: 'italic',
        bindKey: {
            win: 'Ctrl-I',
            mac: 'Command-I'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor, '*${1:text}*');
            } else {
                snippetManager.insertSnippet(editor, '*' +
                    selectedText + '*');
            }
        },
        readOnly: false
    });

    editor.commands.addCommand({
        name: 'link',
        bindKey: {
            win: 'Ctrl-L',
            mac: 'Command-L'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor,
                    '[${1:text}](http://$2)');
            } else {
                if (selectedText.search('http://') == 0 ||
                    selectedText.search("https://") == 0) {
                    snippetManager.insertSnippet(editor, '[' +
                        selectedText + '](' + selectedText +
                        ')');
                } else {
                    snippetManager.insertSnippet(editor, '[' +
                        selectedText + '](http://$1)');
                }

            }
        },
        readOnly: false
    });


    editor.commands.addCommand({
        name: 'image',
        bindKey: {
            win: 'Ctrl-I',
            mac: 'Ctrl-I'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor,
                    '![${1:Image Description}](http://$2)');
            } else {
                snippetManager.insertSnippet(editor, '![' +
                    selectedText + '](http://$1)');
            }
        },
        readOnly: false
    });


    editor.commands.addCommand({
        name: 'iline-code',
        bindKey: {
            win: 'Ctrl-K',
            mac: 'Command-K'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor, '`${1:text}`');
            } else {
                snippetManager.insertSnippet(editor, '`' +
                    selectedText + '`');
            }
        },
        readOnly: false
    });


    editor.commands.addCommand({
        name: 'code',
        bindKey: {
            win: 'Ctrl-Shift-K',
            mac: 'Command-Shift-K'
        },
        exec: function(editor) {
            var selectedText = editor.session.getTextRange(editor.getSelectionRange());

            if (selectedText === '') {
                snippetManager.insertSnippet(editor,
                    '```${1:text}```');
            } else {
                var value = '```\n' + selectedText + '\n```\n'
                snippetManager.insertSnippet(editor, value);
            }
        },
        readOnly: false
    });

}



// Base settings.

// You can override base config by using a BIGGER_SETTINGS object.

// Waring, override by BIGGER_SETTINGS.

BIGGER_SETTINGS_BASE = {
    // ace editor settings
    "ace": {
        // switch
        "enable": true,

        // ace editor, core settings.
        "setTheme": "ace/theme/github", // theme, and below are ace settings
        "setMode": "ace/mode/markdown", // editor mode, default ,will be override by markdowns.enable
        "setShowPrintMargin": false,
        "setShowGutter": false,
        "setUseWrapMode": true,
        "setUseSoftTabs": true, // instend tabs with spaces

        // markdown reloadted,
        "markdowns": {
            "enable": true, // enable markdown mode
            "shortcuts": true, // enable markdown shortcuts
            "shortcutsFunc": setShortcuts // custome shortcut function
        },

        // styles: document.style.ATTRS, case-sensitive.
        "styles": {
            "fontSize": "13px",
            "fontWight": "normal",
            "fontColor": "#333"
        }
    },
    "mathjax": {
        "enable": true,
        // "path": "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML",
        "path": "http://cdn.bootcss.com/mathjax/2.5.3/MathJax.js?config=TeX-AMS-MML_HTMLorMML",
        "exclude": ["/_search", "/_index", "/_category", "/_upload", "/_activity", "/_register", "/_login",
            "/_delete", "/_diff"
        ]
    }
}
