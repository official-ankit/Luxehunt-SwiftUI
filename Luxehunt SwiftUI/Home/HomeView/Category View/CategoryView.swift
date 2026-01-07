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
        VStack{
            Image(imgCategory).resizable()
                .scaledToFill()
                .frame(height: 214)
                .clipped()
                .opacity(0.5)
        }
        .overlay{
            Text(category.name)
                .font(.custom("PlayfairDisplay-Black", size: 20))
        }
    }
}
