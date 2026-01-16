//
//  FilterAndSortView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterAndSortView: View {
    @ObservedObject var dealViewModel: DealsViewModel
    @State var selectCat = ""
    
    let sortFilter = ["New", "Low - High", "High - Low"]
    let priceFilter = ["Under $100", "$100 - $250", "$250 - $500", "$500 - $750", "Over $750"]
    let designerFilter = ""
    @StateObject var filterViewModel = FilterViewModel()
    @Binding var isDismiss:Bool
    @State private var showDesignerView = false
    @State private var selectedSort: String? = nil
    @State private var selectedPrices: Set<String> = []
    @State private var selectedDesigner: String? = nil
    
    
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
            Color.appColorBackground
            VStack(alignment: .leading,spacing: 10){
                
                Spacer().frame(height: 10)
                HStack{
                    Text("Filter By")
                        .font(.custom("PlayfairDisplay-Regular", size: 20))
                    Spacer()
                    Button(action: {
                        isDismiss.toggle()
                    }, label: {
                        Image(systemName: "xmark").foregroundColor(.black)
                    })
                    
                }
                
                if showDesignerView {
                    DesignerView(
                        designerData: filterViewModel,
                        onBack: {
                            showDesignerView = false
                        }
                    )
                } else {
                    ZStack{
                        VStack(alignment: .leading,spacing: 10){
                            FilterHeaderLabel(lblHeader: "Sort By")
                            HStack{
                                ForEach(sortFilter, id: \.self) { filter in
                                    FilterCell(filterName: filter, isSelectedFilter: selectedSort == filter)
                                        .onTapGesture {
                                            selectedSort = filter
                                            
                                            print("Sort selected:", filter)
                                        }
                                }
                                Spacer()
                                
                            }
                        }.padding(.horizontal,10)
                            .padding(.vertical,20)
                    }.overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.salesLabel, lineWidth: 1)
                    })
                    ZStack{
                        VStack(alignment: .leading,spacing: 10){
                            FilterHeaderLabel(lblHeader: "Designer By")
                            LazyVGrid(columns: designerColumns, spacing: 12) {
                                ForEach(Array(filterViewModel.filterData?.data?.prefix(6) ?? []),
                                        id: \.self) { item in
                                    FilterCell(filterName: item, isSelectedFilter: selectedDesigner == item)
                                        .onTapGesture {
                                            selectedDesigner = item
                                            print("Designer selected:", item)
                                        }
                                }
                            }
                            HStack{
                                Spacer()
                                Button(action: {
                                    showDesignerView = true
                                }, label: {
                                    Text("See more").font(.custom("Inter", size: 16))
                                        .foregroundColor(.gray)
                                })
                                
                            }
                            
                            
                        }.padding(.horizontal,10)
                            .padding(.vertical,20)
                    }.overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.salesLabel, lineWidth: 1)
                    })
                    ZStack{
                        VStack(alignment: .leading,spacing: 10){
                            FilterHeaderLabel(lblHeader: "Price By")
                            HStack{
                                LazyVGrid(columns: priceColumns, spacing: 12) {
                                    ForEach(priceFilter, id: \.self) { filter in
                                        FilterCell(filterName: filter,
                                                   isSelectedFilter: selectedPrices.contains(filter))
                                        .onTapGesture {
                                            if selectedPrices.contains(filter) {
                                                selectedPrices.remove(filter)   // deselect
                                            } else {
                                                selectedPrices.insert(filter)   // select
                                            }
                                        }
                                    }
                                    Spacer()
                                    
                                }
                            }
                        }.padding(.horizontal,10)
                            .padding(.vertical,20)
                    }.overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.salesLabel, lineWidth: 1)
                    })
                }
                HStack {
                    Spacer()
                    Button(action: {
                        dealViewModel.resetAllFilters()
                        isDismiss.toggle()
                    }, label: {
                        Text("Reset Filter")
                            .foregroundColor(.black)
                            .font(.custom("Intel", size: 14))
                            .padding(.horizontal, 10)
                            .frame(height: 45)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    })
                    
                    Button(action: {
                        dealViewModel.applyFilters(category: selectCat, search: nil, sortBrand: nil, sortPrice: mapSortToAPI(selectedSort), priceRanges: mapPricesToAPI(selectedPrices))
                        isDismiss.toggle()
                        
                    }, label: {
                        Text("Apply Filter")
                            .foregroundColor(.white)
                            .font(.custom("Intel", size: 14))
                            .padding(.horizontal, 10)
                            .frame(height: 45)
                            .background(Color.black)
                            .cornerRadius(4)
                    })
                }
                .frame(height: 45)
                Spacer()
            }.padding(.horizontal,20)
                .onAppear{
                    filterViewModel.postRequestBrnad()
                }  
        }
    }
    private func mapSortToAPI(_ sort: String?) -> String? {
        switch sort {
        case "Low - High":
            return "lowtohigh"
        case "High - Low":
            return "hightolow"
        case "New":
            return "new"
        default:
            return nil
        }
    }
    private func mapPricesToAPI(_ prices: Set<String>) -> [String] {

        let ranges: [[String: Int]] = prices.compactMap { price in
            switch price {
            case "Under $100":
                return ["$lte": 100]

            case "$100 - $250":
                return ["$gte": 100, "$lte": 250]

            case "$250 - $500":
                return ["$gte": 250, "$lte": 500]

            case "$500 - $750":
                return ["$gte": 500, "$lte": 750]

            case "Over $750":
                return ["$gte": 750]

            default:
                return nil
            }
        }

        guard let jsonData = try? JSONSerialization.data(withJSONObject: ranges),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            return []
        }

        return [jsonString]
    }

    
}

//#Preview {
//    FilterAndSortView()
//}
