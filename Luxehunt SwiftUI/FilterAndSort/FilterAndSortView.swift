//
//  FilterAndSortView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterAndSortView: View {
    let filters = ["New", "Low - High", "High - Low"]
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 10){
                
                Spacer().frame(height: 20)
                
                    FilterHeaderLabel(lblHeader: "Sort By")
              
                    HStack{
                        ForEach(filters, id: \.self) { filter in
                            FilterCell(filterName: filter)
                        }
                        Spacer()
                    
                }
            
                Spacer()
            }.padding(.horizontal,20)
            
        }
    }
}

//#Preview {
//    FilterAndSortView()
//}
