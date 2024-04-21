//
//  MenuItemsOptionView.swift
//  LittleLemon - dinner menu - SA
//
//  Created by Alex S on 21/04/2024.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section("Selected menu item type") {
                    Toggle(enumCategory.food.rawValue, isOn: $viewModel.chosenFood)
                    Toggle(enumCategory.drink.rawValue, isOn: $viewModel.chosenDrinks)
                    Toggle(enumCategory.dessert.rawValue, isOn: $viewModel.chosenDesserts)
                }
                Picker("Sort by", selection: $viewModel.sortOrder) {
                    ForEach(enumSortBy.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
            .pickerStyle(.inline)
            .listStyle(.grouped)
        }
        .navigationTitle("Filter")
    }
}


struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView().environmentObject(MenuViewViewModel())
    }
}

