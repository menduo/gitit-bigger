/* 
March 19, 2004 MathHTML (c) Peter Jipsen http://www.chapman.edu/~jipsen

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.
This program is distributed in the hope that it will be useful, but 
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License 
(at http://www.gnu.org/copyleft/gpl.html) for more details.
*/

function convertMath(node) {// for Gecko
  if (node.nodeType==1) {
    var newnode = 
      document.createElementNS("http://www.w3.org/1998/Math/MathML",
        node.nodeName.toLowerCase());
    for(var i=0; i < node.attributes.length; i++)
      newnode.setAttribute(node.attributes[i].nodeName,
        node.attributes[i].nodeValue);
    for (var i=0; i<node.childNodes.length; i++) {
      var st = node.childNodes[i].nodeValue;
      if (st==null || st.slice(0,1)!=" " && st.slice(0,1)!="\n") 
        newnode.appendChild(convertMath(node.childNodes[i]));
    }
    return newnode;
  }
  else return node;
}

function convert() {
  var mmlnode = document.getElementsByTagName("math");
  var st,str,node,newnode;
  for (var i=0; i<mmlnode.length; i++)
    if (document.createElementNS!=null)
      mmlnode[i].parentNode.replaceChild(convertMath(mmlnode[i]),mmlnode[i]);
    else { // convert for IE
      str = "";
      node = mmlnode[i];
      while (node.nodeName!="/MATH") {
        st = node.nodeName.toLowerCase();
        if (st=="#text") str += node.nodeValue;
        else {
          str += (st.slice(0,1)=="/" ? "</m:"+st.slice(1) : "<m:"+st);
          if (st.slice(0,1)!="/") 
             for(var j=0; j < node.attributes.length; j++)
               if (node.attributes[j].nodeValue!="italic" &&
                 node.attributes[j].nodeValue!="" &&
                 node.attributes[j].nodeValue!="inherit" &&
                 node.attributes[j].nodeValue!=undefined)
                 str += " "+node.attributes[j].nodeName+"="+
                     "\""+node.attributes[j].nodeValue+"\"";
          str += ">";
        }
        node = node.nextSibling;
        node.parentNode.removeChild(node.previousSibling);
      }
      str += "</m:math>";
      newnode = document.createElement("span");
      node.parentNode.replaceChild(newnode,node);
      newnode.innerHTML = str;
    }
}

if (document.createElementNS==null) {
  document.write("<object id=\"mathplayer\"\
  classid=\"clsid:32F66A20-7614-11D4-BD11-00104BD3F987\"></object>");
  document.write("<?import namespace=\"m\" implementation=\"#mathplayer\"?>");
}
if(typeof window.addEventListener != 'undefined'){
  window.addEventListener('load', convert, false);
}
if(typeof window.attachEvent != 'undefined') {
  window.attachEvent('onload', convert);
}
$(document).ready(function(){
    if (location.pathname.substr(0, 10) != '/_history/') return;
    $("#content").prepend("<p>Drag one revision onto another to see differences.</p>");
    $(".difflink").draggable({helper: "clone"});
    $(".difflink").droppable({
         accept: ".difflink",
         drop: function(ev, ui) {
            var targetOrder = parseInt($(this).attr("order"));
            var sourceOrder = parseInt($(ui.draggable).attr("order"));
            var diffurl = $(this).attr("diffurl");
            if (targetOrder < sourceOrder) {
                var fromRev = $(this).attr("revision");
                var toRev   = $(ui.draggable).attr("revision");
            } else {
                var toRev   = $(this).attr("revision");
                var fromRev = $(ui.draggable).attr("revision");
            };
            location.href = diffurl + '?from=' + fromRev + '&to=' + toRev;
        }
    });
});

$(document).ready(function() {
    Footnotes.setup();
});

