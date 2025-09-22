# **bundlemanager_cangjie_wrapper**

## Introduction

The Cangjie API is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Bundle Management subsystem. The Bundle Management subsystem allows you to query bundle information. The currently bundle manager Cangjie api only supports standard devices.

## System Architecture

**Figure 1** System architecture of bundlemanager_cangjie_wrapper

![System architecture of bundlemanager_cangjie_wrapper](figures/bundlemanager_cangjie_wrapper_architecture_en.png)

As shown in the architecture:

- BundleManager: Obtains the bundle information. Obtains the JSON string array of the current application's configuration. Checks whether a link can be opened.
- ElementName: Definition of ElementName. Includes device ID, application Bundle name, and other information.
- Metadata: Definition of Metadata. Includes metadata name, metadata value, and metadata resources.
- Skill: Skill object. Includes the collection of actions, entities, uris, and domainVerify that Skill receives.
- Cangjie Bundlemanager FFI interface: Based on cross-language interoperability via C interfaces to implement bundlemanager Cangjie API.
- bundle_framework: It is responsible for providing basic functions of bundlemanager, and encapsulates C interfaces to provide interoperability for Cangjie.
- ability_runtime: It is responsible for providing basic functions of ability.

## Directory Structure

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── figures                   # architecture pictures
├── ohos                      # Cangjie Bundle Management code
│   ├── bundle                # Cangjie bundle code
│   │   ├── BUILD.gn
│   │   ├── bundle.cj
│   │   └── bundle_manager    # Cangjie bundle basic function implementation
│   ├── element_name          # Cangjie ElementName code
│   ├── metadata              # Cangjie Metadata code
│   └── skill                 # Cangjie Skill code
└── test                      # Cangjie test code
    └── APILevel22
        └── bundle_manager    # Cangjie bundle test code
```


## Usage Guidelines

The following features are provided:

  - The module provides APIs for obtaining this application information.
  - Obtains the json string array of the current application's configuration file.
  - Checks whether a link can be opened.


The following features are not provided yet:

  - Obtain other application information.
  - Install capabilities for application bundles.
  - Update capabilities for application bundles.
  - Uninstall capabilities for application bundles.
  - Store bundle information.


For Bundlemanager-related APIs, please refer to [ohos.bundle.bundle_manager (BundleManager Management)](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/AbilityKit/cj-apis-bundle_manager.md). For relevant guidance, please refer to [Ability Kit Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/Dev_Guide/source_en/application-models/cj-abilitykit-overview.md).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[bundlemanager_bundle_framework](https://gitcode.com/openharmony/bundlemanager_bundle_framework)

[ability_ability_runtime](https://gitcode.com/openharmony/ability_ability_runtime)

[arkcompiler_cangjie_ark_interop](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop)

[hiviewdfx_hiviewdfx_cangjie_wrapper](https://gitcode.com/openharmony-sig/hiviewdfx_hiviewdfx_cangjie_wrapper)

[global_global_cangjie_wrapper](https://gitcode.com/openharmony-sig/global_global_cangjie_wrapper)
