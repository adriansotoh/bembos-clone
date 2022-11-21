//
//  ContentView.swift
//  BEMBOS
//
//  Created by qury on 22/10/22.
//

import SwiftUI

struct ContentView: View {
    class BurguerPost: Identifiable {
        let id = UUID()
        var image: String
        var description: String
        var title: String
        var price: String
        
        init(image: String, description: String, title: String, price: String) {
            self.image = image
            self.description = description
            self.title = title
            self.price = price
        }
    }
    
    var burguer1 = BurguerPost(image: "bembos1", description: "Hamburguesa con tocino, salsa blanca, papas al hilo y no me acuerdo que más tiene XD", title: "La Churrita", price: "S/. 18.50")
    var burguer2 = BurguerPost(image: "bembos2", description: "La deliciosa combinación de sabores que te hará sentir de fiesta", title: "La Carnavalera", price: "S/. 6.50")
    var burguer3 = BurguerPost(image: "bembos3", description: "El delicioso sabor de parrilla en combinación con nuestra salsa especial, se te hará agua la boca :D", title: "La Parrillera", price: "S/. 18.50")
    var burguer4 = BurguerPost(image: "bembos1", description: "La dulzura de la piña con nuestra sabrosa carne hará deleitar tu paladar", title: "La Hawaina", price: "S/. 16.20")
    
    var burguerPosts: [BurguerPost] = [
        BurguerPost(image: "bembos1", description: "Hamburguesa con tocino, salsa blanca, papas al hilo y no me acuerdo que más tiene XD", title: "La Churrita", price: "S/. 18.50"),
        BurguerPost(image: "bembos2", description: "La deliciosa combinación de sabores que te hará sentir de fiesta", title: "La Carnavalera", price: "S/. 6.50"),
        BurguerPost(image: "bembos3", description: "El delicioso sabor de parrilla en combinación con nuestra salsa especial, se te hará agua la boca :D", title: "La Parrillera", price: "S/. 18.50"),
        BurguerPost(image: "bembos4", description: "La dulzura de la piña con nuestra sabrosa carne hará deleitar tu paladar", title: "La Hawaina", price: "S/. 6.50")
    ]
    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    HomeHeader()
                    Divider()
                    List(burguerPosts) { burguerPost in
                        ZStack {
                            NavigationLink(destination: BurgerDetail(image: burguerPost.image, title:burguerPost.title, description: burguerPost.description, price: burguerPost.price).navigationBarBackButtonHidden(true)
                                ) {
                                EmptyView()
                            }
                            .opacity(0.0)
                            Post(title: burguerPost.title, image: burguerPost.image, description: burguerPost.description)
                        }
                    }.listStyle(.plain)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
