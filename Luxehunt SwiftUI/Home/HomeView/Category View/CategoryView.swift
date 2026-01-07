//
//  CategoryView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct CategoryView: View {
    let category: CategoryModel
    
    @State var lblCtaegoryName:String = "Shoes"
    @State var imgCategory:String = "CategoryShoes"
    
    
    var body: some View {
        VStack{
            Image(imgCategory)
        }.frame(height: 214)
        .overlay{
            Text(category.name ?? "")
                .font(.custom("PlayfairDisplay-Black", size: 20))
        }
    }
}


