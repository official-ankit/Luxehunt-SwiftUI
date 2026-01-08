//
//  HomeView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    @State var categoryImage = ["CategoryShoes", "CategoryAccessories", "CategoryBeauty","CategoryShoes", "CategoryAccessories", "CategoryBeauty","CategoryShoes", "CategoryAccessories", "CategoryBeauty"]
    
    
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
                                ForEach(homeViewModel.topTrendingProducts, id: \.id){ topTrendingData in
                                    TrendingDealView(lblBrandName: topTrendingData.product.brand ?? "")
                                }
                            }
                            .padding(.leading, 0)
                        }
                        HeaderLabel(headerLabel: "Shop by feed")
                        HStack(spacing: 5) {
                          NavigationLink(destination: {
                              AllDealsView().navigationBarBackButtonHidden()
                          }, label: {
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
                          })
                            
                            Image("AllDeals")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .clipped()
                        }
                      
                        HeaderLabel(headerLabel: "Shop by category")
                        if (homeViewModel.categoryModel.isEmpty ){
                            ProgressView()
                        } else {
                            LazyVGrid(columns: columns, spacing: 5) {
                                ForEach(Array(homeViewModel.categoryModel.enumerated()),
                                        id: \.element.id) { index, category in
                                    let imageName = categoryImage.indices.contains(index)
                                        ? categoryImage[index]
                                        : "CategoryAccessories"
                                    CategoryView(
                                        category: category,
                                        imgCategory: imageName
                                    )
                                }
                            }

                            
                        }
                    }
                }
            }.padding(.top,20).edgesIgnoringSafeArea(.top)
                .padding(.horizontal,20)
        }
        .onAppear{
            homeViewModel.fetchTopTrendingProducts()
            homeViewModel.fetchCategories()
            
           
        }
    }
}


//#Preview {
//    HomeView()
//}
