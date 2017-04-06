/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation

open class AppInfo {
    open static var appVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }

    open static var buildNumber: String {
        return Bundle.main.object(forInfoDictionaryKey: String(kCFBundleVersionKey)) as! String
    }

    open static var majorAppVersion: String {
        return appVersion.components(separatedBy: ".").first ?? "0"
    }

    /// Return the shared container identifier (also known as the app group) to be used with for example background
    /// http requests. It is the base bundle identifier with a "group." prefix.
    open static func sharedContainerIdentifier() -> String {
        return "group." + appGroupSuffix()
    }

    /// Return the keychain access group.
    open static func keychainAccessGroupWithPrefix(_ prefix: String) -> String {
        return prefix + "." + appGroupSuffix()
    }

    /// Returns the base string used to append group. and the team identifier to
    /// that is used for the app's entitlements.
    open static func appGroupSuffix() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "MozGroupSuffix") as! String
    }
}
