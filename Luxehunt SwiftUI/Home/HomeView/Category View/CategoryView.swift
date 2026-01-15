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
                    .frame(height: 214)
                
            }
            
            Color.black.opacity(0.5)
             }.cornerRadius(8)
        .overlay{
            Text(category.name)
                .font(.custom("PlayfairDisplay-Regular", size: 26))
                .foregroundColor(.white)
                 
        }
            }
}
