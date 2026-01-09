//
//  HomeView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State private var currentIndex = 0
    
    @State var categoryImage = ["CategoryShoes", "CategoryAccessories", "CategoryBeauty","CategoryShoes", "CategoryAccessories", "CategoryBeauty","CategoryShoes", "CategoryAccessories", "CategoryBeauty"]
    
    
    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    var body: some View {
        ZStack {
            Color.appColorBackground
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HeaderView()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                        TabView(selection: $currentIndex) {
                            ForEach(Array(homeViewModel.allBannerData.enumerated()), id: \.element.id) { index, item in
                                TopBigImageView(imgBanner: item.image ?? "")
                                    .tag(index)
                                    .padding(.horizontal, 0)
                            }
                        }.cornerRadius(8)
                        .frame(height: 490)
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        HeaderLabel(headerLabel: "Top Trending")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(homeViewModel.topTrendingProducts, id: \.id){ topTrendingData in
                                    
                                    TrendingDealView(imgTrendingDeal: topTrendingData.product.image ?? "", lblBrandName: topTrendingData.product.brand ?? "", constFrameWidht: CGFloat(Int(UIScreen.main.bounds.width / 2.8)) )
                                }
                            }
                            .padding(.leading, 0)
                        }
                        HeaderLabel(headerLabel: "Shop by feed")
                        HStack() {
                          NavigationLink(destination: {
                              AllDealsView()//.navigationBarBackButtonHidden()
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
                        }.cornerRadius(10)
                      
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
                homeViewModel.fetchAllBanner()
                homeViewModel.fetchTopTrendingProducts()
                homeViewModel.fetchCategories()
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                   withAnimation {
                       currentIndex = (currentIndex + 1) % homeViewModel.allBannerData.count
                   }
               }
         
            
           
        }
    }
}


//#Preview {
//    HomeView()
//}
