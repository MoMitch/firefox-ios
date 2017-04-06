/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest

class SettingsTest: BaseTestCase {
    var navigator: Navigator!
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        navigator = createScreenGraph(app).navigator(self)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testHelpOpensSUMOInTab() {
        navigator.goto(SettingsScreen)
        let appsettingstableviewcontrollerTableviewTable = app.tables["AppSettingsTableViewController.tableView"]
        appsettingstableviewcontrollerTableviewTable.staticTexts["Save Logins"].swipeUp()
        // Seems it is necessary some wait here to be able to tap on Help
        sleep(3)
        let helpMenu = appsettingstableviewcontrollerTableviewTable.staticTexts["Help"]
        helpMenu.tap(force: true)

        //waitForValueContains(app.textFields["url"], value: "support.mozilla.org")
        waitforExistence(app.webViews.links["mozilla support"])
        XCTAssertTrue(app.webViews.links["mozilla support"].exists)

        let numTabs = app.buttons["Show Tabs"].value
        XCTAssertEqual("2", numTabs as? String, "Sume should be open in a different tab")
    }
}
