//
//  FilterAndSortView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterAndSortView: View {
    let sortFilter = ["New", "Low - High", "High - Low"]
    let priceFilter = ["Under $100", "$100 - $250", "$250 - $500", "$500 - $750", "Over $750"]
    let designerFilter = ""
    @StateObject var filterViewModel = FilterViewModel()
    
    let designerColumns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    let priceColumns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                
                Spacer().frame(height: 10)
                HStack{
                    Text("Filter By")
                        .font(.custom("PlayfairDisplay-Regular", size: 20))
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark").foregroundColor(.black)
                    })
                    
                }
                
                ZStack{
                    VStack(alignment: .leading,spacing: 10){
                        FilterHeaderLabel(lblHeader: "Sort By")
                        HStack{
                            ForEach(sortFilter, id: \.self) { filter in
                                FilterCell(filterName: filter)
                            }
                            Spacer()
                            
                        }
                    }.padding(.horizontal,10)
                        .padding(.vertical,20)
                }.overlay(content: {
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
                })
                ZStack{
                    VStack(alignment: .leading,spacing: 10){
                        FilterHeaderLabel(lblHeader: "Designer By")
                        LazyVGrid(columns: designerColumns, spacing: 12) {
                            ForEach(Array(filterViewModel.filterData?.data?.prefix(6) ?? []),
                                    id: \.self) { item in
                                FilterCell(filterName: item)
                            }
                        }
                        HStack{
                            Spacer()
                            Text("See more").font(.custom("Inter", size: 16))
                                .foregroundColor(.gray)
                        }
                        
                        
                    }.padding(.horizontal,10)
                        .padding(.vertical,20)
                }.overlay(content: {
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
                })
                ZStack{
                    VStack(alignment: .leading,spacing: 10){
                        FilterHeaderLabel(lblHeader: "Price By")
                        HStack{
                            LazyVGrid(columns: priceColumns, spacing: 12) {
                                ForEach(priceFilter, id: \.self) { filter in
                                    FilterCell(filterName: filter)
                                }
                                Spacer()
                                
                            }
                        }
                    }.padding(.horizontal,10)
                        .padding(.vertical,20)
                }.overlay(content: {
                    RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1)
                })
                
                Spacer()
                
            }.padding(.horizontal,20)
                .onAppear{
                    filterViewModel.postRequestBrnad()
                }
            
        }
    }
}

//#Preview {
//    FilterAndSortView()
//}
