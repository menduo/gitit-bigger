function _getBiggerSettingsObject() {
    var _settings = BIGGER_SETTINGS_BASE;

    // check user custome settings
    var _has__bs = typeof(BIGGER_SETTINGS_APPEND) != "undefined" && $.isPlainObject(BIGGER_SETTINGS_APPEND);
    if (!_has__bs) {
        return _settings;
    }
    // merge user custom settings
    MergeObjectAttrs(_settings, BIGGER_SETTINGS_APPEND);
    return _settings;
}

function detectMaxjaxActions(mathjaxConfig) {
    // insert mathjx only if the pathname is not exclude.
    // mathjaxConfig.exclude: ['/_search', '/_delete', "/_login"]
    //
    var _pathnameFirst = '/' + location.pathname.split('/')[1];
    var isExclued = mathjaxConfig.exclude.indexOf(_pathnameFirst) >= 0;
    if (mathjaxConfig.enable && !isExclued) {
        InsertNewScript(mathjaxConfig.path);
    }
}

function detectAceEditorActions(editorEle, aceConfig) {
    if (!editorEle) {
        return;
    }
    // detect device type
    var is_phone = isMobile.phone;
    var is_tablet = isMobile.tablet;
    var is_seven_inch = isMobile.seven_inch;
    var is_mobile_device = is_phone || is_tablet || is_seven_inch;

    // update summary notice.
    var logMsg = document.getElementById("logMsg");
    logMsg.setAttribute("placeholder", "Edit summary (Briefly describe your changes)")

    if (!is_mobile_device && aceConfig.enable) {
        init_ace_editor(editorEle, aceConfig);
    } else {
        // on mobile page, use the default text area.
        $('#editedText').css('visibility', "visible").css('display', "block");
    }
}

function improveSpecialPages() {
    // import some pages
    var pathname = location.pathname;

    // improve the upload page.
    if (pathname == '/_upload') {
        $("#file").change(function() {
            var fn = $(this).val().replace(/.*\\/, "");
            $("#wikiname").val(fn);
        });
    }

    // set query value to input if on a search result page.
    if (pathname == "/_search") {
        var search_text = getURLParamByName('patterns');
        if (search_text && search_text != "") {
            $('.input-search-form').each(function(idx, item) {
                $(item).val(search_text)
            });
        }
    }
}


function UIUEImprove() {
    // scroll to top button
    var scrollup = $('.scrollup');
    $(scrollup).hide();
    $(window).scroll(function() {
        if ($(this).scrollTop() > 100) {
            $(scrollup).fadeIn();
        } else {
            $(scrollup).fadeOut();
        }
    });
    $(scrollup).on, ("click", function() {
        $('html, body').animate({
            scrollTop: 0
        }, 100);
        return false;
    });

    // update buttons or inputs into bootstrap style.
    $('input[type="submit"], input[type="button"]').each(function(idx, item) {
        $(item).addClass('btn btn-default btn-sm');
    });

    $('table').each(function(idx, item) {
        $(item).addClass('table table-bordered table-hover')
    });
}


function utilsImprove(biggerConfig) {
    if (biggerConfig.google_analytics_id != "") {
        enableGoogleAnalytics(biggerConfig.google_analytics_id);
    }

    if (biggerConfig.highlightjs.enable) {
        var cssFilePath = "/js/highlight/styles/" + biggerConfig.highlightjs.theme + ".css";
        InsertNewStylesheet(cssFilePath);
        var callback = function() {
            $('pre').each(function(i, block) {
                hljs.highlightBlock(block);
            });
        }
        InsertNewScript("/js/highlight/highlight.pack.js", callback);
    }
    if (biggerConfig.target_blank) {
        $("#content a[href^='http://']").attr("target", "_blank");
    }

}

$(document).ready(function() {
    var editorEle = document.getElementById("editedText"); // get editor text area
    var biggerConfig = _getBiggerSettingsObject();
    var mathjaxConfig = biggerConfig.mathjax;
    var aceConfig = biggerConfig.ace;

    detectMaxjaxActions(mathjaxConfig);
    detectAceEditorActions(editorEle, aceConfig);
    improveSpecialPages();
    UIUEImprove();
    utilsImprove(biggerConfig);
});
