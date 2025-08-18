# **Bundle Management**

## Introduction

The Cangjie API is a Cangjie API encapsulated on OpenHarmony based on the capabilities of the Bundle Management subsystem. The Bundle Management subsystem allows you to query, install, update, and uninstall capabilities for application bundles as well as store bundle information. Specific functions can be seen[Bundle Management](https://gitee.com/openharmony/docs/blob/master/en/readme/bundle-management.md)

Below is the architecture of the Bundle Management subsystem.

![](figures/bundlemanager_cangjie_wrapper_architecture_en.png)


## Responsibilities of Modules

| Module      | Description                                                        |
| ---------------- | ------------------------------------------------------------ |
| Bundle management interface module  | 1. Provides external interfaces for installation, update, uninstallation, and notification.<br>2. Provides external interfaces for querying bundle, component, and permission information.<br>3. Provides external interfaces for querying application permissions.<br>4. Provides external interfaces for clearing data.|

## Directory Structure

```
foundation/bundlemanager/bundlemanager_cangjie_wrapper
├── ohos                        # Cangjie Bundle Management code
├── figures                     # architecture pictures
```


### bm Commands
bm is a tool used to facilitate debugging. It is encapsulated in the HDC tool. You can use it by running bm commands in the HDC shell.
| Command   | Description      |
| ------- | ---------- |
|  help | Displays the commands supported by the bm tool.|
| install | Installs an application.|
| uninstall | Uninstalls an application.|
| dump | Queries application information.|
| clean | Clears the cache and data of an application.|
| enable | Enables an application.|
| disable | Disables an application.|
| get | Obtains the UDID of a device.|
#### Help Command
| Command   | Description      |
| ------- | ---------- |
| bm help | Displays the commands supported by the bm tool.|

* Example
```Bash
# Display help information.
bm help
```
#### Installation Command
This command can be run with different options to achieve different purposes. The table below lists some examples.
| Command                               | Description                      |
| ----------------------------------- | -------------------------- |
| bm install -h | Displays the commands supported by **install**.|
| bm install -p <hap-file-path>    | Installs HAPs. You can specify a path to install one or more HAPs at the same time.|
| bm install -p <hap-file-path> -u <user-id>   |Installs a HAP for a specified user.|
| bm install -r -p <hap-file-path> | Installs a HAP in overwrite mode.|
| bm install -r -p <hap-file-path> -u <user-id> | Installs a HAP for a specified user in overwrite mode.|

* Example
```Bash
# Install a HAP.
bm install -p /data/app/ohosapp.hap
# Install a HAP in overwrite mode.
bm install -p /data/app/ohosapp.hap -r
```
#### Uninstallation Command
This command can be run with different options to achieve different purposes. The table below lists some examples. If **-u** is not specified, the command applies to all users.
| Command                         | Description                    |
| ----------------------------- | ------------------------ |
| bm uninstall -h | Displays the commands supported by **uninstall**.|
| bm uninstall -n <bundle-name> | Uninstalls an application based on the specified bundle name.|
| bm uninstall -n <bundle-name> -k | Uninstalls an application based on the specified bundle name, while retaining the data directory of the application.|
| bm uninstall -n <bundle-name> -u <user-id>| Uninstalls an application based on the specified bundle name and user.|
| bm uninstall -n <bundle-name> -m <moudle-name> | Uninstalls a specific module of an application based on the specified bundle name.|

* Example
```Bash
# Uninstall a HAP.
bm uninstall -n com.ohos.app
# Uninstall a HAP while retaining its data directory.
bm uninstall -n com.ohos.app -k
# Uninstall an ability of the HAP.
bm uninstall -n com.ohos.app -m com.ohos.app.MainAbility
```
#### Query Command
This command can be run with different options to achieve different purposes. The table below lists some examples. If **-u** is not specified, the command applies to all users.
| Command      | Description                      |
| ---------- | -------------------------- |
| bm dump -h | Displays the commands supported by **dump**.|
| bm dump -a | Queries all applications installed in the system.|
| bm dump -n <bundle-name> | Queries details about a specified bundle.|
| bm dump -n <bundle-name> -s | Queries the shortcut information of a specified bundle.|
| bm dump -n <bundle-name> -d <device-id> | Queries information about a bundle on a remote device.|
| bm dump -n <bundle-name> -u <user-id> | Queries details about a specified bundle of a specified user.|

* Example
```Bash
# Display the names of all applications installed in the system.
bm dump -a
# Display details about a specific application.
bm dump -n com.ohos.app
```
#### Clean Command
-If **-u** is not specified, the command applies to all active users.
| Command      | Description                      |
| ---------- | -------------------------- |
| bm clean -h | Displays the commands supported by **clean**.|
| bm clean -n <bundle-name> -c | Clears the cache data of the specified bundle.|
| bm clean -n <bundle-name> -d | Clears the data directory of the specified bundle.|
| bm clean -n <bundle-name> -c -u <user-id> | Clears the cached data of the specified bundle for the specified user.|
| bm clean -n <bundle-name> -d -u <user-id> | Clears the data directory of the specified bundle for the specified user.|

* Example
```Bash
# Clear the cache data of the specified bundle.
bm clean -n com.ohos.app -c
# Clear the user data of the specified bundle.
bm clean -n com.ohos.app -d
```
#### Enable Command
-If **-u** is not specified, the command applies to all active users.
| Command      | Description                      |
| ---------- | -------------------------- |
| bm enable -h | Displays the commands supported by **enable**.|
| bm enable -n <bundle-name> | Enables the application that matches the specified bundle name.|
| bm enable -n <bundle-name> -a <ability-name> | Enables a specific ability module of the application that matches the specified bundle name.|
| bm enable -n <bundle-name> -u <user-id>| Enables the application that matches the specified bundle name for the specified user.|

* Example
```Bash
# Enable the specified application.
bm enable -n com.ohos.app
```
#### Disable Command
-If **-u** is not specified, the command applies to all active users.
| Command      | Description                      |
| ---------- | -------------------------- |
| bm disable -h | Displays the commands supported by **disable**.|
| bm disable -n <bundle-name> | Disables the application that matches the specified bundle name.|
| bm disable -n <bundle-name> -a <ability-name> | Disables a specific ability module of the application that matches the specified bundle name.|
| bm disable -n <bundle-name> -u <user-id>| Disables the application that matches the specified bundle name for the specified user.|

* Example
```Bash
# Disable the specified application.
bm disable -n com.ohos.app
```
#### Command for Obtaining the UDID
| Command      | Description                      |
| ---------- | -------------------------- |
| bm get -h | Displays the commands supported by **get**.|
| bm get -u | Obtains the UDID of a device.|

* Example
```Bash
# Obtain the UDID of a device.
bm get -u
```

## Repositories Involved

[bundlemanager_bundle_framework](https://gitee.com/openharmony/bundlemanager_bundle_framework)
