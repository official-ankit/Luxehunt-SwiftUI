//
//  ProfileCell.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 16/01/26.
//

import SwiftUI

struct ProfileCell: View {
    @State var profileHeading:String = "Edit Profile"
    @State var imgGeading = "person.circle.fill"
    var body: some View {
        ZStack{
            Color.white
            HStack{
                Image(systemName: imgGeading).foregroundColor(.black).padding(.leading, 8)
                Text(profileHeading).foregroundColor(.black).font(.custom("Inter", size: 16))
                Spacer()
                Image(systemName: "greaterthan").foregroundColor(.black).padding(.trailing, 8)
            }
        }.frame(height: 50)
    }
}


