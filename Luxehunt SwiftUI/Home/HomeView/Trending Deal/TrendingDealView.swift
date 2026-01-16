//
//  TrendingDealView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct TrendingDealView: View {
    @State var imgTrendingDeal = ""
    @State var lblBrandName = "Addidas"
    @State var lblBrandText = "Java"
    @State var lblOfferPrice = 783.89
    @State var lblPrice = 57.9
    @State var lblDiscount = 567.90
    @State var isLuxePass:Bool = false
    
    var contImageHeight: CGFloat = 184
    var contFrameHeight: CGFloat = 252
    var constFrameWidht: CGFloat = UIScreen.main.bounds.width / 2 - 16
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: imgTrendingDeal)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: constFrameWidht,
                            height: contImageHeight
                        )
                        .clipped()
                    
                        .overlay(content: {
                            if isLuxePass{
                                ZStack{
                                    Color.luxepassBlur
                                    VStack{
                                        Image(systemName: "lock.fill").foregroundColor(.white)
                                        Text("LUXEPASS").font(.custom("PlayfairDisplay-Regular", size: 12))
                                            .foregroundColor(.white)
                                        Text("Premium Access").font(.custom("Inter", size: 10))
                                            .foregroundColor(.white)
                                    }
                                }.frame(width: 110,height: 79)
                                    .cornerRadius(8)
                                
                            }
                            
                        })
                        .overlay(alignment:.topTrailing){
                            VStack(spacing: 8) {
                                Button(action: {
                                    print("Wishlist tapped")
                                }) {
                                    Image(systemName: "heart")
                                        .foregroundColor(.black)
                                        .frame(width: 36, height: 36)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 2)
                                        .padding(.top, 20)
                                        .padding(.trailing,5)
                                }
                                
                                Button(action: {
                                    print("Share tapped")
                                }) {
                                    Image(systemName: "square.and.arrow.up")
                                        .foregroundColor(.black)
                                        .frame(width: 36, height: 36)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .shadow(radius: 2)
                                        .padding(.trailing,5)
                                }
                            }
                        }
                }placeholder: {
                    Color.gray.opacity(0.1)
                        .frame(
                            width: constFrameWidht,
                            height: contImageHeight
                        )
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(lblBrandName)
                        .font(.custom("PlayfairDisplay-Regular", size: 16))
                        .foregroundColor(.black)
                    
                    Text(lblBrandText)
                        .font(.custom("Inter", size: 14))
                        .foregroundColor(.black)
                    
                    HStack(spacing: 6) {
                        Text("$\(lblOfferPrice,specifier: "%.0f")")
                            .font(.custom("Inter", size: 14))
                            .foregroundColor(.gray)
                        
                            .strikethrough()
                        
                        Text("$\(lblPrice, specifier: "%.0f")")
                            .font(.custom("Inter", size: 14))
                            .foregroundColor(.black)
                        
                        
                        Text("-\(lblDiscount, specifier: "%.0f")%")
                            .font(.custom("Inter", size: 14))
                            .padding(.horizontal,5)
                            .foregroundColor(.white).background(Color.black)
                            .cornerRadius(4)
                    }
                }
                .padding(10)
                
                Spacer()
            }
            .frame(width: constFrameWidht, height: contFrameHeight)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
        }
        
    }
}


//#Preview {
//    TrendingDealView()
//}
