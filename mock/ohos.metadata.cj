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

package ohos.metadata

import ohos.labels.*

@!APILevel[since: "22", syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
public class Metadata {
    @!APILevel[since: "22", syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    public var name: String

    @!APILevel[since: "22", syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    public var value: String

    @!APILevel[since: "22", syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    public var resource: String
    
    public init() {
        super()
        this.name = String()
        this.value = String()
        this.resource = String()
    }
}