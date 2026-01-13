//
//  AllDealsView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//

import SwiftUI

struct AllDealsView: View {
    
    @StateObject var dealViewModel = DealsViewModel()
    @State var search = ""
    @State var openFilterSheet:Bool = false
   

    @Environment(\.dismiss) var dismiss
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color.appColorBackground
            VStack(spacing: 10){
                Color.white.frame(height:1)
                HStack(spacing: 10){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 18))
                            .tint(.black)
                    })
                    
                    TextField("Search", text: $search)
                        .frame(height: 30)
                        .padding(.leading, 10)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
                            
                        })
                }
                HStack(spacing: 0){
                   
                   
                        ZStack{
                            Color.black
                            HStack{
                                Image(systemName: "person.2")
                                    .foregroundColor(.white)
                                
                                Text("All Deals")
                                    .font(.custom("Inter", size: 14))
                                    .foregroundColor(.white)
                            }
                        }.onTapGesture {
                            print("All deals button pressed")
                        }
                
                  
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color("#F7EF8A"),
                                Color("#EDC967"),
                                Color("#D2AC47"),
                                Color("#AE8625")
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        HStack{
                            Image(systemName: "lock")
                                .foregroundColor(.white)
                            
                            Text("Luxe Pass Only")
                                .font(.custom("Inter", size: 14))
                                .foregroundColor(.white)
                        }
                    }.onTapGesture {
                        
                    }
                }.frame(height: 50)
                    .cornerRadius(5)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(dealViewModel.products, id: \.id) { item in
                            TrendingDealView(
                                imgTrendingDeal: item.image,
                                lblBrandName: item.brand,
                                contImageHeight: 280,
                                contFrameHeight: 352
                            )
                            .onAppear {
                                if item.id == dealViewModel.products.last?.id {
                                    dealViewModel.fetchDealList()
                                }
                            }
                        }
                        if dealViewModel.isLoading {
                            ProgressView()
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 4)
                }
                .onAppear {
                    dealViewModel.fetchDealList()
                }
                ZStack{
                    Color.white
                    HStack(alignment: .center){
                       Button(action: {
                           openFilterSheet = true
                       },
                              label: {
                           Image(systemName: "line.3.horizontal.decrease").foregroundColor(.black)
                           Text("Filter and Sort")
                       })
                        
                    }
                    
                }.frame(height: 50)
                
            }.padding(.horizontal, 8)
            if openFilterSheet{
                Color.black.opacity(0.5).ignoresSafeArea()
            }
        }.sheet(isPresented: $openFilterSheet, content: {
            FilterAndSortView(isDismiss: $openFilterSheet)
        })
    }
}


//#Preview {
//    AllDealsView()
//}





extension Color {
    init(_ hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        
        let r, g, b: UInt64
        switch hex.count {
        case 6: // RGB
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }
}
