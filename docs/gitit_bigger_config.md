# Gitit Bigger 相关设置

Gitit Bigger 提供一定程度的配置，你可以通过在 `templates/page_more_scripts.st` 里定义 `BIGGER_SETTINGS_APPEND` 对象来覆盖默认配置。

默认配置：

## 配置方式：

1. 创建 `templates/page_more_scripts.st` 文件（该文件没有被加入到 gitit-bigger 的仓库里）；
2. 在 `templates/page_more_scripts.st` 里的 JavaScript 里，按规则定义 `BIGGER_SETTINGS_APPEND` 以覆盖默认配置
3. 重启 Gitit。对所有静态文件的更新，都必须要重启 gitit 服务才能看到效果；可运行 `./run/run.sh restart` 来重启；
4. 此外：
5. `templates/page_more_scripts.st` 是一个 HTML 文件，你可以做其他任何能做的事情；

## 默认配置说明

主要内容：

- ace 编辑器相关
    - 默认启用；
    - markdown 相关
        - 默认启用；
        - 快捷键：默认启用；
        - 快捷键函数：默认为 Gitit Bigger 提供的；
    - styles: 一个对象，键名都必须是 DOM 方法；
-  MathJax 数学公式插件相关
    - 默认启用；
    - 在 mathjax.exclude 数据组的页面，MathJax 插件将不会被引入；
-  highlightjs 代码高亮插件相关
    - 默认启用—因我发现 Gitit 自己的高亮机制需要不少其他处理， highlightjs 比较省事；
    - theme: 即 `/static/js/highlight/styles/` 目录下的某个文件名，不带扩展。比如： `monokai_sublime`
-  其他细节
    -  google_analytics_id: 如果值不为空，将会引入 Google Analytics；值举例：UA-19890535-1
    -  新窗口打开 http 链接：默认关闭；

## 示例


```html
<script type="text/javascript" src="/path/to/js/file.js"></script>

<style type="text/css">
  color: red;
</style>

<script>
// more js scripts here
BIGGER_SETTINGS_APPEND = {
    "ace":{
        "styles":{
            "fontSize":"15px"
        }
    },
    "mathjax":{
        "enable":false,
    }
}
</script>
```

## 默认配置源码
```javascript
// Base settings.
// You can override base config by using a BIGGER_SETTINGS_APPEND object.
// Waring, override by "BIGGER_SETTINGS_APPEND" object.
BIGGER_SETTINGS_BASE = {
    // ace editor settings
    // more about ace editor: https://ace.c9.io
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
    },

    // highlightjs
    // If your server can't highlightjs the syntax, you can use highlightjs
    // default: false
    // more about highlightjs: https://highlightjs.org/
    "highlightjs": {
        "enable": true,
        "theme": "monokai_sublime"
    },
    "google_analytics_id": "",
    "target_blank": false,
}
```