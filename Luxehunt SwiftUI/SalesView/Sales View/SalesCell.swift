//
//  SalesCell.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 09/01/26.
//

import SwiftUI

struct SalesCell: View {
    @StateObject var viewModel = SalesViewModel()
    
    @State var lblsalesHeading:String = "Moda Operandi Private Sale"
    @State var lblsalesSubHeading:String = "Code: MODAVIP40"
    
    
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .center){
                Text(lblsalesHeading).foregroundColor(Color.salesLabel)
                    .font(.custom("PlayfairDisplay-Regular", size: 20))
                
                    .padding(.top,0)
                    .padding(.bottom,5)
                    .padding(.horizontal,10)
                Text(lblsalesSubHeading)
                    .font(.custom("PlayfairDisplay-Regular", size: 16))
                    .padding(.top,0)
                    .padding(.bottom,5)
                    .padding(.horizontal,10)
                Divider().padding(.vertical, 0)
            }
        }.frame(height: 50)
    }
}

#Preview {
    SalesCell()
}
