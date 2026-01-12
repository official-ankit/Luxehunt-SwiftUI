//
//  FilterAndSortView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterAndSortView: View {
    let sortFilter = ["New", "Low - High", "High - Low"]
    let designerFilter = ""
    @StateObject var filterViewModel = FilterViewModel()
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                
                Spacer().frame(height: 20)
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
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(filterViewModel.filterData?.data ?? [], id: \.self) { item in
                                    FilterCell(filterName: item)
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
