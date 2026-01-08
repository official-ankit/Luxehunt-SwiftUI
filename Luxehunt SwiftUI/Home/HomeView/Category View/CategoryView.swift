//
//  CategoryView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct CategoryView: View {

    let category: CategoryModel
    let imgCategory: String

    var body: some View {
        ZStack{
            VStack{
                Image(imgCategory).resizable()
                    .scaledToFill()
                    .frame(height: 214)
                    .clipped()
                
            }
            
            Color.black.opacity(0.5)
             } .onAppear {
                 for family in UIFont.familyNames.sorted() {
                     for font in UIFont.fontNames(forFamilyName: family) {
                         if font.lowercased().contains("playfair") {
                             print("FOUND:", font)
                         }
                     }
                 }
             }
        .overlay{
            Text(category.name)
                .font(.custom("PlayfairDisplay-Regular", size: 20))
                 
        }
            }
}