var Footnotes = {
    footnotetimeout: false,
    setup: function() {
        var footnotelinks = $('.footnoteRef')

        footnotelinks.unbind('mouseover',Footnotes.footnoteover);
        footnotelinks.unbind('mouseout',Footnotes.footnoteoout);

        footnotelinks.bind('mouseover',Footnotes.footnoteover);
        footnotelinks.bind('mouseout',Footnotes.footnoteoout);
    },
    footnoteover: function() {
        clearTimeout(Footnotes.footnotetimeout);
        $('#footnotediv').stop();
        $('#footnotediv').remove();

        var id = $(this).attr('href').substr(1);
        var position = $(this).offset();

        var div = $(document.createElement('div'));
        div.attr('id','footnotediv');
        div.bind('mouseover',Footnotes.divover);
        div.bind('mouseout',Footnotes.footnoteoout);

        var el = document.getElementById(id);
        div.html('<div>'+$(el).html()+'</div>');

        $(document.body).append(div);

        var left = position.left;
        if(left + 420  > $(window).width() + $(window).scrollLeft())
            left = $(window).width() - 420 + $(window).scrollLeft();
        var top = position.top+20;
        if(top + div.height() > $(window).height() + $(window).scrollTop())
            top = position.top - div.height() - 15;
        div.css({
            left:left,
            top:top,
            opacity:0.95,
            position: "absolute"
            });
    },
    footnoteoout: function() {
        Footnotes.footnotetimeout = setTimeout(function() {
            $('#footnotediv').animate({
                opacity: 0
            }, 600, function() {
                $('#footnotediv').remove();
            });
        },100);
    },
    divover: function() {
        clearTimeout(Footnotes.footnotetimeout);
        $('#footnotediv').stop();
        $('#footnotediv').css({
                opacity: 0.9
        });
    }
}
function updatePreviewPane() {
    $("#previewpane").hide();
    var url = location.pathname.replace(/_edit\//,"_preview/");
    $.post(
        url,
        {"raw" : $("#editedText").val()},
        function(data) {
            $('#previewpane').html(data);
            // Process any mathematics if we're using MathML
            if (typeof(convert) == 'function') { convert(); }
            // Process any mathematics if we're using jsMath
            if (typeof(jsMath) == 'object') { jsMath.ProcessBeforeShowing(); }
            // Process any mathematics if we're using MathJax
            if (typeof(window.MathJax) == 'object') {
                // http://docs.mathjax.org/en/latest/typeset.html
                var math = document.getElementById("MathExample");
                MathJax.Hub.Queue(["Typeset",MathJax.Hub,math]);
            }
        },
        "html"
    );
    $('#previewpane').fadeIn(500);
};
$(document).ready(function(){
    $("#previewButton").show();
    $("#editedText").focus();
});
jQuery.fn.highlightPattern = function (patt, className) {
    // patt is a space separated list of strings - we want to highlight
    // an occurrence of any of these strings as a separate word.
    var regex = new RegExp('\\b(' + patt.replace(/ /, '|') + ')\\b', 'gi'),
        span = '<span class=\'' + className + '\'>' + '$1' + '</span>';
    return this.each(function () {
        if (this.getAttribute('highlighted') == 'true') return;
        this.innerHTML = this.innerHTML.replace(regex, span);
        this.setAttribute('highlighted', 'true');
    });
};
function toggleMatches(obj) {
    var obj = $(this);
    var pattern = $('#pattern').text();
    var matches = obj.next('.matches');
    matches.slideToggle(300);
    matches.highlightPattern(pattern, 'highlighted');
    if (obj.html() == '[show matches]') {
        obj.html('[hide matches]');
    } else {
        obj.html('[show matches]');
    };
}
$(function() {
    $('a.showmatch').on('click', toggleMatches);
    $('pre.matches').hide();
    $('a.showmatch').show();
});
$(document).ready(function () {
    $("#file").change(function () {
        var fn = $(this).val().replace(/.*\\/,"");
        $("#wikiname").val(fn);
    });
});
