//
//  HomeView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @State var btnMenu:Bool = false
    @State private var currentIndex = 0
    @State var selectCat = ""
    @State var isNavigate:Bool = false
    @State var isNavigateTrending:Bool = false
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
                HeaderView(btnMenu: $btnMenu).padding(.top,20)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        
                            
                        
                        
                        TabView(selection: $currentIndex) {
                            if homeViewModel.allBannerData.isEmpty{
                                ShimmerView()
                            }else{
                                ForEach(Array(homeViewModel.allBannerData.enumerated()), id: \.element.id) { index, item in
                                    TopBigImageView(imgBanner: item.image ?? "")
                                        .tag(index)
                                        .padding(.horizontal, 0)
                                }

                            }
                        }.cornerRadius(8)
                        .frame(height: 490)
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        HeaderLabel(headerLabel: "Top Trending")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                if homeViewModel.allBannerData.isEmpty{
                                    ForEach(0..<4, id: \.self){ _ in
                                        TrendingDealShimmerView(width: UIScreen.main.bounds.width / 2.8,
                                                                imageHeight: 184,
                                                                totalHeight: 252
                                        )
                                        
                                    }
                                }else{
                                ForEach(homeViewModel.topTrendingProducts, id: \.id){ topTrendingData in
                                    NavigationLink(destination: {
                                        WebView(data: topTrendingData.product)
                                    }, label: {
                                        TrendingDealView(imgTrendingDeal: topTrendingData.product.image ?? "", lblBrandName: topTrendingData.product.brand ?? "",lblBrandText: topTrendingData.product.title ?? "",isLuxePass: topTrendingData.product.luxepass_only ?? false, constFrameWidht: CGFloat(Int(UIScreen.main.bounds.width / 2.8)) )
                                    })
                                    
                                }
                            }
                            }
                            .padding(.leading, 0)
                        }
                        HeaderLabel(headerLabel: "Shop by feed")
                        HStack(spacing: 0) {
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
                                              .blur(radius: 12)
                                          HStack{
                                              Image(systemName: "person.2")
                                                  .tint(.white)
                                              Text("Created Deals")
                                                  .font(.custom("PlayfairDisplay-Black", size: 12))
                                                  .foregroundColor(.white)
                                          }
                                      }.frame(height: 44)
                                          .padding(.horizontal, 10)
                                  }
                          })
                            
                            Image("LuxePass")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity)
                                .blur(radius:1.0)
                                .overlay(){
                                    ZStack{
                                        Color.luxepassBG
                                        HStack{
                                            Image(systemName: "lock")
                                                .tint(.white)
                                           
                                            Text("Luxe Pass Only")
                                                .font(.custom("PlayfairDisplay-Black", size: 12))
                                                .foregroundColor(.white)
                                        }
                                    }.frame(height: 44)
                                        .padding(.horizontal, 10)
                                 
                                }
                        }.cornerRadius(10)
                        
                      
                        HeaderLabel(headerLabel: "Shop by category")
                            LazyVGrid(columns: columns, spacing: 5) {
                                if homeViewModel.categoryModel.isEmpty{
                                    
                                }else{
                                    ForEach(Array(homeViewModel.categoryModel.enumerated()),
                                            id: \.element.id) { index, category in
                                        let imageName = categoryImage.indices.contains(index)
                                            ? categoryImage[index]
                                            : "CategoryAccessories"
                                        CategoryView(
                                            category: category,
                                            imgCategory: imageName
                                        
                                        ).onTapGesture {
                                            selectCat = category.name
                                            isNavigate.toggle()
                                        }
                                    }
                                }
                                
                            }

                            
                        
                    }
                }
            }.padding(.top,20).edgesIgnoringSafeArea(.top)
                .padding(.horizontal,20)
            
            
            NavigationLink(isActive: $isNavigate, destination: {AllDealsView(selectCat: selectCat).navigationBarBackButtonHidden()}, label: {
                EmptyView()
            })
            
            
            if btnMenu{
                SidebarView()
            }
        }
        .onAppear{
                homeViewModel.fetchAllBanner()
                homeViewModel.fetchTopTrendingProducts()
                homeViewModel.fetchCategories()
            Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
                guard !homeViewModel.allBannerData.isEmpty else { return }
                
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
struct SidebarView:View {
    
    var body: some View {
        
        ZStack{
            Color.black.opacity(0.5)
            VStack(alignment: .leading){
               
                HStack{
                    VStack{
                        Text("First Menu").foregroundColor(Color.white)
                    }.frame(maxWidth: UIScreen.main.bounds.width/1.8).frame(maxHeight:.infinity).background(Color.white)
                    Spacer()
                    VStack{
                        
                    }
                }
            }
        }.ignoresSafeArea()
    }
}
