(
    function gen_breadcrumb(pathname){
    if (!pathname){
        pathname = location.pathname;
    }

    var topped = ["/_search", "/_index", "/_categories", "/_upload","/_activity","/_register","/_login"]

    if ( pathname== '/' ){
        return;
    }

    var breadcrumb = $('#breadcrumb');

    if(topped.indexOf(pathname)>=0){
        var item = pathname.split("/_")[1];
        var a = $('<a/>');
        $(a).text(item).attr('href', pathname).attr('title', item);
        var item = $('<li/>');
        $(item).append(a);
        $(breadcrumb).append($(item));
        return;
    }


    var action = "view";
    var actions = ['_edit',"_history",'_delete',"_diff"];

    var plist = pathname.split('/');
    plist.shift();

    if (plist[plist.length-1]==""){
        plist.pop();
    }


    var pfirst = plist[0];
    var is_action = actions.indexOf(pfirst) >=0;
    var pagenames = plist.slice(0,plist.length);

    if (is_action){
        pagenames = plist.slice(1,plist.length);
        action = plist[0].split("_")[1];
    }

    if(pfirst.search('@')>=0){
        action = "discuss";
        pagenames = [plist.join('/')]
    }


    function gen_path(item){
        var to = pagenames.indexOf(item)+1;
        var path_items = pagenames.slice(0,to);
        return path_items.join('/')
    }

    function gen_item(item){
        var path = "/"+gen_path(item);

        var a = $('<a/>');
        $(a).text(decodeURI(item)).attr('href', path).attr('title', decodeURI(item));

        var li_ele = $('<li/>');
        $(li_ele).append(a);

        if (pagenames.indexOf(item) != pagenames.length-1){
            var d = $('<span class="text-muted"> (<a href="" class="text-muted" title="go to dir but not page">d</a>)</span>');
            $(d).find("a").attr("href", path+"/");
            $(li_ele).append(d);
        }

        $(breadcrumb).append($(li_ele));
        return true;
    }

    pagenames.map(gen_item)

    var action_ele = $('<span class="text-muted"></span>');
    action_ele.text(" - " + action.toUpperCase());
    if (action!='view'){
        $(breadcrumb).append(action_ele);
    }


})()