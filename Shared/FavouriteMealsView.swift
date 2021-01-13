//
//  FavouriteMeals.swift
//  IDunnoWhatToEat
//
//  Created by Kelian Daste on 13/01/2021.
//

import SwiftUI

struct FavouriteMealsView: View {
    
    @Binding var recipe: Int
        
    var body: some View {
        Text("Hello, World! \(recipe)")
    }
}

struct FavouriteMealsView_Previews: PreviewProvider {
    @State static var rec = 12
    static var previews: some View {
        FavouriteMealsView(recipe: $rec)
    }
}
