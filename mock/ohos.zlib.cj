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

package ohos.zlib

import ohos.labels.*

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressLevel {
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelNoCompression
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelBestSpeed
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelBestCompression
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressLevelDefaultCompression
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum MemLevel {
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelMin
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelDefault
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    MemLevelMax
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public enum CompressStrategy {
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyDefaultStrategy
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyFiltered
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyHuffmanOnly
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyRle
    | @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    CompressStrategyFixed
    | ...
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib",
    throwexception: true,
    workerthread: true
]
public func compressFile(inFile: String, outFile: String, options: Options): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib",
    throwexception: true,
    workerthread: true
]
public func decompressFile(inFile: String, outFile: String, options!: Options = Options()): Unit {
    return ()
}

@!APILevel[
    since: "24",
    syscap: "SystemCapability.BundleManager.Zlib"
]
public class Options {
    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var level: CompressLevel

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var memLevel: MemLevel

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public var strategy: CompressStrategy

    @!APILevel[
        since: "24",
        syscap: "SystemCapability.BundleManager.Zlib"
    ]
    public init(level!: CompressLevel = CompressLevelDefaultCompression, memLevel!: MemLevel = MemLevelDefault,
        strategy!: CompressStrategy = CompressStrategyDefaultStrategy) {
        super()
        this.level = CompressLevelDefaultCompression
        this.memLevel = MemLevelDefault
        this.strategy = CompressStrategyDefaultStrategy
    }
}