//
//  MenuItemsView.swift
//  LittleLemon - dinner menu - SA
//
//  Created by Alex S on 21/04/2024.
//

import SwiftUI

struct MenuItemsView: View {
    @StateObject private var viewModel = MenuViewViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if viewModel.chosenFood {
                    MenuItemView(menuItems: viewModel.foods, ItemType: .food).environmentObject(viewModel)
                }
                if viewModel.chosenDrinks {
                    MenuItemView(menuItems: viewModel.drinks, ItemType: .drink).environmentObject(viewModel)
                }
                if viewModel.chosenDesserts {
                    MenuItemView(menuItems: viewModel.desserts, ItemType: .dessert).environmentObject(viewModel)
                }
            }

            .onAppear() {
                viewModel.renderMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar {
                Button(action: {
                    viewModel.chosenOption.toggle()
                }, label: {
                    Image(systemName: "slider.vertical.3")
                })
            }
            .sheet(isPresented: $viewModel.chosenOption) {
                NavigationStack {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            Button("Done") {
                                viewModel.renderMenuItems()
                                viewModel.chosenOption.toggle()
                            }
                        }
                }
            }
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
