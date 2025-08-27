# **bundlemanager_cangjie_wrapper**

## Introduction

The Cangjie API is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Bundle Management subsystem. The Bundle Management subsystem allows you to query bundle information.

Below is the architecture of the Bundle Management subsystem.

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

## Repositories Involved

[bundlemanager_bundle_framework](https://gitee.com/openharmony/bundlemanager_bundle_framework)
