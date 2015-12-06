function getURLParamByName(name) {
    // get param value from url by name.
    var half = location.search.split('&' + name + '=')[1];
    if (!half) half = location.search.split('?' + name + '=')[1];
    return half !== undefined ? decodeURIComponent(half.split('&')[0]) : null;
}

function InsertNewScript(scriptPath) {
    // include a script to current page
    var jq = document.createElement('script');
    jq.src = scriptPath;
    document.getElementsByTagName('head')[0].appendChild(jq);
    return jq
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
