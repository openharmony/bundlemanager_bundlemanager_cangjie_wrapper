/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

package ohos.skill

import ohos.labels.*

@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Skill {
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let actions: Array<String>

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let entities: Array<String>

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uris: Array<SkillUri>

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let domainVerify: Bool
    
    public init() {
        super()
        this.actions = Array()
        this.entities = Array()
        this.uris = Array()
        this.domainVerify = true
    }
}

@!APILevel[
    since: "22",
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SkillUri {
    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let scheme: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let host: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let port: Int32

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let path: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathStartWith: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathRegex: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uriType: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let utd: String

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxFilesSupported: Int32

    @!APILevel[
        since: "22",
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let linkFeature: String
    
    public init() {
        super()
        this.scheme = String()
        this.host = String()
        this.port = 0
        this.path = String()
        this.pathStartWith = String()
        this.pathRegex = String()
        this.uriType = String()
        this.utd = String()
        this.maxFilesSupported = 0
        this.linkFeature = String()
    }
}
