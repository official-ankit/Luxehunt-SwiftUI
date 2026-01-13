//
//  SalesView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct SalesView: View {
    @StateObject var viewModel = SalesViewModel()
    @State var btnMenu = false
    var body: some View {
        ZStack{
            Color.appColorBackground
            VStack{
                HeaderView(btnMenu:$btnMenu)
                List{
                    ForEach(viewModel.salesData, id: \.id) { item in
                        SalesCell(lblsalesHeading: item.head ?? "", lblsalesSubHeading: item.title)
                            .listRowSeparator(.hidden)
                    }
                }.listStyle(.plain)
            }.onAppear{
                    viewModel.fetchSalesList()
                }
            }
    }
}

//#Preview {
//    SalesView()
//}
