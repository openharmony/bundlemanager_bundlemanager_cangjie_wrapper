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

import CoreFileKit.*
import AbilityKit.{BundleManager, BundleInfo, Metadata, UsedScene, DefaultAppManager, ApplicationType,
    ReqPermissionDetail, BundleFlag}
import AbilityKit.{BundleType,
    PermissionGrantState, DisplayOrientation, LaunchType, ExtensionAbilityType, ModuleType,
    MultiAppModeType}
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*
import PerformanceAnalysisKit.Hilog

@Test
class Test_bundle_info {
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_bundleInfo_00(): Unit {
        let bundleInfo = getFullBundleInfo()
        @Expect(true)
        @Expect(bundleInfo.name, "com.example.myapplication")
        @Expect(bundleInfo.vendor, "example")
        @Expect(bundleInfo.versionCode, 1000000)
        @Expect(bundleInfo.versionName, "1.0.0")
        @Expect(bundleInfo.installTime > 0)
        @Expect(bundleInfo.updateTime > 0)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_bundle_ApplicationType(): Unit {
        @Expect(ApplicationType.Browser.getValue(), "Web Browser")
        @Expect(ApplicationType.Image.getValue(), "Image Gallery")
        @Expect(ApplicationType.Audio.getValue(), "Audio Player")
        @Expect(ApplicationType.Video.getValue(), "Video Player")
        @Expect(ApplicationType.Pdf.getValue(), "PDF Viewer")
        @Expect(ApplicationType.Word.getValue(), "Word Viewer")
        @Expect(ApplicationType.Excel.getValue(), "Excel Viewer")
        @Expect(ApplicationType.Ppt.getValue(), "PPT Viewer")
        @Expect(ApplicationType.Email.getValue(), "Email")
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication(): Unit {
        try {
            DefaultAppManager.isDefaultApplication("Web Browser")
            DefaultAppManager.isDefaultApplication("")
        } catch (e: Exception) {
            Hilog.info(0, "test_isDefaultApplication", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_getProfileByExtensionAbility() {
        try {
            let moduleName = "entry"
            let extensionAbilityName = ""
            let metadataName = "myProfile"
            let info = BundleManager.getProfileByExtensionAbility(moduleName, extensionAbilityName,
                metadataName: metadataName)
            for (i in 0..info.size) {
                Hilog.info(0, "info ${i}", "${info[i]} \n")
            }
        } catch (e: Exception) {
            Hilog.info(0, "test_getProfileByExtensionAbility", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_getProfileByAbility() {
        try {
            let moduleName = "entry"
            let abilityName = "EntryAbility"
            let metadataName = "myProfile"
            let info = BundleManager.getProfileByAbility(moduleName, abilityName, metadataName: metadataName)
            for (i in 0..info.size) {
                Hilog.info(0, "info ${i}", "${info[i]} \n")
            }
        } catch (e: Exception) {
            Hilog.info(0, "test_getProfileByAbility", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func testGetBundleInfoForSelfTwice() {
        getFullBundleInfo()
        getFullBundleInfo()
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_BROWSER(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Browser
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_BROWSER", "BROWSER tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_BROWSER", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_IMAGE(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Image
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_IMAGE", "IMAGE tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_IMAGE", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_AUDIO(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Audio
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_AUDIO", "AUDIO tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_AUDIO", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_VIDEO(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Video
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_VIDEO", "VIDEO tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_VIDEO", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_PDF(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Pdf
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_PDF", "PDF tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_PDF", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_WORD(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Word
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_WORD", "WORD tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_WORD", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_EXCEL(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Excel
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_EXCEL", "EXCEL tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_EXCEL", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_PPT(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Ppt
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_PPT", "PPT tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_PPT", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_isDefaultApplication_EMAIL(): Unit {
        try {
            let tag = DefaultAppManager.isDefaultApplication(ApplicationType
                .Email
                .getValue())
            @Expect(true)
            Hilog.info(0, "test_defaultapp_EMAIL", "EMAIL tag is ${tag}")
        } catch (e: Exception) {
            Hilog.info(0, "test_defaultapp_EMAIL", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_bundle_skill(): Unit {
        BundleFlag()
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_DEFAULT | BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
            BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY |
            BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY | BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION |
            BundleFlag.GET_BUNDLE_INFO_WITH_METADATA | BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE |
            BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO | BundleFlag.GET_BUNDLE_INFO_WITH_MENU |
            BundleFlag.GET_BUNDLE_INFO_WITH_SKILL | BundleFlag.GET_BUNDLE_INFO_WITH_ROUTER_MAP
        let bundleinfo = BundleManager.getBundleInfoForSelf(bundleFlags)

        let HapModuleInfo = bundleinfo.hapModulesInfo
        let ability = HapModuleInfo[0].abilitiesInfo
        let excludeFromDock = ability[0].excludeFromDock
        let skills = ability[0].skills
        let appIndex = ability[0].appIndex

        let action = skills[0].actions
        let entities = skills[0].entities
        let uris = skills[0].uris
        let domainVerify = skills[0].domainVerify
        @Expect(action.toString(), "[action.system.home]")
        @Expect(entities.toString(), "[entity.system.home]")
        @Expect(domainVerify, false)
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_canOpenLink(): Unit {
        try {
            let link = "app1Scheme://test.example.com/home"
            let canOpen = BundleManager.canOpenLink(link)
            Hilog.info(0, "test_canOpenLink", "link is  ${canOpen}")
            @Expect(true)
        } catch (e: Exception) {
            Hilog.info(0, "test_canOpenLink", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_canOpenLink_invalid(): Unit {
        try {
            let link = "app1Scheme:/test.example.com/home"
            let canOpen = BundleManager.canOpenLink(link)
            Hilog.info(0, "test_canOpenLink", "link is  ${canOpen}")
        } catch (e: Exception) {
            @Expect(true)
            Hilog.info(0, "test_canOpenLink", "${e.message.toString()}")
        }
    }

    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_canOpenLink_notExist(): Unit {
        try {
            let link = "app2Scheme://test.example.com/home"
            let canOpen = BundleManager.canOpenLink(link)
            Hilog.info(0, "test_canOpenLink", "link is  ${canOpen}")
        } catch (e: Exception) {
            @Expect(true)
            Hilog.info(0, "test_canOpenLink", "${e.message.toString()}")
        }
    }



    @TestCase
    @Tag[APILevel21, TestLevel0]
    func test_enums(): Unit {

        let enum_BundleType: Array<BundleType> = [
            BundleType.App,
            BundleType.AtomicService
        ]
        let enum_PermissionGrantState: Array<PermissionGrantState> = [
            PermissionGrantState.PermissionDenied,
            PermissionGrantState.PermissionGranted
        ]

        let enum_DisplayOrientation: Array<DisplayOrientation> = [
            DisplayOrientation.Unspecified,
            DisplayOrientation.Landscape,
            DisplayOrientation.Portrait,
            DisplayOrientation.FollowRecent,
            DisplayOrientation.LandscapeInverted,
            DisplayOrientation.PortraitInverted,
            DisplayOrientation.AutoRotation,
            DisplayOrientation.AutoRotationLandscape,
            DisplayOrientation.AutoRotationPortrait,
            DisplayOrientation.AutoRotationRestricted,
            DisplayOrientation.AutoRotationLandscapeRestricted,
            DisplayOrientation.AutoRotationPortraitRestricted,
            DisplayOrientation.Locked,
            DisplayOrientation.AutoRotationUnspecified,
            DisplayOrientation.FollowDesktop
        ]
        let enum_LaunchType: Array<LaunchType> = [
            LaunchType.Singleton,
            LaunchType.Multiton,
            LaunchType.Specified
        ]
        let enum_ExtensionAbilityType: Array<ExtensionAbilityType> = [
            ExtensionAbilityType.Form,
            ExtensionAbilityType.WorkScheduler,
            ExtensionAbilityType.InputMethod,
            ExtensionAbilityType.Service,
            ExtensionAbilityType.Accessibility,
            ExtensionAbilityType.DataShare,
            ExtensionAbilityType.FileShare,
            ExtensionAbilityType.StaticSubscriber,
            ExtensionAbilityType.Wallpaper,
            ExtensionAbilityType.Backup,
            ExtensionAbilityType.Window,
            ExtensionAbilityType.EnterpriseAdmin,
            ExtensionAbilityType.Thumbnail,
            ExtensionAbilityType.Preview,
            ExtensionAbilityType.Print,
            ExtensionAbilityType.Share,
            ExtensionAbilityType.Push,
            ExtensionAbilityType.Driver,
            ExtensionAbilityType.Action,
            ExtensionAbilityType.AdsService,
            ExtensionAbilityType.EmbeddedUi,
            ExtensionAbilityType.InsightIntentUi,
            ExtensionAbilityType.Unspecified
        ]
        let enum_ModuleType: Array<ModuleType> = [
            ModuleType.Entry,
            ModuleType.Feature,
            ModuleType.Shared
        ]
        let enum_MultiAppModeType: Array<MultiAppModeType> = [
            MultiAppModeType.Unspecified,
            MultiAppModeType.MultiInstance,
            MultiAppModeType.AppClone
        ]
    }
}
