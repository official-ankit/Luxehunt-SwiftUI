//
//  HeaderView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct HeaderView: View {
    @State private var search: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            
            // Left Logo
            Image("app-logo-small")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            VStack(alignment: .leading, spacing: 6) {
                NavigationLink(destination: {
                    SearchView().navigationTitle("Search")
                }) {
                    Text("Search").frame(maxWidth: .infinity,alignment: .leading)
                        .foregroundColor(.gray)
                        .frame(height: 30)
                        .padding(.horizontal, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                
                Text("Why pay Retail when you have Luxehunt deals?")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Right Icon
            Image("iconList")
                .resizable()
                .scaledToFit()
                .frame(height: 24)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.white)
    }
}


//#Preview {
//    HeaderView()
//}
