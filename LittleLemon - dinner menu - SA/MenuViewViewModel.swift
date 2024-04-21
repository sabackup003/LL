//
//  File.swift
//  LittleLemon - dinner menu - SA
//
//  Created by Alex S on 21/04/2024.
//

import Foundation


protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var category: enumCategory { get }
    var orders: Int { get set }
    var ingredient: [enumIngredient] { get set }
}

enum enumIngredient: String, CaseIterable {

    case spinach = "Spinach"
    case broccoli = "Broccoli"
    case carrot = "Carrot"
    case pasta = "Pasta"
    case tomatoSauce = "Tomato sauce"
    case vodka = "Vodka"
    case rum = "Rum"
    case gin = "Gin"
    case tequila = "Tequila"
    case chocolate = "Chocolate"
    case whippedCream = "Whipped Cream"
}

enum enumCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case dessert = "Dessert"
}

struct structMenuItem: Identifiable, Hashable, MenuItemProtocol {
    var id = UUID()
    var price: Double
    var title: String
    var category: enumCategory
    var orders: Int
    var ingredient: [enumIngredient]
    
}

enum enumSortBy: String, CaseIterable {
    case Popularity = "Most popular"
    case Price = "Price $-$$$"
    case AtoZ = "A-Z"
}

class MenuViewViewModel: ObservableObject {
    // foods
    @Published var foods: [structMenuItem] = [
        structMenuItem(price: 11, title: "Food " + String(1), category: .food, orders: 1, ingredient: [.spinach, .pasta, .broccoli]),
        structMenuItem(price: 11, title: "Food " + String(2), category: .food, orders: 1, ingredient: [.tomatoSauce, .pasta, .broccoli]),
        structMenuItem(price: 11, title: "Food " + String(3), category: .food, orders: 1, ingredient: [.pasta, .broccoli]),
        structMenuItem(price: 11, title: "Food " + String(4), category: .food, orders: 1, ingredient: [.carrot, .carrot, .tomatoSauce]),
        structMenuItem(price: 11, title: "Food " + String(5), category: .food, orders: 1, ingredient: [.tomatoSauce]),
        structMenuItem(price: 12, title: "Food " + String(6), category: .food, orders: 1, ingredient: [.tomatoSauce, .pasta]),
        structMenuItem(price: 11.1, title: "Food " + String(7), category: .food, orders: 1, ingredient: [.tomatoSauce, .pasta, .tomatoSauce]),
        structMenuItem(price: 11, title: "Food " + String(8), category: .food, orders: 1, ingredient: [.pasta, .tomatoSauce]),
        structMenuItem(price: 11, title: "Food " + String(9), category: .food, orders: 1, ingredient: [.pasta,.carrot]),
        structMenuItem(price: 11, title: "Food " + String(10), category: .food, orders: 1, ingredient: [.pasta]),
        structMenuItem(price: 11, title: "Food " + String(11), category: .food, orders: 1, ingredient: [.pasta]),
        structMenuItem(price: 11, title: "Food " + String(12), category: .food, orders: 1, ingredient: [.carrot, .tomatoSauce])
    ]
    
    
    // drinks
    @Published var drinks: [structMenuItem] = [
        structMenuItem(price: 11, title: "Dring " + String(1), category: .drink, orders: 1, ingredient: [.vodka, .rum, .gin]),
        structMenuItem(price: 1, title: "Dring " + String(3), category: .drink, orders: 1, ingredient: [.tequila]),
        structMenuItem(price: 1, title: "Dring " + String(2), category: .drink, orders: 1, ingredient: [.tequila]),
        structMenuItem(price: 5, title: "Dring " + String(4), category: .drink, orders: 1, ingredient: [.tequila]),
        structMenuItem(price: 6.0, title: "Dring " + String(5), category: .drink, orders: 1, ingredient: [.tequila]),
        structMenuItem(price: 6.0, title: "Dring " + String(6), category: .drink, orders: 1, ingredient: [.tequila]),
        structMenuItem(price: 5.0, title: "Dring " + String(7), category: .drink, orders: 2, ingredient: [.vodka]),
        structMenuItem(price: 5.0, title: "Dring " + String(8), category: .drink, orders: 1, ingredient: [.gin])
    ]
    // desserts
    @Published var desserts: [structMenuItem] = [
        structMenuItem(price: 1.0, title: "Dessert " + String(1), category: .dessert, orders: 1, ingredient: [.chocolate]),
        structMenuItem(price: 10.0, title: "Dessert " + String(2), category: .dessert, orders: 1, ingredient: [.chocolate, .whippedCream ]),
        structMenuItem(price: 5.0, title: "Dessert " + String(4), category: .dessert, orders: 0, ingredient: [.whippedCream,]),
        structMenuItem(price: 5.0, title: "Dessert " + String(3), category: .dessert, orders: 0, ingredient: [.whippedCream])
    ]
    
    
    @Published var chosenOption = false
    @Published var chosenFood = true
    @Published var chosenDrinks = true
    @Published var chosenDesserts = true
    @Published var sortOrder = enumSortBy.AtoZ

    
    
    func renderMenuItems() {
        switch sortOrder {
            case .Popularity:
                sortItems { $0.orders > $1.orders }
            case .Price:
                sortItems { $0.price < $1.price }
            case .AtoZ:
                sortItems { sortByTitle(a: $0, b: $1) }
        }
    }

    func sortItems(by comparator: (structMenuItem, structMenuItem) -> Bool) {
        foods.sort(by: comparator)
        drinks.sort(by: comparator)
        desserts.sort(by: comparator)
    }

    func sortByTitle(a: structMenuItem, b: structMenuItem) -> Bool {
        let aTitleParts = a.title.split(separator: " ")
        let bTitleParts = b.title.split(separator: " ")
        let aNumber = Int(aTitleParts[aTitleParts.count - 1]) ?? 0
        let bNumber = Int(bTitleParts[bTitleParts.count - 1]) ?? 0
        
        if aNumber != bNumber {
            return aNumber < bNumber
        } else {
            return a.title < b.title
        }
    }


    
    
}


