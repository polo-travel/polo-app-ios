//
//  TravelTests.swift
//  PoloTravelTests
//
//  Created by SOWA KILLIAN on 09/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import XCTest
@testable import PoloTravel

class TravelTests: XCTestCase {
    
    func testInitTravel() throws {
        let travel = Travel(startDate: Date(timeIntervalSinceReferenceDate: -123456789.0), endDate: Date(timeIntervalSinceReferenceDate: -123456789.0), price: 500, travelGear: ["Sac à dos", "Chaussures de randonnées"], daysDatas: [TravelDay(day: Date(timeIntervalSinceReferenceDate: -123456789.0), price: 200, items: [[
            "type" : "transport",
            "text" : "Rejoins la borne VeloV pour louer ton vélo",
        ]])])

        XCTAssertEqual(Date(timeIntervalSinceReferenceDate: -123456789.0), travel.startDate)
        XCTAssertEqual(Date(timeIntervalSinceReferenceDate: -123456789.0), travel.endDate)
        XCTAssertEqual(500, travel.price)
        XCTAssertEqual(["Sac à dos", "Chaussures de randonnées"], travel.travelGear)
        XCTAssertEqual([TravelDay(day: Date(timeIntervalSinceReferenceDate: -123456789.0), price: 200, items: [[
            "type" : "transport",
            "text" : "Rejoins la borne VeloV pour louer ton vélo",
        ]])], travel.daysDatas)
    }
    
}
