<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"> 
  <link rel="stylesheet" type="text/css" href="asciinema-player.css" />
  <script type="text/javascript" src="asciinema-player.js"></script>
  <script type="text/javascript" src="jquery.min.js"></script>
</head>
<body>
<script>
function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}
var id = getParameterByName("id");
var awidth = getParameterByName("width") || 80;
var aheight = getParameterByName("height") || 24;
var aautoPlay = getParameterByName("autoPlay") || false;
var apreload = getParameterByName("preload") || false;
var aloop = getParameterByName("loop") || false;
var astartAt = getParameterByName("startAt") || "00";
var aspeed = getParameterByName("speed") || 1.0;
var aposter = getParameterByName("poster") || "nps:0";
var afontSize = getParameterByName("fontSize") || "small";
var atheme = getParameterByName("theme") || "asciinema";
var atitle = getParameterByName("title") || "";
var aauthor = getParameterByName("author") || "";
var aauthorURL = getParameterByName("authorURL") || "";
var aauthorImgURL = getParameterByName("authorImgURL") || "";
var file = getParameterByName("file") || "";
document.write("<div id=\"" + id + "-container\"></div>")

asciinema.player.js.CreatePlayer(
    id + "-container",
    file, {
        width: awidth,
        height: aheight,
        autoPlay: aautoPlay,
        preload: apreload,
        loop: aloop,
        startAt: astartAt,
        speed: aspeed,
        poster: aposter,
        fontSize: afontSize,
        theme: atheme,
        title: atitle,
        author: aauthor,
        authorURL: aauthorURL,
        authorImgURL: aauthorImgURL
    }
);

$(function() {
    var target = parent.postMessage ? parent : (parent.document.postMessage ?
        parent.document : undefined);
    if (typeof target != "undefined" && window !== window.parent) {
        var w = $('.asciinema-player').width();
        var h = $(document).height();
        target.postMessage(['asciicast:size', {
            width: w,
            height: h
        }], '*');
    }

    function onMessage(e) {
        var event = e.data[0];
        if (event == 'asciicast:play') {
            $('.start-prompt').click();
        }
    }

    window.addEventListener("message", onMessage, false);
});
</script>
</body>
</html>
