Gitit Bigger
============

Gitit Bigger: Git and Markdown based wiki, Bootstrap, ace Editor, syntax
highlight and docker deploy support.

基于 Git 和 Markdown 的超棒的 Wiki 系统，Bootstrap、Ace
编辑器等增强，支持 Docker 部署。

开始 Start Bigger
=================

    假定你已安装 Git 和 Gitit

-  普通版

.. code:: bash

    git clone https://github.com/menduo/gitit-bigger ~/workspace/gitit;
    cd ~/workspace/gitit;
    cp sample.gitit.conf my-gitit.conf;
    ./run/run.sh start;

-  Docker 版

.. code:: bash

    docker run -d --name gitit -p 7500:7500 menduo/gitit-bigger;

访问：\ http://127.0.0.1:7500

Demo & Screeenshots
===================

Demos
-----

-  Gitit Bigger：\ https://wiki.menduo.net/gitit-bigger (Read Only)
-  Gitit 官方：\ http://gitit.net

截图 Screenshots
----------------

查看 View
~~~~~~~~~

-  `view.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/view.png>`__
-  `view-ipad-mini.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/view-ipad-mini.png>`__
-  `view-iphone6.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/view-iphone6.png>`__

编辑 Edit
~~~~~~~~~

-  `edit.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/edit.png>`__
-  `edit-ipad-mini.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/edit-ipad-mini.png>`__
-  `edit-iphone6.png <https://github.com/menduo/gitit-bigger/blob/master/screenshots/edit-iphone6.png>`__

Gitit 主要特性
==============

-  无数据库
-  Git 版本控制
-  Markdown 格式
-  Wiki 化：
-  子目录，无限目录（这也是我抛弃其他一些类似 wiki 系统的原因）
-  中文目录、中文标题、中文分类
-  完美支持中文搜索
-  支持分类
-  支持自定义标题

-  代码高亮
-  支持公式等（我基本不用）
-  导出 epub 等（基于 pandoc）

更多关于 Gitit 的安装、部署、优化的中文介绍和说明，请见: -
`gitit\_base.md
简介、安装、部署 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_base.md>`__
- `gitit\_config.md
配置 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_config.md>`__

Gitit Bigger VS Gitit
=====================

-  Bootstrap 模板
-  Ace Editor
-  Ace Editor 的编辑模式已设为 ``markdown``\ 。
-  支持代码高亮
-  搜索、替换（cmd+option+f）
-  Tab 缩进、恢复（tab、shift+tab）
-  快捷键
-  ...

-  采用配置文件方式启动，多个实例轻松共享资源
-  支持自定义 Ace 编辑器启用/禁用、模式、样式等配置
-  支持 Markdown 模式下快捷键
-  数学公式：支持 MathJax 启用/禁用，自定义 MathJax 源
-  代码高亮：支持使用 highlight.js 高亮代码 - Gitit 的高亮需要服务端支持
-  增加启动、部分、自动备份脚本或帮助

注意：wikidata 仓库
===================

请注意检查你的 ``wikidata/`` 目录的 git 配置。请注意： - ``wikidata``
文件夹是一个本地仓库，所有的 wiki 页面都将保存到此处； - ``Gitit``
启动时，会检查这个文件夹是否存在，如果不存在，Gitit
将会创建它，并初始化它为一个本地仓库 - 只有提交到仓库里的文件，才会被
Gitit 添加到 wiki 中。 -
如果你想要将此仓库与你的远程仓库绑定、同步：你需要： - clone 你的 wiki
仓库到 ``wikidata``
文件夹：\ ``git clone your-wikidata.git ./wikidata``\ ，或者： - 运行
``git remote`` 相关命令，使 ``wikidata`` 文件夹和你的远程仓库连接起来；

.. code:: bash

    # 如果  wikidata 文件夹尚不存在
    cd ~/workspace/gitit
    git clone your-wikidata.git ./wikidata
    git branch --set-upstream-to=origin/master master
    # 启动 gitit 服务: ./run/run.sh start

    # 如果 wikidata 已经存在，但并没有和你的远程仓库绑定
    cd wikidata
    git remote add origin path/to/your-wikidata.git
    git branch --set-upstream-to=origin/master master
    # 启动 gitit 服务: ./run/run.sh start

