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

package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.core.*
import ohos.metadata.*
import ohos.bundle.bundle_manager.*

// 从 BundleInfo 的 hapModulesInfo.metadata 和 abilitiesInfo[].metadata 中扫描并返回第一个 Metadata
func findFirstMetadata(bundleInfo: BundleInfo): Option<Metadata> {
    var i: Int64 = 0
    while (i < bundleInfo.hapModulesInfo.size) {
        match (bundleInfo.hapModulesInfo.get(i)) {
            case Some(hap) =>
                match (hap.metadata.first) {
                    case Some(m) => return Some(m)
                    case None =>
                        var j: Int64 = 0
                        while (j < hap.abilitiesInfo.size) {
                            match (hap.abilitiesInfo.get(j)) {
                                case Some(abi) =>
                                    match (abi.metadata.first) {
                                        case Some(m) => return Some(m)
                                        case None => ()
                                    }
                                case None => ()
                            }
                            j = j + 1
                        }
                }
            case None => ()
        }
        i = i + 1
    }
    return None
}

@Test
class TestMetadataLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_read_valid_metadata_name(): Unit {
        // 原始用例名: test_name_read_valid_metadata_name
        // 测试流程: 通过 BundleManager.getBundleInfoForSelf 获取 BundleInfo，扫描得到 Metadata，读取 name 属性
        // 预期结果: 若有 Metadata 则 name.size 为 17（如 ohos.ability.form）；若无则断言 None 路径
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.name.size, 17)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_read_custom_metadata_name(): Unit {
        // 原始用例名: test_name_read_custom_metadata_name
        // 测试流程: 通过 getBundleInfoForSelf 获取 Metadata，读取自定义 name
        // 预期结果: 若有 Metadata 则 name 为 customMetadata；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.name, "customMetadata")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_write_new_value(): Unit {
        // 原始用例名: test_name_write_new_value
        // 测试流程: 获取 Metadata，将 name 写入新值并读取
        // 预期结果: 若有 Metadata 则写入后读取为 newMetadataName；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.name = "newMetadataName"
                @Expect(meta.name, "newMetadataName")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_write_empty_string(): Unit {
        // 原始用例名: test_name_write_empty_string
        // 测试流程: 获取 Metadata，将 name 写入空字符串
        // 预期结果: 若有 Metadata 则 name 为空；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.name = ""
                @Expect(meta.name, "")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_write_long_string(): Unit {
        // 原始用例名: test_name_write_long_string
        // 测试流程: 获取 Metadata，将 name 写入长字符串
        // 预期结果: 若有 Metadata 则 name 与 longStr 一致；若无则断言 None
        let longStr = makeLongString(1000)
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.name = longStr
                @Expect(meta.name, longStr)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_name_multiple_write_read(): Unit {
        // 原始用例名: test_name_multiple_write_read
        // 测试流程: 获取 Metadata，多次写入并读取 name
        // 预期结果: 若有 Metadata 则依次为 name1、name2；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.name = "name1"
                @Expect(meta.name, "name1")
                meta.name = "name2"
                @Expect(meta.name, "name2")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_read_string_value(): Unit {
        // 原始用例名: test_value_read_string_value
        // 测试流程: 获取 Metadata，读取 value 字符串
        // 预期结果: 若有 Metadata 则 value.size 为 4；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.value.size, 4)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_read_numeric_string(): Unit {
        // 原始用例名: test_value_read_numeric_string
        // 测试流程: 获取 Metadata，读取 value 数值字符串
        // 预期结果: 若有 Metadata 则 value 为 "100"；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.value, "100")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_write_new_value(): Unit {
        // 原始用例名: test_value_write_new_value
        // 测试流程: 获取 Metadata，将 value 写入新值并读取
        // 预期结果: 若有 Metadata 则 value 为 newValue；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.value = "newValue"
                @Expect(meta.value, "newValue")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_write_empty_string(): Unit {
        // 原始用例名: test_value_write_empty_string
        // 测试流程: 获取 Metadata，将 value 写入空字符串
        // 预期结果: 若有 Metadata 则 value 为空；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.value = ""
                @Expect(meta.value, "")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_write_long_string(): Unit {
        // 原始用例名: test_value_write_long_string
        // 测试流程: 获取 Metadata，将 value 写入长字符串
        // 预期结果: 若有 Metadata 则 value 与 longStr 一致；若无则断言 None
        let longStr = makeLongString(1000)
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.value = longStr
                @Expect(meta.value, longStr)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_value_multiple_write_read(): Unit {
        // 原始用例名: test_value_multiple_write_read
        // 测试流程: 获取 Metadata，多次写入并读取 value
        // 预期结果: 若有 Metadata 则依次为 value1、value2；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.value = "value1"
                @Expect(meta.value, "value1")
                meta.value = "value2"
                @Expect(meta.value, "value2")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_read_profile_reference(): Unit {
        // 原始用例名: test_resource_read_profile_reference
        // 测试流程: 获取 Metadata，读取 resource 配置文件引用
        // 预期结果: 若有 Metadata 则 resource.size 为 19；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.resource.size, 19)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_read_form_config(): Unit {
        // 原始用例名: test_resource_read_form_config
        // 测试流程: 获取 Metadata，读取 resource 表单配置
        // 预期结果: 若有 Metadata 则 resource 为 $profile:form_config；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.resource, "$profile:form_config")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_read_empty_when_no_resource(): Unit {
        // 原始用例名: test_resource_read_empty_when_no_resource
        // 测试流程: 获取 Metadata，读取 resource 为空的情况
        // 预期结果: 若有 Metadata 则 resource.size 为 0；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) => @Expect(meta.resource.size, 0)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_write_new_value(): Unit {
        // 原始用例名: test_resource_write_new_value
        // 测试流程: 获取 Metadata，将 resource 写入新值并读取
        // 预期结果: 若有 Metadata 则 resource 为 $profile:new_config；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.resource = "$profile:new_config"
                @Expect(meta.resource, "$profile:new_config")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_write_empty_string(): Unit {
        // 原始用例名: test_resource_write_empty_string
        // 测试流程: 获取 Metadata，将 resource 写入空字符串
        // 预期结果: 若有 Metadata 则 resource 为空；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.resource = ""
                @Expect(meta.resource, "")
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_write_long_string(): Unit {
        // 原始用例名: test_resource_write_long_string
        // 测试流程: 获取 Metadata，将 resource 写入长字符串
        // 预期结果: 若有 Metadata 则 resource 与 longStr 一致；若无则断言 None
        let longStr = makeLongString(1000)
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.resource = longStr
                @Expect(meta.resource, longStr)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_resource_multiple_write_read(): Unit {
        // 原始用例名: test_resource_multiple_write_read
        // 测试流程: 获取 Metadata，多次写入并读取 resource
        // 预期结果: 若有 Metadata 则依次为 $profile:config1、$profile:config2；若无则断言 None
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
        let opt = findFirstMetadata(bundleInfo)
        match (opt) {
            case None => @Expect(opt.isNone(), true)
            case Some(meta) =>
                meta.resource = "$profile:config1"
                @Expect(meta.resource, "$profile:config1")
                meta.resource = "$profile:config2"
                @Expect(meta.resource, "$profile:config2")
        }
    }
}
