//
//  HomeView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct HomeView: View {
    var homeViewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ZStack {
            Color.appColorBackground
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HeaderView()
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        TopBigImageView()
                        HeaderLabel(headerLabel: "Top Trending")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(0..<10) { _ in
                                    TrendingDealView()
                                }
                            }
                            .padding(.leading, 0)
                        }
                        HeaderLabel(headerLabel: "Shop by feed")
                        HStack(spacing: 5) {
                            Image("AllDeals")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .overlay(){
                                    ZStack{
                                        Color.appColorAllDealsBg
                                        HStack{
                                            Image(systemName: "person.2")
                                            Text("Created Deals")
                                                .font(.custom("PlayfairDisplay-Black", size: 12))
                                        }
                                    }.frame(height: 44)
                                        .padding(.horizontal, 10)
                                }
                            Image("AllDeals")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .clipped()
                        }
                      
                        HeaderLabel(headerLabel: "Shop by category")
                        if homeViewModel.categoryModel.isEmpty {
                            ProgressView()
                        } else {
                            LazyVGrid(columns: columns, spacing: 5) {
//                                ForEach(homeViewModel.categoryModel, id: \.id) { category in
//                                    CategoryView(category: category)
//                                }
                            }
                        }

//                        .padding(.horizontal, 5)
                    }
                }
            }.padding(.top,20).edgesIgnoringSafeArea(.top)
                .padding(.horizontal,20)
        }
        .onAppear{
            homeViewModel.fetchCategories()
        }
    }
}


#Preview {
    HomeView()
}
