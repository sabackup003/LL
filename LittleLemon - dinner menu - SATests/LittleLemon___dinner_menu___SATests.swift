//
//  LittleLemon___dinner_menu___SATests.swift
//  LittleLemon - dinner menu - SATests
//
//  Created by Alex S on 21/04/2024.
//

import XCTest
@testable import LittleLemon___dinner_menu___SA


final class LittleLemon___dinner_menu___SATests: XCTestCase {

    func test_checkFoodTitle() {
        let foodTitle = MenuViewViewModel().foods[4]
        XCTAssertEqual(foodTitle.title, "Food 5")
    }
    
    func test_checkIngredient() {
        let ingr = MenuViewViewModel().foods[5]
        XCTAssertEqual(ingr.ingredient, [.tomatoSauce, .pasta])
    }

}
