//
//  MenuItemDetailsView.swift
//  LittleLemon - dinner menu - SA
//
//  Created by Alex S on 21/04/2024.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: structMenuItem
    
    var body: some View {
        NavigationStack {
            Image("Little Lemon logo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
            if menuItem.price > 0 {
                VStack {
                    Text("Price:")
                        .fontWeight(.bold)
                    Text(String(format: "%.2f", menuItem.price))
                }
                .padding(1)
            }
            if menuItem.orders > 0 {
                VStack {
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text("\(menuItem.orders)")
                }
                .padding(1)
            }
            if menuItem.ingredient.count > 0 {
                VStack {
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredient, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .padding(1)
            }
            
        }
        .navigationTitle(menuItem.title)
        .padding([.leading, .trailing], 60)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = structMenuItem(price: 11.1, title: "Food " + String(2), category: .food, orders: 1, ingredient: [.pasta])
        MenuItemDetailsView(menuItem: menuItem)
    }
}
