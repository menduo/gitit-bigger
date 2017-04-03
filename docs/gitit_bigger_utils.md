# Gitit Bigger Utils
## 启动重启停止

```bash
./run/run.sh start/restart/stop # 启动/重启/停止
```

脚本将读取 run 目录上级目录的 my-gitit.conf 来启动、重启、停止 Gitit 服务。

## 批量更改扩展名

背景：

1. Gitit 0.11.x 起支持配置文件扩展名，但目前除 cabal 方式外，安装到的都是 0.10.x。
2. 在 0.10.x 下，即使配置 `default-extension` 为 `md`，Gitit 仍然会将新建文件的扩展名设为 `page`。

我们可能会因为某些原因需要将自己的 wiki 条目文件的扩展名进行批量更改，比如从 `md` 改为 `page`，或者从 `page` 改为 `md` ，或者从 `txt`、`markdown` 改为 `md`。

`./run/renamer.py` 脚本就是用来处理处理这个事情的。基本用法如下：

`./renamer.py --d /path/to/wikidata --f txt --t md --add--push --commit`

选项：

- `--d`: wiki 条目所在目录，必须使用绝对路径，如 `/home/menduo/gitit/wikidata`。如果不传入，脚本会将脚本所在目录当作目标目录。
- `--f`: 原始后缀名，默认为 `page`。
- `--t`: 目标后缀名，默认 `md`。
- `--add`、`--commit`、`--push`：是否在更改后缀名之后进行 git 的相关操作，默认为 `True`。指定非 `True` 值时，脚本将不会执行相关的 git 操作。
- `注意`： 如果你使用脚本进行批量处理了，但没有将新文件 `git add` 到仓库里，或者没有执行 `git commit`，那么你的 wiki 中将不会有这些条目。


## 自动备份
- 运行 `./run/gen_crontab_cmd.py`
- 得到类似 `* * * * * /auto-data.sh > /log-auto-data.log 2>&1 &` 命令。
- 运行 `crontab -e` 并将刚才得到的命令粘贴到底部，关闭文件即可。

by [menduo](https://github.com/menduo/gitit-bigger)