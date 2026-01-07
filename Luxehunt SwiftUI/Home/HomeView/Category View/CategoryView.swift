//
//  CategoryView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct CategoryView: View {
    @State var lblCtaegoryName:String = "Shoes"
    @State var imgCategory:String = "CategoryShoes"
    
    
    var body: some View {
        VStack{
            Image(imgCategory)
        }.frame(height: 214)
        .overlay{
            Text(lblCtaegoryName)
                .font(.custom("PlayfairDisplay-Black", size: 20))
        }
    }
}

#Preview {
    CategoryView()
}
