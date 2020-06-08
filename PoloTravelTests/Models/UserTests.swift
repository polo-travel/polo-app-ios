//
//  UserTests.swift
//  PoloTravelTests
//
//  Created by SOWA KILLIAN on 08/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import XCTest
@testable import PoloTravel

class UserTests: XCTestCase {
    
    func testInitUser() throws {
        let user = User(firstName: "Jack", lastName: "Maubert", uid: "xkenz450S", email: "jackm@gmail.com")

        XCTAssertEqual("Jack", user.firstName)
        XCTAssertEqual("Maubert", user.lastName)
        XCTAssertEqual("xkenz450S", user.uid)
        XCTAssertEqual("jackm@gmail.com", user.email)
    }
    
}
