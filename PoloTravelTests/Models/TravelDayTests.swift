//
//  TravelDayTests.swift
//  PoloTravelTests
//
//  Created by SOWA KILLIAN on 09/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import XCTest
@testable import PoloTravel

class TravelDayTests: XCTestCase {
    
    func testInitTravelDay() throws {
        let travelDay = TravelDay(day: Date(timeIntervalSinceReferenceDate: -123456789.0), price: 500,  items: [[
            "type" : "transport",
            "text" : "Rejoins la borne VeloV pour louer ton vélo",
        ]])

        XCTAssertEqual(Date(timeIntervalSinceReferenceDate: -123456789.0), travelDay.day)
        XCTAssertEqual(500, travelDay.price)
        XCTAssertEqual([[
            "type" : "transport",
            "text" : "Rejoins la borne VeloV pour louer ton vélo",
        ]], travelDay.items)
    }
    
}
