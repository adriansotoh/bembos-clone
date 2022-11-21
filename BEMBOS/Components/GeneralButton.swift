//
//  Button.swift
//  BEMBOS
//
//  Created by qury on 18/11/22.
//

import SwiftUI

struct GeneralButton: View {
    var title: String
    var bgColor: Color
    var textColor: Color
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(textColor)
            .frame(maxWidth: .infinity, maxHeight: 48)
//            .padding()
            .background(bgColor)
            .cornerRadius(12)
    }
}

struct GeneralButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButton(title: "Sign In", bgColor: Color("primary"), textColor: .white)
    }
}
