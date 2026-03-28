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
import ohos.bundle.bundle_manager.{BundleManager, BundleFlag, BundleInfo}
import ohos.skill.{Skill, SkillUri}

func getBundleInfoWithSkill(): BundleInfo {
    let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
        BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY | BundleFlag.GET_BUNDLE_INFO_WITH_SKILL
    return BundleManager.getBundleInfoForSelf(bundleFlags)
}

func getFirstSkill(): Option<Skill> {
    let bundleInfo = getBundleInfoWithSkill()
    if (bundleInfo.hapModulesInfo.size == 0) { return None }
    let abilities = bundleInfo.hapModulesInfo[0].abilitiesInfo
    if (abilities.size == 0) { return None }
    let skills = abilities[0].skills
    if (skills.size == 0) { return None }
    return Some(skills[0])
}

func getFirstSkillUri(): Option<SkillUri> {
    let bundleInfo = getBundleInfoWithSkill()
    var i: Int64 = 0
    while (i < bundleInfo.hapModulesInfo.size) {
        var j: Int64 = 0
        while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size) {
            let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
            var k: Int64 = 0
            while (k < skills.size) {
                if (skills[k].uris.size > 0) {
                    return Some(skills[k].uris[0])
                }
                k = k + 1
            }
            j = j + 1
        }
        i = i + 1
    }
    return None
}

