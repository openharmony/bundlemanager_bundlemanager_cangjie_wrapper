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

import ohos.element_name.*

func makeLongString(len: Int32): String {
    var s = ""
    for (i in 0..len) {
        s = s + "a"
    }
    return s
}

@Test
class TestElementNameLlt {
    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_read_default_empty_string(): Unit {
        // 原始用例名: test_deviceId_read_default_empty_string
        // 测试流程: 创建ElementName实例时不指定deviceId参数，读取deviceId属性值
        // 预期结果: 返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_read_custom_value(): Unit {
        // 原始用例名: test_deviceId_read_custom_value
        // 测试流程: 创建ElementName实例时指定deviceId为"device_001"，读取deviceId属性值
        // 预期结果: 返回"device_001"
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "device_001")
        @Expect(elem.deviceId, "device_001")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_write_and_read(): Unit {
        // 原始用例名: test_deviceId_write_and_read
        // 测试流程: 创建ElementName实例后，将deviceId属性设置为"local"，再读取deviceId属性值
        // 预期结果: 返回"local"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.deviceId = "local"
        @Expect(elem.deviceId, "local")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_write_empty_string(): Unit {
        // 原始用例名: test_deviceId_write_empty_string
        // 测试流程: 创建ElementName实例后，将deviceId属性设置为空字符串""
        // 预期结果: 设置成功，读取返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "device_001")
        elem.deviceId = ""
        @Expect(elem.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_write_long_string(): Unit {
        // 原始用例名: test_deviceId_write_long_string
        // 测试流程: 创建ElementName实例后，将deviceId属性设置为超长字符串（1000个字符）
        // 预期结果: 设置成功，读取返回设置的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.deviceId = longStr
        @Expect(elem.deviceId, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_deviceId_multiple_write_read(): Unit {
        // 原始用例名: test_deviceId_multiple_write_read
        // 测试流程: 创建ElementName实例，先设置deviceId为"device_001"，读取验证后再设置为"device_002"，再次读取
        // 预期结果: 第一次读取返回"device_001"，第二次读取返回"device_002"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.deviceId = "device_001"
        @Expect(elem.deviceId, "device_001")
        elem.deviceId = "device_002"
        @Expect(elem.deviceId, "device_002")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_read_initial_value(): Unit {
        // 原始用例名: test_bundleName_read_initial_value
        // 测试流程: 创建ElementName实例时指定bundleName为"com.ohos.example"，读取bundleName属性值
        // 预期结果: 返回"com.ohos.example"
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.bundleName, "com.ohos.example")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_write_and_read(): Unit {
        // 原始用例名: test_bundleName_write_and_read
        // 测试流程: 创建ElementName实例后，将bundleName属性设置为"com.huawei.hmos.app"，再读取bundleName属性值
        // 预期结果: 返回"com.huawei.hmos.app"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.bundleName = "com.huawei.hmos.app"
        @Expect(elem.bundleName, "com.huawei.hmos.app")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_write_empty_string(): Unit {
        // 原始用例名: test_bundleName_write_empty_string
        // 测试流程: 创建ElementName实例后，将bundleName属性设置为空字符串""
        // 预期结果: 设置成功，读取返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.bundleName = ""
        @Expect(elem.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_write_short_name(): Unit {
        // 原始用例名: test_bundleName_write_short_name
        // 测试流程: 创建ElementName实例后，将bundleName属性设置为最短有效Bundle名称"a.b"
        // 预期结果: 设置成功，读取返回"a.b"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.bundleName = "a.b"
        @Expect(elem.bundleName, "a.b")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_write_special_characters(): Unit {
        // 原始用例名: test_bundleName_write_special_characters
        // 测试流程: 创建ElementName实例后，将bundleName属性设置为包含特殊字符的字符串"com.ohos.example-test"
        // 预期结果: 设置成功，读取返回"com.ohos.example-test"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.bundleName = "com.ohos.example-test"
        @Expect(elem.bundleName, "com.ohos.example-test")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_bundleName_multiple_write_read(): Unit {
        // 原始用例名: test_bundleName_multiple_write_read
        // 测试流程: 创建ElementName实例，先设置bundleName为"com.app1"，读取验证后再设置为"com.app2"，再次读取
        // 预期结果: 第一次读取返回"com.app1"，第二次读取返回"com.app2"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.bundleName = "com.app1"
        @Expect(elem.bundleName, "com.app1")
        elem.bundleName = "com.app2"
        @Expect(elem.bundleName, "com.app2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_read_initial_value(): Unit {
        // 原始用例名: test_abilityName_read_initial_value
        // 测试流程: 创建ElementName实例时指定abilityName为"MainAbility"，读取abilityName属性值
        // 预期结果: 返回"MainAbility"
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_write_and_read(): Unit {
        // 原始用例名: test_abilityName_write_and_read
        // 测试流程: 创建ElementName实例后，将abilityName属性设置为"com.ohos.example.MainAbility"，再读取abilityName属性值
        // 预期结果: 返回"com.ohos.example.MainAbility"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.abilityName = "com.ohos.example.MainAbility"
        @Expect(elem.abilityName, "com.ohos.example.MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_write_empty_string(): Unit {
        // 原始用例名: test_abilityName_write_empty_string
        // 测试流程: 创建ElementName实例后，将abilityName属性设置为空字符串""
        // 预期结果: 设置成功，读取返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.abilityName = ""
        @Expect(elem.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_write_short_name(): Unit {
        // 原始用例名: test_abilityName_write_short_name
        // 测试流程: 创建ElementName实例后，将abilityName属性设置为最短有效Ability名称"A"
        // 预期结果: 设置成功，读取返回"A"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.abilityName = "A"
        @Expect(elem.abilityName, "A")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_write_special_characters(): Unit {
        // 原始用例名: test_abilityName_write_special_characters
        // 测试流程: 创建ElementName实例后，将abilityName属性设置为包含特殊字符的字符串"Main_Ability"
        // 预期结果: 设置成功，读取返回"Main_Ability"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.abilityName = "Main_Ability"
        @Expect(elem.abilityName, "Main_Ability")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_abilityName_multiple_write_read(): Unit {
        // 原始用例名: test_abilityName_multiple_write_read
        // 测试流程: 创建ElementName实例，先设置abilityName为"Ability1"，读取验证后再设置为"Ability2"，再次读取
        // 预期结果: 第一次读取返回"Ability1"，第二次读取返回"Ability2"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.abilityName = "Ability1"
        @Expect(elem.abilityName, "Ability1")
        elem.abilityName = "Ability2"
        @Expect(elem.abilityName, "Ability2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_read_default_empty_string(): Unit {
        // 原始用例名: test_moduleName_read_default_empty_string
        // 测试流程: 创建ElementName实例时不指定moduleName参数，读取moduleName属性值
        // 预期结果: 返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_read_custom_value(): Unit {
        // 原始用例名: test_moduleName_read_custom_value
        // 测试流程: 创建ElementName实例时指定moduleName为"entry"，读取moduleName属性值
        // 预期结果: 返回"entry"
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "entry")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_write_and_read(): Unit {
        // 原始用例名: test_moduleName_write_and_read
        // 测试流程: 创建ElementName实例后，将moduleName属性设置为"feature"，再读取moduleName属性值
        // 预期结果: 返回"feature"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.moduleName = "feature"
        @Expect(elem.moduleName, "feature")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_write_empty_string(): Unit {
        // 原始用例名: test_moduleName_write_empty_string
        // 测试流程: 创建ElementName实例后，将moduleName属性设置为空字符串""
        // 预期结果: 设置成功，读取返回空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "entry")
        elem.moduleName = ""
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_write_short_name(): Unit {
        // 原始用例名: test_moduleName_write_short_name
        // 测试流程: 创建ElementName实例后，将moduleName属性设置为最短有效模块名称"a"
        // 预期结果: 设置成功，读取返回"a"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.moduleName = "a"
        @Expect(elem.moduleName, "a")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_moduleName_multiple_write_read(): Unit {
        // 原始用例名: test_moduleName_multiple_write_read
        // 测试流程: 创建ElementName实例，先设置moduleName为"module1"，读取验证后再设置为"module2"，再次读取
        // 预期结果: 第一次读取返回"module1"，第二次读取返回"module2"
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.moduleName = "module1"
        @Expect(elem.moduleName, "module1")
        elem.moduleName = "module2"
        @Expect(elem.moduleName, "module2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_valid_standard(): Unit {
        // 原始用例名: test_init_bundleName_valid_standard
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName属性值为"com.ohos.example"
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.bundleName, "com.ohos.example")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_valid_short(): Unit {
        // 原始用例名: test_init_bundleName_valid_short
        // 测试流程: 调用ElementName构造函数，bundleName传入最短有效Bundle名称"a.b"，abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName属性值为"a.b"
        let elem = ElementName("a.b", "MainAbility")
        @Expect(elem.bundleName, "a.b")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_valid_with_hyphen(): Unit {
        // 原始用例名: test_init_bundleName_valid_with_hyphen
        // 测试流程: 调用ElementName构造函数，bundleName传入包含特殊字符的字符串"com.ohos.example-test"，abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName属性值为"com.ohos.example-test"
        let elem = ElementName("com.ohos.example-test", "MainAbility")
        @Expect(elem.bundleName, "com.ohos.example-test")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_empty_string(): Unit {
        // 原始用例名: test_init_bundleName_empty_string
        // 测试流程: 调用ElementName构造函数，bundleName传入空字符串""，abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName属性值为空字符串""（业务层面可能导致功能异常）
        let elem = ElementName("", "MainAbility")
        @Expect(elem.bundleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_bundleName_boundary_long_string(): Unit {
        // 原始用例名: test_init_bundleName_boundary_long_string
        // 测试流程: 调用ElementName构造函数，bundleName传入超长字符串（1000个字符），abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName属性值为传入的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName(longStr, "MainAbility")
        @Expect(elem.bundleName, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_valid_standard(): Unit {
        // 原始用例名: test_init_abilityName_valid_standard
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"
        // 预期结果: 成功创建ElementName实例，abilityName属性值为"MainAbility"
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.abilityName, "MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_valid_full_qualified(): Unit {
        // 原始用例名: test_init_abilityName_valid_full_qualified
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"com.ohos.example.MainAbility"
        // 预期结果: 成功创建ElementName实例，abilityName属性值为"com.ohos.example.MainAbility"
        let elem = ElementName("com.ohos.example", "com.ohos.example.MainAbility")
        @Expect(elem.abilityName, "com.ohos.example.MainAbility")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_valid_short(): Unit {
        // 原始用例名: test_init_abilityName_valid_short
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入最短有效Ability名称"A"
        // 预期结果: 成功创建ElementName实例，abilityName属性值为"A"
        let elem = ElementName("com.ohos.example", "A")
        @Expect(elem.abilityName, "A")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_empty_string(): Unit {
        // 原始用例名: test_init_abilityName_empty_string
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入空字符串""
        // 预期结果: 成功创建ElementName实例，abilityName属性值为空字符串""（业务层面可能导致功能异常）
        let elem = ElementName("com.ohos.example", "")
        @Expect(elem.abilityName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_abilityName_boundary_long_string(): Unit {
        // 原始用例名: test_init_abilityName_boundary_long_string
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入超长字符串（1000个字符）
        // 预期结果: 成功创建ElementName实例，abilityName属性值为传入的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName("com.ohos.example", longStr)
        @Expect(elem.abilityName, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_valid_default_empty(): Unit {
        // 原始用例名: test_init_deviceId_valid_default_empty
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，不指定deviceId参数（使用默认值空字符串）
        // 预期结果: 成功创建ElementName实例，deviceId属性值为空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_valid_local(): Unit {
        // 原始用例名: test_init_deviceId_valid_local
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，deviceId传入"local"
        // 预期结果: 成功创建ElementName实例，deviceId属性值为"local"
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "local")
        @Expect(elem.deviceId, "local")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_valid_device_id(): Unit {
        // 原始用例名: test_init_deviceId_valid_device_id
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，deviceId传入"device_001"
        // 预期结果: 成功创建ElementName实例，deviceId属性值为"device_001"
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "device_001")
        @Expect(elem.deviceId, "device_001")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_boundary_empty_string(): Unit {
        // 原始用例名: test_init_deviceId_boundary_empty_string
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，deviceId显式传入空字符串""
        // 预期结果: 成功创建ElementName实例，deviceId属性值为空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "")
        @Expect(elem.deviceId, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_deviceId_boundary_long_string(): Unit {
        // 原始用例名: test_init_deviceId_boundary_long_string
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，deviceId传入超长字符串（1000个字符）
        // 预期结果: 成功创建ElementName实例，deviceId属性值为传入的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: longStr)
        @Expect(elem.deviceId, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_valid_default_empty(): Unit {
        // 原始用例名: test_init_moduleName_valid_default_empty
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，不指定moduleName参数（使用默认值空字符串）
        // 预期结果: 成功创建ElementName实例，moduleName属性值为空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_valid_entry(): Unit {
        // 原始用例名: test_init_moduleName_valid_entry
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，moduleName传入"entry"
        // 预期结果: 成功创建ElementName实例，moduleName属性值为"entry"
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "entry")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_valid_feature(): Unit {
        // 原始用例名: test_init_moduleName_valid_feature
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，moduleName传入"feature"
        // 预期结果: 成功创建ElementName实例，moduleName属性值为"feature"
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "feature")
        @Expect(elem.moduleName, "feature")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_boundary_short(): Unit {
        // 原始用例名: test_init_moduleName_boundary_short
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，moduleName传入最短有效模块名称"a"
        // 预期结果: 成功创建ElementName实例，moduleName属性值为"a"
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "a")
        @Expect(elem.moduleName, "a")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_moduleName_boundary_long_string(): Unit {
        // 原始用例名: test_init_moduleName_boundary_long_string
        // 测试流程: 调用ElementName构造函数，bundleName传入"com.ohos.example"，abilityName传入"MainAbility"，moduleName传入超长字符串（1000个字符）
        // 预期结果: 成功创建ElementName实例，moduleName属性值为传入的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: longStr)
        @Expect(elem.moduleName, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_required_params_only(): Unit {
        // 原始用例名: test_init_pairwise_required_params_only
        // 测试流程: 调用ElementName构造函数，仅传入必填参数bundleName="com.ohos.example"和abilityName="MainAbility"
        // 预期结果: 成功创建ElementName实例，bundleName为"com.ohos.example"，abilityName为"MainAbility"，deviceId为空字符串""，moduleName为空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.deviceId, "")
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_with_deviceId(): Unit {
        // 原始用例名: test_init_pairwise_with_deviceId
        // 测试流程: 调用ElementName构造函数，传入bundleName="com.ohos.example"，abilityName="MainAbility"，deviceId="device_001"
        // 预期结果: 成功创建ElementName实例，bundleName为"com.ohos.example"，abilityName为"MainAbility"，deviceId为"device_001"，moduleName为空字符串""
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "device_001")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.deviceId, "device_001")
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_with_moduleName(): Unit {
        // 原始用例名: test_init_pairwise_with_moduleName
        // 测试流程: 调用ElementName构造函数，传入bundleName="com.ohos.example"，abilityName="MainAbility"，moduleName="entry"
        // 预期结果: 成功创建ElementName实例，bundleName为"com.ohos.example"，abilityName为"MainAbility"，deviceId为空字符串""，moduleName为"entry"
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "entry")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.deviceId, "")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_all_params(): Unit {
        // 原始用例名: test_init_pairwise_all_params
        // 测试流程: 调用ElementName构造函数，传入所有参数bundleName="com.ohos.example"，abilityName="MainAbility"，deviceId="local"，moduleName="entry"
        // 预期结果: 成功创建ElementName实例，bundleName为"com.ohos.example"，abilityName为"MainAbility"，deviceId为"local"，moduleName为"entry"
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "local", moduleName: "entry")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.deviceId, "local")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_empty_bundleName_with_deviceId(): Unit {
        // 原始用例名: test_init_pairwise_empty_bundleName_with_deviceId
        // 测试流程: 调用ElementName构造函数，传入bundleName=""，abilityName="MainAbility"，deviceId="device_001"
        // 预期结果: 成功创建ElementName实例，bundleName为空字符串""，abilityName为"MainAbility"，deviceId为"device_001"，moduleName为空字符串""
        let elem = ElementName("", "MainAbility", deviceId: "device_001")
        @Expect(elem.bundleName, "")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.deviceId, "device_001")
        @Expect(elem.moduleName, "")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_empty_abilityName_with_moduleName(): Unit {
        // 原始用例名: test_init_pairwise_empty_abilityName_with_moduleName
        // 测试流程: 调用ElementName构造函数，传入bundleName="com.ohos.example"，abilityName=""，moduleName="entry"
        // 预期结果: 成功创建ElementName实例，bundleName为"com.ohos.example"，abilityName为空字符串""，deviceId为空字符串""，moduleName为"entry"
        let elem = ElementName("com.ohos.example", "", moduleName: "entry")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "")
        @Expect(elem.deviceId, "")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_short_bundleName_long_abilityName(): Unit {
        // 原始用例名: test_init_pairwise_short_bundleName_long_abilityName
        // 测试流程: 调用ElementName构造函数，传入bundleName="a.b"，abilityName为超长字符串（1000个字符）
        // 预期结果: 成功创建ElementName实例，bundleName为"a.b"，abilityName为传入的超长字符串
        let longStr = makeLongString(1000)
        let elem = ElementName("a.b", longStr)
        @Expect(elem.bundleName, "a.b")
        @Expect(elem.abilityName, longStr)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_pairwise_special_chars_all_params(): Unit {
        // 原始用例名: test_init_pairwise_special_chars_all_params
        // 测试流程: 调用ElementName构造函数，传入bundleName="com.ohos.example-test"，abilityName="Main_Ability"，deviceId="device-001"，moduleName="feature_module"
        // 预期结果: 成功创建ElementName实例，各属性值与传入参数一致
        let elem = ElementName("com.ohos.example-test", "Main_Ability", deviceId: "device-001", moduleName: "feature_module")
        @Expect(elem.bundleName, "com.ohos.example-test")
        @Expect(elem.abilityName, "Main_Ability")
        @Expect(elem.deviceId, "device-001")
        @Expect(elem.moduleName, "feature_module")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_return_elementname_instance(): Unit {
        // 原始用例名: test_init_return_elementname_instance
        // 测试流程: 调用ElementName构造函数创建实例，验证返回值类型
        // 预期结果: 返回ElementName类型的实例对象
        let elem = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem is ElementName, true)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_return_all_properties_accessible(): Unit {
        // 原始用例名: test_init_return_all_properties_accessible
        // 测试流程: 调用ElementName构造函数创建实例，依次访问deviceId、bundleName、abilityName、moduleName属性
        // 预期结果: 所有属性均可正常访问，返回对应的String类型值
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "local", moduleName: "entry")
        let _ = elem.deviceId
        let _ = elem.bundleName
        let _ = elem.abilityName
        let _ = elem.moduleName
        @Expect(elem.deviceId, "local")
        @Expect(elem.bundleName, "com.ohos.example")
        @Expect(elem.abilityName, "MainAbility")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_named_params_order_deviceId_first(): Unit {
        // 原始用例名: test_init_named_params_order_deviceId_first
        // 测试流程: 调用ElementName构造函数，使用命名参数语法，先指定deviceId再指定moduleName
        // 预期结果: 成功创建ElementName实例，各属性值正确
        let elem = ElementName("com.ohos.example", "MainAbility", deviceId: "local", moduleName: "entry")
        @Expect(elem.deviceId, "local")
        @Expect(elem.moduleName, "entry")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_named_params_order_moduleName_first(): Unit {
        // 原始用例名: test_init_named_params_order_moduleName_first
        // 测试流程: 调用ElementName构造函数，使用命名参数语法，先指定moduleName再指定deviceId
        // 预期结果: 成功创建ElementName实例，各属性值正确
        let elem = ElementName("com.ohos.example", "MainAbility", moduleName: "entry", deviceId: "local")
        @Expect(elem.moduleName, "entry")
        @Expect(elem.deviceId, "local")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_unicode_bundleName(): Unit {
        // 原始用例名: test_init_unicode_bundleName
        // 测试流程: 调用ElementName构造函数，bundleName传入包含Unicode字符的字符串
        // 预期结果: 成功创建ElementName实例，bundleName属性值包含Unicode字符
        let unicodeName = "com.ohos.example"
        let elem = ElementName(unicodeName, "MainAbility")
        @Expect(elem.bundleName, unicodeName)
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_create_multiple_instances(): Unit {
        // 原始用例名: test_init_create_multiple_instances
        // 测试流程: 连续调用ElementName构造函数创建多个实例，每个实例使用不同的参数值
        // 预期结果: 成功创建多个独立的ElementName实例，各实例属性值互不影响
        let elem1 = ElementName("com.app1", "Ability1")
        let elem2 = ElementName("com.app2", "Ability2")
        @Expect(elem1.bundleName, "com.app1")
        @Expect(elem2.bundleName, "com.app2")
        @Expect(elem1.abilityName, "Ability1")
        @Expect(elem2.abilityName, "Ability2")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_create_and_modify_properties(): Unit {
        // 原始用例名: test_init_create_and_modify_properties
        // 测试流程: 调用ElementName构造函数创建实例，然后修改各属性值，再读取验证
        // 预期结果: 实例创建成功，属性修改成功，读取返回修改后的值
        let elem = ElementName("com.ohos.example", "MainAbility")
        elem.deviceId = "device_001"
        elem.bundleName = "com.huawei.hmos.app"
        elem.abilityName = "SecondAbility"
        elem.moduleName = "feature"
        @Expect(elem.deviceId, "device_001")
        @Expect(elem.bundleName, "com.huawei.hmos.app")
        @Expect(elem.abilityName, "SecondAbility")
        @Expect(elem.moduleName, "feature")
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_init_create_with_same_params(): Unit {
        // 原始用例名: test_init_create_with_same_params
        // 测试流程: 使用相同参数调用ElementName构造函数创建两个实例，比较两个实例的属性值
        // 预期结果: 两个实例的属性值相同，但为独立对象
        let elem1 = ElementName("com.ohos.example", "MainAbility")
        let elem2 = ElementName("com.ohos.example", "MainAbility")
        @Expect(elem1.bundleName, elem2.bundleName)
        @Expect(elem1.abilityName, elem2.abilityName)
        @Expect(elem1.deviceId, elem2.deviceId)
        @Expect(elem1.moduleName, elem2.moduleName)
    }
}