配置、自定义 JS/CSS
===================

Gitit Bigger 提供一定程度的配置。

你可以通过在 ``templates/page_more_scripts.st`` 里定义
``BIGGER_SETTINGS_APPEND`` 对象来覆盖默认配置。

包括： - ace 编辑器 - markdown - MathJax 数学公式插件 - highlightjs
代码高亮 - Google Analytics 统计

详情见：\ `gitit\_bigger\_config.md <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_bigger_config.md>`__

工具 Utils
==========

-  启动控制
-  批量修改扩展名
-  自动备份辅助

详情见：-
`gitit\_bigger\_utils.md <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_bigger_utils.md>`__

通过 Shell 编辑 wiki
====================

不通过 web界面，也可以操作我们的 Gitit Wiki。背景： 1. ``wikidata``:
wiki pages 的仓库 2. 只有提交到仓库里的文件，才会被 Gitit 添加到 wiki
中。

.. code:: bash


    # 进入 wikidata 目录
    cd /path/to/your/wikidata

    # 新增文件并输入一些字符串
    touch new_page.md
    echo "hello menduo" >> new_page.md

    # 添加新文件到仓库
    git add new_pge.md
    git commit -m "add new_page.md file"

    # 更新文件并提交到仓库
    echo "new line" >> old_page.md
    git add old_page.md
    git commit -m "update old_page.md "

    # 推送到远程仓库
    git push origin master

多个实例
========

通过配置文件的方式，可以轻松运行多个 Gitit 实例。除 wiki.menduo.net
外，我也运行了另外的实例来做私人笔记。 1.
``cp sample.gitit.conf my-gitit-private.conf;`` 2. 更新
``my-gitit-private.conf`` 里的相关配置，尤其是：端口、wikidata
目录（详见\ `gitit\_config.md
配置 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_config.md>`__\ ）
3. 启动新实例：\ ``gitit -f my-gitit-private.conf``

注意 - 如果 ``my-gitit.conf`` 和 ``my-gitit-private.conf``
这两个实例使用不同的用户，可能会造成 cookies 的混乱。 -
在服务端时，可考虑使用 ``nginx``
做反向代理，为每个实例绑定一个二级域名。 - 在本地时，可以用
``localhost`` 和 ``127.0.0.1`` 一类的来处理 cookie 域问题。

Docs
====

-  `Gitit
   简介、安装、部署 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_base.md>`__
-  `Gitit
   配置项介绍 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_config.md>`__
-  `Gitit-Bigger-Docker
   版介绍 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_bigger_docker.md>`__
-  `Gitit-Bigger
   定制说明 <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_bigger_config.md>`__
-  `Gitit-Bigger
   工具.md <https://github.com/menduo/gitit-bigger/blob/master/docs/gitit_bigger_utils.md>`__

Changelogs
==========

-  简体中文:
   `CHANGELOG.md <https://github.com/menduo/gitit-bigger/blob/master/CHANGELOG.md>`__
-  English:
   `CHANGELOG\_EN.md <https://github.com/menduo/gitit-bigger/blob/master/CHANGELOG_EN.md>`__

反馈、建议、联系
================

-  Github Issues：\ https://github.com/menduo/gitit-bigger/issues
-  Email: shimenduo@gmail.com

Links
=====

-  Github：\ https://github.com/menduo/gitit-bigger
-  DockreHub：\ https://hub.docker.com/r/menduo/gitit-bigger
-  Demo: https://wiki.menduo.net/gitit-bigger (Read Only)
-  gitit official site: http://gitit.net
-  gitit official github: https://github.com/jgm/gitit
-  在Archlinux上部署gitit Wiki:
   http://www.360doc.com/content/12/0518/21/21412_211977928.shtml
-  Gitit - git based wiki:
   http://walkingice.blogspot.hk/2011/11/gitit-git-based-wiki.html
-  Hyzual/docker-gitit: https://github.com/Hyzual/docker-gitit
-  Gitit Bootstrap
   模板：\ `Changaco/gitit-bootstrap <https://github.com/Changaco/gitit-bootstrap>`__
-  Gitit ace editor 支持 `Getting the Ace editor to work with
   gitit <https://gist.github.com/lmullen/e2d2d4aabf84220c517a>`__
