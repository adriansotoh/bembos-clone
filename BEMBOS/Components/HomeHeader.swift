//
//  HomeHeader.swift
//  BEMBOS
//
//  Created by qury on 22/10/22.
//

import SwiftUI

struct HomeHeader: View {
    @State private var isShowingDetailView = false
    var body: some View {
//        NavigationView {
            HStack{
                Image("logo")
                .resizable()
                .frame(width: 150, height: 54)
                Spacer()
//                NavigationLink {
//                    LoginView()
//                } label: {
//                    Image("hamb")
//                        .resizable()
//                        .frame(width: 20, height: 20)
//                }

            }
            .padding(.horizontal,15)
            .padding(.vertical,3)
        }
//    }
}

//struct HomeHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeHeader()
//    }
//}
