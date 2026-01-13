//
//  DesignerView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 13/01/26.
//

import SwiftUI

struct DesignerView: View {
    
    @ObservedObject var designerData: FilterViewModel
    var onBack: () -> Void
    @State var searchText:String = ""
    
    
    var filteredDesigners: [String] {
            let list = designerData.filterData?.data ?? []
            return searchText.isEmpty
                ? list
                : list.filter {
                    $0.localizedCaseInsensitiveContains(searchText)
                }
        }
    
    var body: some View {
        ZStack{
            Color.appColorBackground
            VStack{
                HeaderLabel(headerLabel: "Designer")
                
                TextField("Search", text: $searchText).frame(maxWidth: .infinity,alignment: .leading)
                    .foregroundColor(.gray)
                    .frame(height: 30)
                    .padding(.horizontal, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                List {
                    ForEach(filteredDesigners, id: \.self) { filter in
                        Text(filter)
                            .font(.custom("Inter", size: 14))
                            .padding(.leading, 10)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                
                
                
            }
        }
    }
}

//#Preview {
//    DesignerView()
//}
