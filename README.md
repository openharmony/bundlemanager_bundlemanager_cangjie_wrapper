# **bundlemanager_cangjie_wrapper**

## Introduction

The Cangjie API is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Bundle Management subsystem. The Bundle Management subsystem allows you to query bundle information.

Below is the architecture of the Bundle Management subsystem.

## System Architecture

**Figure 1** System architecture of bundlemanager_cangjie_wrapper

![](figures/bundlemanager_cangjie_wrapper_architecture_en.png)

## Directory Structure

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── ohos                        # Cangjie Bundle Management code
├── figures                     # architecture pictures
```

## Constraints

The currently open bundle manager Cangjie api only supports standard devices.

## Usage Guidelines

The following features are provided:

  - The module provides APIs for obtaining this application information, including bundle information, application information, ability information and ExtensionAbility information.
  - Checks whether a link can be opened.

The following features are not provided yet:

  - Obtain other application information.
  - Install capabilities for application bundles.
  - Update capabilities for application bundles.
  - Uninstall capabilities for application bundles.
  - Store bundle information.

For Bundlemanager-related APIs, please refer to [ohos.bundle.bundle_manager (BundleManager Management)](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/blob/master/doc/API_Reference/source_en/apis/AbilityKit/cj-apis-bundle_manager.md). For relevant guidance, please refer to [Ability Kit Guide](https://gitcode.com/openharmony-sig/arkcompiler_cangjie_ark_interop/tree/master/doc/Dev_Guide/source_en/application-models).

## Code Contribution

Developers are welcome to contribute code, documentation, etc. For specific contribution processes and methods, please refer to [Code Contribution](https://gitcode.com/openharmony/docs/blob/master/en/contribute/code-contribution.md).

## Repositories Involved

[bundlemanager_bundle_framework](https://gitee.com/openharmony/bundlemanager_bundle_framework)
