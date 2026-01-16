//
//  ProfileView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct ProfileView: View {
    let headings = ["Edit Profile", "Change Password", "Notification", "Privacy Police", "Terms & Condition", "Logout"]
    let icon = ["person.circle.fill","lock", "bell.badge.fill", "hand.raised.circle", "theatermasks.circle", "person.circle.fill"]
    
    var body: some View {
        ZStack{
            Color.appColorBackground
            
            VStack(spacing: 10){
                Text("Settings").foregroundColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20)).padding(.bottom, 10)
                ForEach(headings.indices, id: \.self) {heading in
                    ProfileCell(profileHeading: headings[heading],
                                imgGeading: icon[heading]
                    )
                }
                Spacer()
            }.padding(.horizontal,20)
                .padding(.top, 100)
        }.ignoresSafeArea()
       
    }
}

#Preview {
    ProfileView()
}
