//
//  PostContent.swift
//  BEMBOS
//
//  Created by qury on 22/10/22.
//

import SwiftUI

struct PostContent: View {
    var image:String = "bembos1"
    var body: some View {
        
        VStack {
            Image(image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width )
                .frame(height: UIScreen.main.bounds.height/4)
                .cornerRadius(10)
            
                
            }
        .shadow(color: .black.opacity(0.6), radius: 20, x:0, y:0)
            .overlay (
                HStack {
                    Text("La churrita")
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    ZStack {
                        Image("cart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .cornerRadius(5)
                            .border(.white)
                            .cornerRadius(10)
                    }
                    .frame(width: 25, height: 25)
                    .background(.yellow)
                }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 5),
                    alignment: .bottomLeading)
        }
    
        
       
    }
