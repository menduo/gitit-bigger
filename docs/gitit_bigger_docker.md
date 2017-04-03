## Gitit Bigger Docker 版介绍

要点如下：
- 使用 debian 系统；
- 使用 supervisord 进程管理；
- 支持挂载已存在的 gitit 项目文件夹（建议采用这种方案来启动容器）；

关于批量修改文件名后缀、自动备份数据（push 到远程仓库）请参见上文。

如果不挂载已有 gitit 项目，可能带来的问题：

- `git` 相关配置如 user、email 需要自己进入到容器中单独配置。
- `git` 推送相关，也需要单独处理（ssh keys、 git remote 等）。

如果挂载，则又有问题：
- `wikidata` 目录的 git 权限问题：
- 该目录在宿主环境里的所有者可能是 `abc`，但在 docker 里，它变成了 `root`，这会导致权限的错乱。
- 结果是：当不在 docker 里时，可能需要 root 权限才可以在宿主环境下处理 wikidata 目录下的文件；
- 这个列为 todo，回头再处理~~

虽然我们可以尝试把宿主环境的相关配置复制到容器中，或者手动进入容器更改，但仍然麻烦，不如挂载宿主环境上的 gitit 项目更省事。

### 不挂载已有 gitit

```bash
docker run -d --name gitit -p 7500:7500 menduo/gitit-bigger
```

### 挂载已有 gitit
假设你的 gitit 项目在 `~/workspace/gitit` 下，将此目录挂载到 docker 容器里：

```bash
docker run -d --name gitit -p 7500:7500 -v ~/workspace/gitit:/data/gitit menduo/gitit-bigger
```

### 重启 docker 容器中的 gitit 服务
如果 gitit 配置文件、模板、静态文件有修改，必须重启 gitit。假设你的容器名称是 `gitit`，使用容器内的 `supervisord` 来重启 gitit 服务：

```bash
docker exec -d gitit supervisorctl restart gitit
```

或者

```bash
docker ps -a | grep 'gitit' | awk '{print $1}' |xargs -i docker exec -itd {} supervisorctl restart gitit
```

### 进入到容器的 shell 中
假设你的容器名称是 `gitit`：

```bash
docker exec -it gitit bash
```

### 挂载卷
本镜像支持挂载一个已存在的 gitit 文件夹到容器中。我建议使用已存在的 gitit 项目。

容器中的 Gitit 工作目录是: `/data/gitit`。容器在启用时将会检测如下文件，如果他们不存在，将会复制一份默认版。
- `/data/gitit/my-gitit.conf`
- `/data/gitit/supervisord.conf`

Gitit 服务启用时将自动创建如下目录（如果它们不存在） :
- `/data/gitit/static/` ：必须的静态文件；
- `/data/gitit/templates/` 模板；
- `/data/gitit/wikidata/` Wiki 页面所在目录，一个 git repo；




by [menduo](https://github.com/menduo/gitit-bigger)