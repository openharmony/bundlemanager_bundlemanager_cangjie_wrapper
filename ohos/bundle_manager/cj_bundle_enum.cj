/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.bundle_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_DEFAULT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_APPLICATION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_HAP_MODULE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_ABILITY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_METADATA
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_DISABLE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_SIGNATURE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_MENU
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_ROUTER_MAP
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_BUNDLE_INFO_WITH_SKILL
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case GET_BUNDLE_INFO_DEFAULT => 0x00000000
            case GET_BUNDLE_INFO_WITH_APPLICATION => 0x00000001
            case GET_BUNDLE_INFO_WITH_HAP_MODULE => 0x00000002
            case GET_BUNDLE_INFO_WITH_ABILITY => 0x00000004
            case GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY => 0x00000008
            case GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION => 0x00000010
            case GET_BUNDLE_INFO_WITH_METADATA => 0x00000020
            case GET_BUNDLE_INFO_WITH_DISABLE => 0x00000040
            case GET_BUNDLE_INFO_WITH_SIGNATURE => 0x00000080
            case GET_BUNDLE_INFO_WITH_MENU => 0x00000100
            case GET_BUNDLE_INFO_WITH_ROUTER_MAP => 0x00000200
            case GET_BUNDLE_INFO_WITH_SKILL => 0x00000800
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ApplicationFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_APPLICATION_INFO_DEFAULT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_APPLICATION_INFO_WITH_PERMISSION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_APPLICATION_INFO_WITH_METADATA
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_APPLICATION_INFO_WITH_DISABLE
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum AbilityFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_DEFAULT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_WITH_PERMISSION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_WITH_APPLICATION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_WITH_METADATA
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_WITH_DISABLE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_ABILITY_INFO_ONLY_SYSTEM_APP
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_EXTENSION_ABILITY_INFO_DEFAULT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_EXTENSION_ABILITY_INFO_WITH_PERMISSION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_EXTENSION_ABILITY_INFO_WITH_APPLICATION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GET_EXTENSION_ABILITY_INFO_WITH_METADATA
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum CompatiblePolicy {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    BACKWARD_COMPATIBILITY | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ProfileType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    INTENT_PROFILE | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    APP
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ATOMIC_SERVICE
    | ...

    protected static func parse(val: Int32): BundleType {
        match (val) {
            case 0 => APP
            case 1 => ATOMIC_SERVICE
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum PermissionGrantState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PERMISSION_DENIED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PERMISSION_GRANTED
    | ...

    static func parse(val: Int32): PermissionGrantState {
        match (val) {
            case -1 => PERMISSION_DENIED
            case 0 => PERMISSION_GRANTED
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: false,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum AbilityType {
    @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PAGE
    | @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SERVICE
    | @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DATA
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum DisplayOrientation {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    UNSPECIFIED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LANDSCAPE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PORTRAIT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FOLLOW_RECENT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LANDSCAPE_INVERTED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PORTRAIT_INVERTED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_LANDSCAPE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_PORTRAIT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_RESTRICTED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_LANDSCAPE_RESTRICTED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_PORTRAIT_RESTRICTED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LOCKED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AUTO_ROTATION_UNSPECIFIED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FOLLOW_DESKTOP
    | ...

    static func parse(val: Int32): DisplayOrientation {
        match (val) {
            case 0 => UNSPECIFIED
            case 1 => LANDSCAPE
            case 2 => PORTRAIT
            case 3 => FOLLOW_RECENT
            case 4 => LANDSCAPE_INVERTED
            case 5 => PORTRAIT_INVERTED
            case 6 => AUTO_ROTATION
            case 7 => AUTO_ROTATION_LANDSCAPE
            case 8 => AUTO_ROTATION_PORTRAIT
            case 9 => AUTO_ROTATION_RESTRICTED
            case 10 => AUTO_ROTATION_LANDSCAPE_RESTRICTED
            case 11 => AUTO_ROTATION_PORTRAIT_RESTRICTED
            case 12 => LOCKED
            case 13 => AUTO_ROTATION_UNSPECIFIED
            case 14 => FOLLOW_DESKTOP
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum SupportWindowMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FULL_SCREEN
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SPLIT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FLOATING
    | ...

    static func parse(val: Int32): SupportWindowMode {
        match (val) {
            case 0 => FULL_SCREEN
            case 1 => SPLIT
            case 2 => FLOATING
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum LaunchType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SINGLETON
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    MULTITON
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SPECIFIED
    | ...

    static func parse(val: Int32): LaunchType {
        match (val) {
            case 0 => SINGLETON
            case 1 => MULTITON
            case 2 => SPECIFIED
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FORM
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WORK_SCHEDULER
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    INPUT_METHOD
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SERVICE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ACCESSIBILITY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DATA_SHARE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FILE_SHARE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    STATIC_SUBSCRIBER
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WALLPAPER
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    BACKUP
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WINDOW
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ENTERPRISE_ADMIN
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    THUMBNAIL
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PREVIEW
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PRINT
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SHARE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PUSH
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DRIVER
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ACTION
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ADS_SERVICE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EMBEDDED_UI
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    INSIGHT_INTENT_UI
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    UNSPECIFIED
    | ...

    static func parse(val: Int32): ExtensionAbilityType {
        match (val) {
            case 0 => FORM
            case 1 => WORK_SCHEDULER
            case 2 => INPUT_METHOD
            case 3 => SERVICE
            case 4 => ACCESSIBILITY
            case 5 => DATA_SHARE
            case 6 => FILE_SHARE
            case 7 => STATIC_SUBSCRIBER
            case 8 => WALLPAPER
            case 9 => BACKUP
            case 10 => WINDOW
            case 11 => ENTERPRISE_ADMIN
            case 13 => THUMBNAIL
            case 14 => PREVIEW
            case 15 => PRINT
            case 16 => SHARE
            case 17 => PUSH
            case 18 => DRIVER
            case 19 => ACTION
            case 20 => ADS_SERVICE
            case 21 => EMBEDDED_UI
            case 22 => INSIGHT_INTENT_UI
            case 255 => UNSPECIFIED
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ModuleType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    ENTRY
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FEATURE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    SHARED
    | ...

    static func parse(val: Int32): ModuleType {
        match (val) {
            case 1 => ENTRY
            case 2 => FEATURE
            case 3 => SHARED
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum MultiAppModeType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    UNSPECIFIED
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    MULTI_INSTANCE
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    APP_CLONE
    | ...

    static func parse(val: UInt8): MultiAppModeType {
        match (val) {
            case 0 => UNSPECIFIED
            case 1 => MULTI_INSTANCE
            case 2 => APP_CLONE
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}
