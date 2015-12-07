# Gitit 中文简介
Git + Markdown Wiki 系统，自带 HTTP Server。
- gitit official site: [http://gitit.net](http://gitit.net)
- gitit official github: [https://github.com/jgm/gitit](https://github.com/jgm/gitit)

# 主要特性：
- 无数据库
- Git 版本控制
- Markdown 格式
- Wiki 化：
  - 子目录，无限目录（这也是我抛弃其他一些类似 wiki 系统的原因）
  - 中文目录、中文标题、中文分类
  - 完美支持中文搜索
  - 支持分类
  - 支持自定义标题

- 代码高亮
- 支持公式等（我基本不用）
- 导出 epub 等（基于 pandoc）

## 缺憾及解决方案
- **界面较丑**：像我这样弄一套 bootstrap 模板；
- **无用户管理/限制**：稍差，但如果是私用或者小范围使用，倒也足够。
  - 请参阅 `require-authentication`、`access-question`、`access-question-answers` 配置项。
  - 创建自己所需要的用户后，可以将项目目录的 `gitit-users` 文件权限设置为只读。

- **编辑器较差**：像我这样启用 ace 编辑器即可（markdown 模式）；
- **某些更改必须重启才能生效**：如果 gitit 配置文件、模板、静态文件有修改，必须重启 gitit，这很好办，用命名或脚本都可以轻松做到。
- 使用 `cabal` 方式安装最新版本时：
  - 安装麻烦：安装过程比较慢，巨慢。没办法，只能慢慢来。
  - 安装失败：在某些版本的操作系统上可能会安装失败，因为它的依赖和操作系统的不符。
    - 我没搞定，正巧我有台 ubuntu 主机支持，于是就安装成功了。个人用的 mac 上也成功了。
    - 如果你没有合适的主机，可以考虑用 docker 来安装。

# 安装 Gitit
## Ubuntu/Debian
### 使用 apt-get

```bash
sudo apt-get install gitit
```

注意，目前 `apt-get` 安装的 Gitit 应该还是 0.10.x 版本，而官方目前最新版本是 0.11.x。依我个人经验来看，并无太大差别。但 0.11.x 有个我特别喜欢的新功能：自定义文件名后缀。

在 0.10.x 下，即使你在配置文件里设置后缀为 `md`，最后 gitit 生成的文件依然是 `page`。如果使用 .md 的话，无论是用浏览器查看，还是用 OS 的编辑器打开时，可能效果都更好。

但是，如果要安装 0.11.x，请做好时间上的准备，这个安装过程非常耗时、费力（也许是在下愚笨，如有好方法，还望告知我）。

### 使用 cabal

```bash
sudo apt-get install -y git cabal-install libghc-zlib-dev
cabal update && cabal install gitit
echo "export PATH=~/.cabal/bin:$PATH" >> ~/.bash_profile
source ~/.bash_profile
```

#### 注意：
- 安装麻烦：安装过程比较慢，巨慢。没办法，只能慢慢来。
- 安装失败：在某些版本的操作系统上可能会安装失败，因为它的依赖和操作系统的不符。
- 我没搞定，正巧我有台 ubuntu 主机支持，于是就安装成功了。个人用的 mac 上也成功了。
- 如果你没有合适的主机，可以考虑用 docker 来安装。

## Mac OS X

```bash
brew update && brew install cabal-install
```

```
echo "export PATH=~/.cabal/bin:$PATH" >> ~/.bash_profile && source ~/.bash_profile
```

```bash
cabal install gitit && source ~/.bash_profile
```

# 部署
## 依配置文件&后台运行

```bash
nohup gitit -f my-gitit.conf > logs-gitit.log & echo $! > pid-my-gitit.conf.pid 2>&1 &
```

## 自动 Pull/Push

```bash
* * * * * /path-to/auto-data.sh > /path-to/logs-auto-data.log  2>&1 &
```

# 文件结构

```bash
./workspace/gitit

├── gitit-users
├── gitit.log
├── my-gitit.conf
├── static
│   ├── css
│   │   └── custom.css
│   └── img
│       └── logo.png
├── templates
│   └── footer.st
└── wikidata
    ├── .git
    ├── gitit
    │   ├── guide.md
    ├── index.md
└── wikidata-private
    ├── .git
    ├── private_wiki_page.md
```

by [shajiquan](https://github.com/shajiquan/gitit-bigger)
