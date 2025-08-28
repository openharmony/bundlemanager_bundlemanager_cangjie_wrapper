# 包管理仓颉接口

## 简介

包管理仓颉接口是在 OpenHarmony 上基于包管理子系统能力之上封装的仓颉API。包管理子系统负责应用安装包的管理，提供安装包的信息查询能力。

## 系统架构

**图 1** 包管理仓颉架构图

![](figures/bundlemanager_cangjie_wrapper_architecture.png)

## 目录

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── ohos                        # 仓颉包管理接口实现
├── figures                     # 存放readme中的架构图
```

## 约束

当前开放的包管理仓颉接口仅支持standard设备。

## 使用说明

如架构图所示，包管理仓颉接口以下功能接口，开发者可以根据使用诉求使用：

  - 包管理模块提供当前应用信息的查询能力，支持应用包信息、应用程序信息、UIAbility组件信息、ExtensionAbility组件信息等信息的查询。
  - 查询给定的链接是否可以打开。

与ArkTS相比，暂不支持以下功能：

  - 暂不支持获取其他应用包的信息。
  - 暂不支持安装包的安装能力。
  - 暂不支持安装包的更新能力。
  - 暂不支持安装包的卸载能力。
  - 暂不支持包信息存储能力。

包管理相关API请参见[ohos.bundle.bundle_manager（bundleManager管理）](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-bundle_manager.md)，相关指导请参见[程序框架服务开发指南](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_zh_cn/application-models)。

## 参与贡献

欢迎广大开发者代码，文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[bundlemanager_bundle_framework](https://gitee.com/openharmony/bundlemanager_bundle_framework)
