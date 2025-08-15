# 包管理仓颉接口

## 简介

包管理仓颉接口是在 OpenHarmony 上基于包管理子系统能力之上封装的仓颉API。包管理子系统负责应用安装包的管理，提供安装包的信息查询、安装、更新、卸载和包信息存储等能力。其具体功能，可见[包管理子系统](https://gitee.com/openharmony/docs/blob/master/zh-cn/readme/%E5%8C%85%E7%AE%A1%E7%90%86%E5%AD%90%E7%B3%BB%E7%BB%9F.md)

包管理子系统架构如下图所示：

![](figures/bundlemanager_cangjie_wrapper_architecture.png)


## 部件内子模块职责

| 子模块名称       | 职责                                                         |
| ---------------- | ------------------------------------------------------------ |
| 包管理接口模块   | 1.对外提供的安装更新卸载及通知接口；<br>2.对外提供的包/组件信息/权限信息查询接口；<br>3.对外提供的应用权限查询接口；<br>4.对外提供的清除数据的接口； |

## 目录

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── ohos                        # 仓颉包管理接口实现
├── figures                     # 存放readme中的架构图
```


### bm工具命令
bm是用来方便开发者调试的一个工具。bm工具被hdc工具封装，进入hdc shell命令后，就可以使用bm工具。
| 命令    | 描述       |
| ------- | ---------- |
|  help | 帮助命令，显示bm支持的命令信息 |
| install | 安装命令，用来安装应用|
| uninstall | 卸载命令，用来卸载应用|
| dump | 查询命令，用来查询应用的相关信息|
| clean | 清理命令，用来清理应用的缓存和数据 |
| enable | 使能命令，用来使能应用 |
| disable | 禁用命令，用来禁用应用 |
| get | 获取udid命令，用来获取设备的udid |
#### 帮助命令
| 命令    | 描述       |
| ------- | ---------- |
| bm help | 显示bm工具的能够支持的命令信息 |

* 示例
```Bash
# 显示帮助信息
bm help
```
#### 安装命令
命令可以组合，下面列出部分命令。
| 命令                                | 描述                       |
| ----------------------------------- | -------------------------- |
| bm install -h | 显示install支持的命令信息 |
| bm install -p <hap-file-path>    | 安装hap包，支持指定路径和多个hap同时安装 |
| bm install -p <hap-file-path> -u <user-id>   |给指定用户安装一个hap包 |
| bm install -r -p <hap-file-path> | 覆盖安装一个hap包 |
| bm install -r -p <hap-file-path> -u <user-id> | 给指定用户覆盖安装一个hap包 |

* 示例
```Bash
# 安装一个hap
bm install -p /data/app/ohosapp.hap
# 覆盖安装一个hap
bm install -p /data/app/ohosapp.hap -r
```
#### 卸载命令
命令可以组合，下面列出部分命令。-u未指定情况下，默认为所有用户。
| 命令                          | 描述                     |
| ----------------------------- | ------------------------ |
| bm uninstall -h | 显示uninstall支持的命令信息 |
| bm uninstall -n <bundle-name> | 通过指定包名卸载应用 |
| bm uninstall -n <bundle-name> -k | 通过指定包名卸载应用时保留数据目录 |
| bm uninstall -n <bundle-name> -u <user-id>| 通过指定包名和用户卸载应用 |
| bm uninstall -n <bundle-name> -m <moudle-name> | 通过指定包名卸载应用的一个模块 |

* 示例
```Bash
# 卸载一个hap
bm uninstall -n com.ohos.app
# 卸载一个hap，保留数据目录
bm uninstall -n com.ohos.app -k
# 卸载一个hap下面的ability
bm uninstall -n com.ohos.app -m com.ohos.app.MainAbility
```
#### 查询命令
命令可以组合，下面列出部分命令。-u未指定情况下，默认为所有用户。
| 命令       | 描述                       |
| ---------- | -------------------------- |
| bm dump -h | 显示dump支持的命令信息 |
| bm dump -a | 查询系统已经安装的所有应用 |
| bm dump -g | 查询系统中签名为调试类型的应用包名 |
| bm dump -n <bundle-name> | 查询指定包名的详细信息 |
| bm dump -n <bundle-name> -s | 查询指定包名下的快捷方式信息 |
| bm dump -n <bundle-name> -d <device-id> | 跨设备查询包信息 |
| bm dump -n <bundle-name> -u <user-id> | 查询指定用户下指定包名的详细信息 |

* 示例
```Bash
# 显示所有已安装的包名
bm dump -a
# 查询系统中签名为调试类型的应用包名
bm dump -g
# 显示该应用的详细信息
bm dump -n com.ohos.app
```
#### 清理命令
-u未指定情况下，默认为当前活跃用户。
| 命令       | 描述                       |
| ---------- | -------------------------- |
| bm clean -h | 显示clean支持的命令信息 |
| bm clean -n <bundle-name> -c | 清除指定包名的缓存数据 |
| bm clean -n <bundle-name> -d | 清除指定包名的数据目录 |
| bm clean -n <bundle-name> -c -u <user-id> | 清除指定用户下包名的缓存数据 |
| bm clean -n <bundle-name> -d -u <user-id> | 清除指定用户下包名的数据目录 |

* 示例
```Bash
# 清理该应用下的缓存数据
bm clean -n com.ohos.app -c
# 清理该应用下的用户数据
bm clean -n com.ohos.app -d
```
#### 使能命令
-u未指定情况下，默认为当前活跃用户。
| 命令       | 描述                       |
| ---------- | -------------------------- |
| bm enable -h | 显示enable支持的命令信息 |
| bm enable -n <bundle-name> | 使能指定包名的应用 |
| bm enable -n <bundle-name> -a <ability-name> | 使能指定包名下的元能力模块 |
| bm enable -n <bundle-name> -u <user-id>| 使能指定用户和包名的应用 |

* 示例
```Bash
# 使能该应用
bm enable -n com.ohos.app
```
#### 禁用命令
-u未指定情况下，默认为当前活跃用户。
| 命令       | 描述                       |
| ---------- | -------------------------- |
| bm disable -h | 显示disable支持的命令信息 |
| bm disable -n <bundle-name> | 禁用指定包名的应用 |
| bm disable -n <bundle-name> -a <ability-name> | 禁用指定包名下的元能力模块 |
| bm disable -n <bundle-name> -u <user-id>| 禁用指定用户和包名下的应用 |

* 示例
```Bash
# 禁用该应用
bm disable -n com.ohos.app
```
#### 获取udid命令
| 命令       | 描述                       |
| ---------- | -------------------------- |
| bm get -h | 显示get支持的命令信息 |
| bm get -u | 获取设备的udid |

* 示例
```Bash
# 获取设备的udid
bm get -u
```

## 相关仓

[bundlemanager_bundle_framework](https://gitee.com/openharmony/bundlemanager_bundle_framework/blob/master/README_zh.md)