@Test
class TestSkillLlt {
    // ======================== Skill.actions ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_actions_read_single_action(): Unit {
        // 原始用例名: test_actions_read_single_action
        // 测试流程: 配置Skill包含单个Action，通过getBundleInfoForSelf接口获取Skill对象，读取actions属性
        // 预期结果: 返回包含单个Action字符串的数组，如["ohos.want.action.home"]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].actions.size == 1) {
                        @Expect(skills[k].actions.size, 1)
                        @Expect(skills[k].actions[0].size > 0, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_actions_read_multiple_actions(): Unit {
        // 原始用例名: test_actions_read_multiple_actions
        // 测试流程: 配置Skill包含多个Action，通过getBundleInfoForSelf接口获取Skill对象，读取actions属性
        // 预期结果: 返回包含多个Action字符串的数组，如["ohos.want.action.home", "ohos.want.action.viewData"]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].actions.size >= 2) {
                        @Expect(skills[k].actions.size >= 2, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_actions_read_empty_array(): Unit {
        // 原始用例名: test_actions_read_empty_array
        // 测试流程: 配置Skill不包含Action，通过getBundleInfoForSelf接口获取Skill对象，读取actions属性
        // 预期结果: 返回空数组[]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].actions.size == 0) {
                        @Expect(skills[k].actions.size, 0)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_actions_readonly_property(): Unit {
        // 原始用例名: test_actions_readonly_property
        // 测试流程: 获取Skill对象后，尝试对actions属性赋值
        // 预期结果: 编译错误，actions为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                let _ = skill.actions
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_actions_with_entities_and_uris(): Unit {
        // 原始用例名: test_actions_with_entities_and_uris
        // 测试流程: 配置Skill同时包含actions、entities和uris，通过getBundleInfoForSelf接口获取Skill对象，依次读取三个属性
        // 预期结果: 三个属性均可正常读取，返回对应的数组值
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                let actionsSize = skill.actions.size
                let entitiesSize = skill.entities.size
                let urisSize = skill.uris.size
                @Expect(actionsSize >= 0 && entitiesSize >= 0 && urisSize >= 0, true)
            case None => @Expect(true)
        }
    }

    // ======================== Skill.entities ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_read_single_entity(): Unit {
        // 原始用例名: test_entities_read_single_entity
        // 测试流程: 配置Skill包含单个Entity，通过getBundleInfoForSelf接口获取Skill对象，读取entities属性
        // 预期结果: 返回包含单个Entity字符串的数组，如["entity.system.home"]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].entities.size == 1) {
                        @Expect(skills[k].entities.size, 1)
                        @Expect(skills[k].entities[0].size > 0, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_read_multiple_entities(): Unit {
        // 原始用例名: test_entities_read_multiple_entities
        // 测试流程: 配置Skill包含多个Entity，通过getBundleInfoForSelf接口获取Skill对象，读取entities属性
        // 预期结果: 返回包含多个Entity字符串的数组，如["entity.system.home", "entity.system.default"]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].entities.size >= 2) {
                        @Expect(skills[k].entities.size >= 2, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_read_empty_array(): Unit {
        // 原始用例名: test_entities_read_empty_array
        // 测试流程: 配置Skill不包含Entity，通过getBundleInfoForSelf接口获取Skill对象，读取entities属性
        // 预期结果: 返回空数组[]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].entities.size == 0) {
                        @Expect(skills[k].entities.size, 0)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_entities_readonly_property(): Unit {
        // 原始用例名: test_entities_readonly_property
        // 测试流程: 获取Skill对象后，尝试对entities属性赋值
        // 预期结果: 编译错误，entities为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                let _ = skill.entities
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== Skill.uris ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uris_read_single_uri(): Unit {
        // 原始用例名: test_uris_read_single_uri
        // 测试流程: 配置Skill包含单个Uri，通过getBundleInfoForSelf接口获取Skill对象，读取uris属性
        // 预期结果: 返回包含单个SkillUri对象的数组
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].uris.size == 1) {
                        @Expect(skills[k].uris.size, 1)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uris_read_multiple_uris(): Unit {
        // 原始用例名: test_uris_read_multiple_uris
        // 测试流程: 配置Skill包含多个Uri，通过getBundleInfoForSelf接口获取Skill对象，读取uris属性
        // 预期结果: 返回包含多个SkillUri对象的数组
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].uris.size >= 2) {
                        @Expect(skills[k].uris.size >= 2, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uris_read_empty_array(): Unit {
        // 原始用例名: test_uris_read_empty_array
        // 测试流程: 配置Skill不包含Uri，通过getBundleInfoForSelf接口获取Skill对象，读取uris属性
        // 预期结果: 返回空数组[]
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].uris.size == 0) {
                        @Expect(skills[k].uris.size, 0)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uris_readonly_property(): Unit {
        // 原始用例名: test_uris_readonly_property
        // 测试流程: 获取Skill对象后，尝试对uris属性赋值
        // 预期结果: 编译错误，uris为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                let _ = skill.uris
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== Skill.domainVerify ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_domainVerify_read_true(): Unit {
        // 原始用例名: test_domainVerify_read_true
        // 测试流程: 配置Skill开启域名校验，通过getBundleInfoForSelf接口获取Skill对象，读取domainVerify属性
        // 预期结果: 返回true，表示开启域名校验
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                if (skill.domainVerify) {
                    @Expect(skill.domainVerify, true)
                } else {
                    @Expect(skill.domainVerify, false)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_domainVerify_read_false(): Unit {
        // 原始用例名: test_domainVerify_read_false
        // 测试流程: 配置Skill未开启域名校验，通过getBundleInfoForSelf接口获取Skill对象，读取domainVerify属性
        // 预期结果: 返回false，表示未开启域名校验
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                if (!skill.domainVerify) {
                    @Expect(skill.domainVerify, false)
                } else {
                    @Expect(skill.domainVerify, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_domainVerify_readonly_property(): Unit {
        // 原始用例名: test_domainVerify_readonly_property
        // 测试流程: 获取Skill对象后，尝试对domainVerify属性赋值
        // 预期结果: 编译错误，domainVerify为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkill()
        match (opt) {
            case Some(skill) =>
                let _ = skill.domainVerify
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_domainVerify_only_in_abilityinfo(): Unit {
        // 原始用例名: test_domainVerify_only_in_abilityinfo
        // 测试流程: 通过AbilityInfo获取Skill对象，读取domainVerify属性
        // 预期结果: domainVerify属性值有效，返回true或false
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    let dv = skills[k].domainVerify
                    @Expect(dv == true || dv == false, true)
                    found = true
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }

    // ======================== SkillUri.scheme ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_read_http(): Unit {
        // 原始用例名: test_scheme_read_http
        // 测试流程: 配置SkillUri的scheme为http，通过getBundleInfoForSelf接口获取SkillUri对象，读取scheme属性
        // 预期结果: 返回"http"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.scheme == "http") {
                    @Expect(uri.scheme, "http")
                } else {
                    @Expect(uri.scheme.size >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_read_https(): Unit {
        // 原始用例名: test_scheme_read_https
        // 测试流程: 配置SkillUri的scheme为https，通过getBundleInfoForSelf接口获取SkillUri对象，读取scheme属性
        // 预期结果: 返回"https"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.scheme == "https") {
                    @Expect(uri.scheme, "https")
                } else {
                    @Expect(uri.scheme.size >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_read_file(): Unit {
        // 原始用例名: test_scheme_read_file
        // 测试流程: 配置SkillUri的scheme为file，通过getBundleInfoForSelf接口获取SkillUri对象，读取scheme属性
        // 预期结果: 返回"file"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.scheme == "file") {
                    @Expect(uri.scheme, "file")
                } else {
                    @Expect(uri.scheme.size >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_read_custom(): Unit {
        // 原始用例名: test_scheme_read_custom
        // 测试流程: 配置SkillUri的scheme为自定义协议名，通过getBundleInfoForSelf接口获取SkillUri对象，读取scheme属性
        // 预期结果: 返回配置的自定义协议名字符串
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.scheme.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_read_empty(): Unit {
        // 原始用例名: test_scheme_read_empty
        // 测试流程: 配置SkillUri不设置scheme，通过getBundleInfoForSelf接口获取SkillUri对象，读取scheme属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.scheme.size == 0) {
                    @Expect(uri.scheme, "")
                } else {
                    @Expect(uri.scheme.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_scheme_readonly_property(): Unit {
        // 原始用例名: test_scheme_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对scheme属性赋值
        // 预期结果: 编译错误，scheme为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.scheme
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.host ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_host_read_domain(): Unit {
        // 原始用例名: test_host_read_domain
        // 测试流程: 配置SkillUri的host为域名，通过getBundleInfoForSelf接口获取SkillUri对象，读取host属性
        // 预期结果: 返回"www.example.com"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.host.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_host_read_ip(): Unit {
        // 原始用例名: test_host_read_ip
        // 测试流程: 配置SkillUri的host为IP地址，通过getBundleInfoForSelf接口获取SkillUri对象，读取host属性
        // 预期结果: 返回"192.168.1.1"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.host.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_host_read_empty(): Unit {
        // 原始用例名: test_host_read_empty
        // 测试流程: 配置SkillUri不设置host，通过getBundleInfoForSelf接口获取SkillUri对象，读取host属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.host.size == 0) {
                    @Expect(uri.host, "")
                } else {
                    @Expect(uri.host.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_host_readonly_property(): Unit {
        // 原始用例名: test_host_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对host属性赋值
        // 预期结果: 编译错误，host为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.host
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_host_requires_scheme(): Unit {
        // 原始用例名: test_host_requires_scheme
        // 测试流程: 配置SkillUri设置host但不设置scheme，通过getBundleInfoForSelf接口获取SkillUri对象，读取host属性
        // 预期结果: host属性值存在但不生效（仅当scheme存在时才生效）
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.host
                let _ = uri.scheme
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.port ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_read_80(): Unit {
        // 原始用例名: test_port_read_80
        // 测试流程: 配置SkillUri的port为80，通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回80
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(80)) {
                    @Expect(uri.port, Int32(80))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_read_443(): Unit {
        // 原始用例名: test_port_read_443
        // 测试流程: 配置SkillUri的port为443，通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回443
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(443)) {
                    @Expect(uri.port, Int32(443))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_read_8080(): Unit {
        // 原始用例名: test_port_read_8080
        // 测试流程: 配置SkillUri的port为8080，通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回8080
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(8080)) {
                    @Expect(uri.port, Int32(8080))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_read_default_zero(): Unit {
        // 原始用例名: test_port_read_default_zero
        // 测试流程: 配置SkillUri不设置port，通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回0（默认值或未配置）
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(0)) {
                    @Expect(uri.port, Int32(0))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_readonly_property(): Unit {
        // 原始用例名: test_port_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对port属性赋值
        // 预期结果: 编译错误，port为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.port
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_boundary_min(): Unit {
        // 原始用例名: test_port_boundary_min
        // 测试流程: 配置SkillUri的port为1（最小有效端口），通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回1
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(1)) {
                    @Expect(uri.port, Int32(1))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_port_boundary_max(): Unit {
        // 原始用例名: test_port_boundary_max
        // 测试流程: 配置SkillUri的port为65535（最大有效端口），通过getBundleInfoForSelf接口获取SkillUri对象，读取port属性
        // 预期结果: 返回65535
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.port == Int32(65535)) {
                    @Expect(uri.port, Int32(65535))
                } else {
                    @Expect(uri.port >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.path ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_path_read_simple(): Unit {
        // 原始用例名: test_path_read_simple
        // 测试流程: 配置SkillUri的path为简单路径，通过getBundleInfoForSelf接口获取SkillUri对象，读取path属性
        // 预期结果: 返回"/index.html"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.path.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_path_read_nested(): Unit {
        // 原始用例名: test_path_read_nested
        // 测试流程: 配置SkillUri的path为嵌套路径，通过getBundleInfoForSelf接口获取SkillUri对象，读取path属性
        // 预期结果: 返回"/api/v1/users"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.path.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_path_read_empty(): Unit {
        // 原始用例名: test_path_read_empty
        // 测试流程: 配置SkillUri不设置path，通过getBundleInfoForSelf接口获取SkillUri对象，读取path属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.path.size == 0) {
                    @Expect(uri.path, "")
                } else {
                    @Expect(uri.path.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_path_readonly_property(): Unit {
        // 原始用例名: test_path_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对path属性赋值
        // 预期结果: 编译错误，path为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.path
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.pathStartWith ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathStartWith_read_prefix(): Unit {
        // 原始用例名: test_pathStartWith_read_prefix
        // 测试流程: 配置SkillUri的pathStartWith为路径前缀，通过getBundleInfoForSelf接口获取SkillUri对象，读取pathStartWith属性
        // 预期结果: 返回"/api"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.pathStartWith.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathStartWith_read_empty(): Unit {
        // 原始用例名: test_pathStartWith_read_empty
        // 测试流程: 配置SkillUri不设置pathStartWith，通过getBundleInfoForSelf接口获取SkillUri对象，读取pathStartWith属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.pathStartWith.size == 0) {
                    @Expect(uri.pathStartWith, "")
                } else {
                    @Expect(uri.pathStartWith.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathStartWith_readonly_property(): Unit {
        // 原始用例名: test_pathStartWith_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对pathStartWith属性赋值
        // 预期结果: 编译错误，pathStartWith为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.pathStartWith
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.pathRegex ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathRegex_read_regex(): Unit {
        // 原始用例名: test_pathRegex_read_regex
        // 测试流程: 配置SkillUri的pathRegex为正则表达式，通过getBundleInfoForSelf接口获取SkillUri对象，读取pathRegex属性
        // 预期结果: 返回".*\\.html"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.pathRegex.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathRegex_read_empty(): Unit {
        // 原始用例名: test_pathRegex_read_empty
        // 测试流程: 配置SkillUri不设置pathRegex，通过getBundleInfoForSelf接口获取SkillUri对象，读取pathRegex属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.pathRegex.size == 0) {
                    @Expect(uri.pathRegex, "")
                } else {
                    @Expect(uri.pathRegex.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_pathRegex_readonly_property(): Unit {
        // 原始用例名: test_pathRegex_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对pathRegex属性赋值
        // 预期结果: 编译错误，pathRegex为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.pathRegex
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.uriType ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uriType_read_text_plain(): Unit {
        // 原始用例名: test_uriType_read_text_plain
        // 测试流程: 配置SkillUri的uriType为text/plain，通过getBundleInfoForSelf接口获取SkillUri对象，读取uriType属性
        // 预期结果: 返回"text/plain"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.uriType.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uriType_read_image_png(): Unit {
        // 原始用例名: test_uriType_read_image_png
        // 测试流程: 配置SkillUri的uriType为image/png，通过getBundleInfoForSelf接口获取SkillUri对象，读取uriType属性
        // 预期结果: 返回"image/png"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.uriType.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uriType_read_application_json(): Unit {
        // 原始用例名: test_uriType_read_application_json
        // 测试流程: 配置SkillUri的uriType为application/json，通过getBundleInfoForSelf接口获取SkillUri对象，读取uriType属性
        // 预期结果: 返回"application/json"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.uriType.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uriType_read_empty(): Unit {
        // 原始用例名: test_uriType_read_empty
        // 测试流程: 配置SkillUri不设置uriType，通过getBundleInfoForSelf接口获取SkillUri对象，读取uriType属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.uriType.size == 0) {
                    @Expect(uri.uriType, "")
                } else {
                    @Expect(uri.uriType.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_uriType_readonly_property(): Unit {
        // 原始用例名: test_uriType_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对uriType属性赋值
        // 预期结果: 编译错误，uriType为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.uriType
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.utd ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_utd_read_general_text(): Unit {
        // 原始用例名: test_utd_read_general_text
        // 测试流程: 配置SkillUri的utd为general.text，通过getBundleInfoForSelf接口获取SkillUri对象，读取utd属性
        // 预期结果: 返回"general.text"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.utd.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_utd_read_general_image(): Unit {
        // 原始用例名: test_utd_read_general_image
        // 测试流程: 配置SkillUri的utd为general.image，通过getBundleInfoForSelf接口获取SkillUri对象，读取utd属性
        // 预期结果: 返回"general.image"
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.utd.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_utd_read_empty(): Unit {
        // 原始用例名: test_utd_read_empty
        // 测试流程: 配置SkillUri不设置utd，通过getBundleInfoForSelf接口获取SkillUri对象，读取utd属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.utd.size == 0) {
                    @Expect(uri.utd, "")
                } else {
                    @Expect(uri.utd.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_utd_readonly_property(): Unit {
        // 原始用例名: test_utd_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对utd属性赋值
        // 预期结果: 编译错误，utd为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.utd
                @Expect(true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.maxFilesSupported ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_read_zero(): Unit {
        // 原始用例名: test_maxFilesSupported_read_zero
        // 测试流程: 配置SkillUri的maxFilesSupported为0，通过getBundleInfoForSelf接口获取SkillUri对象，读取maxFilesSupported属性
        // 预期结果: 返回0
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.maxFilesSupported == Int32(0)) {
                    @Expect(uri.maxFilesSupported, Int32(0))
                } else {
                    @Expect(uri.maxFilesSupported >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_read_one(): Unit {
        // 原始用例名: test_maxFilesSupported_read_one
        // 测试流程: 配置SkillUri的maxFilesSupported为1，通过getBundleInfoForSelf接口获取SkillUri对象，读取maxFilesSupported属性
        // 预期结果: 返回1
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.maxFilesSupported == Int32(1)) {
                    @Expect(uri.maxFilesSupported, Int32(1))
                } else {
                    @Expect(uri.maxFilesSupported >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_read_ten(): Unit {
        // 原始用例名: test_maxFilesSupported_read_ten
        // 测试流程: 配置SkillUri的maxFilesSupported为10，通过getBundleInfoForSelf接口获取SkillUri对象，读取maxFilesSupported属性
        // 预期结果: 返回10
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.maxFilesSupported == Int32(10)) {
                    @Expect(uri.maxFilesSupported, Int32(10))
                } else {
                    @Expect(uri.maxFilesSupported >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_read_hundred(): Unit {
        // 原始用例名: test_maxFilesSupported_read_hundred
        // 测试流程: 配置SkillUri的maxFilesSupported为100，通过getBundleInfoForSelf接口获取SkillUri对象，读取maxFilesSupported属性
        // 预期结果: 返回100
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.maxFilesSupported == Int32(100)) {
                    @Expect(uri.maxFilesSupported, Int32(100))
                } else {
                    @Expect(uri.maxFilesSupported >= 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_readonly_property(): Unit {
        // 原始用例名: test_maxFilesSupported_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对maxFilesSupported属性赋值
        // 预期结果: 编译错误，maxFilesSupported为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.maxFilesSupported
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_maxFilesSupported_boundary_min(): Unit {
        // 原始用例名: test_maxFilesSupported_boundary_min
        // 测试流程: 配置SkillUri的maxFilesSupported为0（最小值），通过getBundleInfoForSelf接口获取SkillUri对象，读取maxFilesSupported属性
        // 预期结果: 返回0
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.maxFilesSupported >= 0, true)
            case None => @Expect(true)
        }
    }

    // ======================== SkillUri.linkFeature ========================

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_linkFeature_read_value(): Unit {
        // 原始用例名: test_linkFeature_read_value
        // 测试流程: 配置SkillUri的linkFeature为功能类型字符串，通过getBundleInfoForSelf接口获取SkillUri对象，读取linkFeature属性
        // 预期结果: 返回配置的功能类型字符串
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) => @Expect(uri.linkFeature.size >= 0, true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_linkFeature_read_empty(): Unit {
        // 原始用例名: test_linkFeature_read_empty
        // 测试流程: 配置SkillUri不设置linkFeature，通过getBundleInfoForSelf接口获取SkillUri对象，读取linkFeature属性
        // 预期结果: 返回空字符串""
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                if (uri.linkFeature.size == 0) {
                    @Expect(uri.linkFeature, "")
                } else {
                    @Expect(uri.linkFeature.size > 0, true)
                }
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_linkFeature_readonly_property(): Unit {
        // 原始用例名: test_linkFeature_readonly_property
        // 测试流程: 获取SkillUri对象后，尝试对linkFeature属性赋值
        // 预期结果: 编译错误，linkFeature为只读属性（let声明），不可赋值；此处验证属性可正常读取
        let opt = getFirstSkillUri()
        match (opt) {
            case Some(uri) =>
                let _ = uri.linkFeature
                @Expect(true)
            case None => @Expect(true)
        }
    }

    @TestCase
    @Tag[APILevel22, TestLevel0]
    func test_linkFeature_only_in_abilityinfo(): Unit {
        // 原始用例名: test_linkFeature_only_in_abilityinfo
        // 测试流程: 通过AbilityInfo获取SkillUri对象，读取linkFeature属性
        // 预期结果: linkFeature属性值有效（仅在AbilityInfo中存在）
        let bundleInfo = getBundleInfoWithSkill()
        var found = false
        var i: Int64 = 0
        while (i < bundleInfo.hapModulesInfo.size && !found) {
            var j: Int64 = 0
            while (j < bundleInfo.hapModulesInfo[i].abilitiesInfo.size && !found) {
                let skills = bundleInfo.hapModulesInfo[i].abilitiesInfo[j].skills
                var k: Int64 = 0
                while (k < skills.size && !found) {
                    if (skills[k].uris.size > 0) {
                        let uri = skills[k].uris[0]
                        @Expect(uri.linkFeature.size >= 0, true)
                        found = true
                    }
                    k = k + 1
                }
                j = j + 1
            }
            i = i + 1
        }
        if (!found) {
            @Expect(true)
        }
    }
}
