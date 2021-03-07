//
//  macCANableUITests.swift
//  macCANableUITests
//
//  Created by Robert Huston on 3/6/21.
//  Copyright © 2021 Pinpoint Dynamics, LLC. All rights reserved.
//

import XCTest

class macCANableUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
    
    // MARK: - ID Field
    
    func testIDFieldLeftPadsShortValue() throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_ID"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("7f\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "07F")
    }
    
    func testIDFieldSetsEmptyFieldTo000() throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_ID"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "000")
    }
    
    func testIDFieldRejectsInvalidCharacters() throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_ID"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("2xyz\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "002")
    }
    
    func testIDFieldConstrainsToElevenBits() throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_ID"]
        textField.doubleClick()
        textField.typeText("9ff\r")
        
        untitledWindow.sheets["alert"].buttons["OK"].click()
        
        let value = textField.value as! String
        XCTAssertEqual(value, "1FF")
    }
    
    // MARK: - D0 Field
    
    func testD0FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D0")
    }
    
    func testD0FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D0")
    }
    
    func testD0FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D0")
    }
    
    // MARK: - D1 Field
    
    func testD1FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D1")
    }
    
    func testD1FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D1")
    }
    
    func testD1FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D1")
    }
    
    // MARK: - D2 Field
    
    func testD2FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D2")
    }
    
    func testD2FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D2")
    }
    
    func testD2FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D2")
    }
    
    // MARK: - D3 Field
    
    func testD3FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D3")
    }
    
    func testD3FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D3")
    }
    
    func testD3FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D3")
    }
    
    // MARK: - D4 Field
    
    func testD4FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D4")
    }
    
    func testD4FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D4")
    }
    
    func testD4FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D4")
    }
    
    // MARK: - D5 Field
    
    func testD5FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D5")
    }
    
    func testD5FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D5")
    }
    
    func testD5FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D5")
    }
    
    // MARK: - D6 Field
    
    func testD6FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D6")
    }
    
    func testD6FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D6")
    }
    
    func testD6FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D6")
    }
    
    // MARK: - D7 Field
    
    func testD7FieldLeftPadsShortValue() throws {
        try helper_testDataFieldLeftPadsShortValue(dataField: "D7")
    }
    
    func testD7FieldSetsEmptyFieldTo00() throws {
        try helper_testDataFieldSetsEmptyFieldTo00(dataField: "D7")
    }
    
    func testD7FieldRejectsInvalidCharacters() throws {
        try helper_testDataFieldRejectsInvalidCharacters(dataField: "D7")
    }
    
    // MARK: - Data Field Test Helpers
    
    func helper_testDataFieldLeftPadsShortValue(dataField: String) throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_\(dataField)"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("F\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "0F")
    }
    
    func helper_testDataFieldSetsEmptyFieldTo00(dataField: String) throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_\(dataField)"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "00")
    }
    
    func helper_testDataFieldRejectsInvalidCharacters(dataField: String) throws {
        let untitledWindow = app.windows["Untitled"]
        let textField = untitledWindow.textFields["field_\(dataField)"]
        textField.doubleClick()
        textField.typeKey(.delete, modifierFlags:[])
        textField.typeText("2xyz\r")
        
        let value = textField.value as! String
        XCTAssertEqual(value, "02")
    }

}
