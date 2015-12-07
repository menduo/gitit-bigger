function getURLParamByName(name) {
    // get param value from url by name.
    var half = location.search.split('&' + name + '=')[1];
    if (!half) half = location.search.split('?' + name + '=')[1];
    return half !== undefined ? decodeURIComponent(half.split('&')[0]) : null;
}

function InsertNewScript(scriptPath, callback) {
    // include a script to current page
    var jq = document.createElement('script');
    jq.src = scriptPath;
    document.getElementsByTagName('head')[0].appendChild(jq);

    if (callback) {
        jq.onload = callback;
    }
    return jq
}

function InsertNewStylesheet(path, callback) {
    // include a script to current page
    var link = document.createElement('link');
    link.href = path;
    link.rel = "stylesheet";
    document.getElementsByTagName('head')[0].appendChild(link);
    return link
}


function MergeObjectAttrs(target_obj, source_obj) {
    // Merge attrs from source_obj into target_obj
    // if override:
    function isObj(obj) {
        // innner util to check type of 'obj's
        return typeof(obj) == "object";
    }

    if (!isObj(target_obj) || !isObj(source_obj)) {
        return {}; // this is ERROR
    }

    function extendOne(target, source) {
        for (var variable in target) {
            if (source.hasOwnProperty(variable)) {
                var _sov = target[variable];
                var _bov = source[variable];
                var _valid_objs = isObj(_sov) && isObj(_bov);

                if (isObj(_sov) && isObj(_bov)) {
                    target[variable] = extendOne(_sov, _bov);
                } else {
                    target[variable] = _bov;
                }

            }
        }
        return target;
    }

    res = extendOne(target_obj, source_obj);
    return res;
}

// enable Google Analytics
function enableGoogleAnalytics(googleAnalyticsId) {
    (function(i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', googleAnalyticsId, 'auto');
    ga('send', 'pageview');
}
