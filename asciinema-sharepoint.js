! function() {
    function e(e, t) {
        e.parentNode.insertBefore(t, e.nextSibling)
    }

    function t(e, t) {
        function i(e) {
            var i = t.getAttribute("data-" + e);
            return i ? e + "=" + i : void 0
        }
        var a = ["file", "width", "height", "autoPlay", "preload", "loop",
          "startAt", "speed", "poster", "fontSize", "title", "author",
          "authorURL", "authorImgURL"];
        return "?" + a.map(i).filter(Boolean).join("&")
    }

    function i(e) {
        var t = document.createElement("a");
        return t.href = e, t
    }

    function a(e) {
        var t = i(e.src);
        return t.protocol + "//" + t.host
    }

    function n(i) {
        function n(e) {
            if (e.origin === s) {
                var t = e.data[0],
                    i = e.data[1],
                    a = c.contentWindow || c;
                e.source == a && "asciicast:size" == t && (c.style.width = "" +
                    i.width + "px", c.style.height = "" + i.height + "px")
            }
        }
        if (!i.dataset.player) {
            var s = a(i),
                l = s + "/api",
                r = i.id.split("-")[1],
                o = document.createElement("div");
            o.id = "asciicast-container-" + r, o.className = "asciicast", o.style
                .display = "block", o.style.float = "none", o.style.overflow =
                "hidden", o.style.padding = 0, o.style.margin = "20px 0", e(i,
                    o);
            var c = document.createElement("iframe");
            c.src = "asciinema-sharepoint.aspx" + [t(o, i),"id=" + r].join("&"), c.id =
                "asciicast-iframe-" + r, c.name = "asciicast-iframe-" + r, c.scrolling =
                "no", c.setAttribute("allowFullScreen", "true"), c.style.overflow =
                "hidden", c.style.margin = 0, c.style.border = 0, c.style.display =
                "inline-block", c.style.width = "100%", c.style.float = "none",
                c.style.visibility = "hidden", c.onload = function() {
                    this.style.visibility = "visible"
                }, o.appendChild(c), window.addEventListener("message", n, !1),
                i.dataset.player = o
        }
    }
    var s = document.querySelectorAll("script[id^='asciicast-']");
    [].forEach.call(s, n)
}();
