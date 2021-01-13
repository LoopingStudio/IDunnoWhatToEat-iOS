//
//  ContentView.swift
//  Shared
//
//  Created by Kelian Daste on 13/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var showFavs = false
    @State var showRecipeDetails = false
    @State var randomRecipe: Int = 0
    
    private func getARecipe(){
        let newRecipe = UUID()
        self.randomRecipe = newRecipe.hashValue
    }
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            NavigationView {
                VStack(spacing: 32, content: {
                    Button(action: {
                            getARecipe()
                    }, label: {
                        Text("Get a recipe")
                            .font(.title)
                            .fontWeight(.bold)
                    })
                    if randomRecipe != 0{
                        Text("\(randomRecipe)")
                        Button(action: {
                            self.showRecipeDetails.toggle()
                        }, label: {
                            Text("SHOW DETAILS")
                        })
                    }
                })
                .navigationBarItems(trailing: Button(action: {
                    if randomRecipe != 0 {
                        self.showFavs.toggle()
                    }
                }, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                }))
                .sheet(isPresented: $showFavs, content: {
                    FavouriteMealsView(recipe: $randomRecipe)
                })
                
                .sheet(isPresented: $showRecipeDetails, content: {
                    FavouriteMealsView(recipe: $randomRecipe)
                })
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
