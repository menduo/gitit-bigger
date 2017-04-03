# Gitit 配置说明
# 配置文件及执行流程
在任意文件夹内运行 `gitit` 都可以启动 gitit 服务。可以给 gitit 传递如下参数：
- `-p`: gitit web 服务端口号
- `-f`: 指定一个配置文件，gitit 会解析配置文件中的 `port` 等配置来启动服务。比如： `gitit -f my-gitit.conf`。
  - 如果不指定，gitit 将会使用默认配置，默认配置可由 `gitit --print-default-config > my-gitit.conf` 获得。

在 gitit 启动服务时，它会根据配置文件来绑定 IP、端口，创建必要的文件夹、文件等。
- `static/` : 静态文件所在目录
- `templates/`: 模板文件所在目录
- `wikidata`: wiki 条目文件所在目录
- `gitit-users`: 用户数据所在文件
- `gitit.log`:  日志文件

以上这些项，都可以在配置文件中自定义，不过我建议使用官方默认的。以下是一些重要配置项。

## 重要配置项
- `port`: 7500 # Gitit Web Server 的端口号，官方默认是 5001，我自己用的配置是 7005。
- `wiki-title`: Wiki # the title of the wiki.
- `require-authentication: modify`: #授权阶段。可选 `none`、`modify`、`read`：
  - `none`: 所有阶段（编辑、浏览等）都 `不需要` 用户登录。
  - `modify`: 编辑阶段。当用户要编辑、删除条目时，需要登录。
  - `read`：阅读阶段。当用户需要浏览条目时，需要登录。

- `access-question`: Who is menduo? # 访问控制问题。
  - 在创建用户时，将必须回答这个问题。答案必须是下方的 `access-question-answers` 中指定的答案，答案间使用英文逗号分隔。

- `access-question-answers`: [github.com/menduo](https://github.com/menduo), [https://github.com/menduo](https://github.com/menduo)
- `default-extension`: md # 默认文件名扩展，官方默认的是 `page`，我自己的版本使用的是 `md`。
  - `注意`：这个只在 Gitit 0.11.x 上才有作用，这意味着，当你使用 0.10.x 时，即使配置了默认扩展为 `md`，最后创建的文件，其扩展名仍然是 `page`。

- `default-page-type`: Markdown # 默认页面类型
- `front-page`: index # 首页文件
- `no-edit`: Help # 禁止编辑的页面, 逗号分隔
- `no-delete`: index, Front Page, Help # 禁止删除的页面/文件，逗号分隔
- `default-summary`: automatically added commit message. # 默认编辑摘要，为空时，编辑一个条目时，如果不输入编辑摘要，Gitit 就会返回错误，要求必须手动输入。
- **授权相关**：gitit 支持 github 接入，但我没有使用，也没有研究。
- **安全相关**: gitit 默认使用 html 表单认证，而非 HTTP 方式，gitit 默认也启用了防跨站攻击。这里不再详细说明，我直接使用的是默认配置。

## 其他配置项
其他一些配置项，在我自己使用时，有的做了更改（如文件和页面体积），有的则使用默认的。
- `table-of-contents`: yes # 是否默认使用 toc 目录，可选项：yes、no。可在页面内配置，见下方 `页面内配置`
- `repository-type`: `Git` # 指定版本控制系统。默认是 Git，可选项有：`Git`、`Darcs` 及 `Mercurial`。
  - `注意`：无论使用何种版本控制系统，运行 Gitit 的宿主 OS 上都必须先安装它。

- `repository-path`: wikidata # 指定仓库地址，也即 wiki 条目所在的文件夹。
  - 相对路径。相对于运行 `gitit -f my-gitit.conf` 时所在的文件夹。
  - 如果指定文件夹不存在，gitit 将在启用服务时自动创建。
  - 建议不要更改。

- `use-recaptcha`，`recaptcha-private-key`、`recaptcha-public-key` # 是否使用 recaptcha，如要使用，还要配置相关 key。
- `use-feed`: no # 是否启用 feed。feed 还有其他相关配置，比如更新时间等，详情请参阅配置文件内说明。
- `pdf-export`: no # 是否支持 pdf 导出，这需要 pandoc 或其他插件支持，详情请参阅配置文件内说明。
- `max-upload-size`:4096K # 最大文件上传尺寸。
- `max-page-size: 1024K` # 页面最大尺寸。

## 页面内配置
gitit 支持在编辑页面时来配置当前页面。

### 可用选项
- `title`: 页面标题
- `toc`: 是否使用 toc。可选项：`yes`、`no`。默认为 `yes`.
- `categories`: 页面所属分类，空格或英文逗号分隔，建议使用英文逗号。
- `format`: 页面格式，比如 `markdown`，或 `markdown+lhs`。我只使用 `markdown`，配置文件里也有指定，因此很少在页面内使用这个配置。

### 完整示例

```markdown
---
title: 这是一个页面的标题
toc: yes/no
categories: Miao, Wu, 分类呢
format: markdown+lhs
...
```

注意，必须严格按照此格式，否则无效。`...` 是必须的，`:` 是英文的。

从 Gitit 0.10.7 开始，支持以 `---` 代替 `...` 当作结尾标识。
