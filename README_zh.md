# 包管理仓颉接口

## 简介

包管理仓颉接口是在OpenHarmony上基于包管理子系统能力之上封装的仓颉API。包管理子系统负责应用安装包的管理，提供安装包的信息查询能力。当前开放的包管理仓颉接口仅支持standard设备。

## 系统架构

**图 1** 包管理仓颉架构图

![包管理仓颉架构图](figures/bundlemanager_cangjie_wrapper_architecture.png)

如架构图所示：

- 应用信息查询能力：提供当前应用包信息的查询能力。提供UIAbility组件信息、ExtensionAbility组件信息的查询能力，返回json格式字符串。提供查询给定的链接是否可以打开的能力。
- ElementName信息: ElementName信息的定义。包含设备ID，应用Bundle名称等信息。
- 元数据对象: 元数据对象的定义。包含元数据名称、元数据值和元数据资源。
- Skill标签对象：Skill标签对象。包含Skill接收的actions、entities、uris、domainVerify集合。
- 仓颉包管理FFI接口定义：负责定义C语言互操作仓颉接口，用于实现仓颉包管理能力。
- 包管理基础框架模块：负责提供包管理基础功能，封装C语言接口提供给仓颉进行互操作。
- 元能力基础框架模块：封装ElementName的C语言定义提供给仓颉进行互操作。

## 目录

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── figures                 # 存放README中的架构图
├── ohos                    # 仓颉包管理接口实现
│   ├── bundle              # 仓颉包管理基础功能实现
│   │   └── bundle_manager  # 仓颉应用信息查询能力实现
│   ├── element_name        # 包管理依赖元素ElementName类的实现
│   ├── metadata            # 包管理依赖元素Metadata类的实现
│   └── skill               # 包管理依赖元素Skill类的实现
└── test                    # 仓颉测试代码
    └── APILevel22
        └── bundle_manager  # 仓颉包管理测试用例
```

## 使用说明

包管理仓颉接口提供以下功能，开发者可以根据使用诉求使用：

  - 提供当前应用包信息的查询能力。
  - 提供自身相应配置文件的json格式字符串的获取能力。
  - 提供给定的链接是否可以打开的查询能力。


与ArkTS提供的API能力相比，暂不支持以下功能：

  - 暂不支持获取其他应用包的信息。
  - 暂不支持安装包的安装能力。
  - 暂不支持安装包的更新能力。
  - 暂不支持安装包的卸载能力。
  - 暂不支持包信息存储能力。


包管理相关API请参见[仓颉包管理API文档](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_zh_cn/apis/AbilityKit/cj-apis-bundle_manager.md)。

## 参与贡献

欢迎广大开发者代码，文档等，具体的贡献流程和方式请参见[参与贡献](https://gitcode.com/openharmony/docs/blob/master/zh-cn/contribute/%E5%8F%82%E4%B8%8E%E8%B4%A1%E7%8C%AE.md)。

## 相关仓

[bundlemanager_bundle_framework](https://gitcode.com/openharmony/bundlemanager_bundle_framework)

[ability_ability_runtime](https://gitcode.com/openharmony/ability_ability_runtime)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)
