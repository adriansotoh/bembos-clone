//
//  BurgerDetail.swift
//  BEMBOS
//
//  Created by qury on 22/10/22.
//

import SwiftUI
import Firebase

struct RoundedCornersShape: Shape {
   let corners: UIRectCorner
   let radius: CGFloat
    func path(in rect: CGRect) -> Path {
          let path = UIBezierPath(
                        roundedRect: rect,
                        byRoundingCorners: corners,
                        cornerRadii: CGSize(width: radius, height: radius))
          return Path(path.cgPath)
    }
}

class Size: Identifiable {
    let id = UUID()
    var description: String
    
    init(description: String) {
        self.description = description
    }
}

let sizes: [Size] = [Size(description: "PEQUEÑA"),Size(description: "MEDIANA"), Size(description: "GRANDE"), Size(description: "JUNIOR")]

struct BurgerDetail: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let image: String
    let title: String
    let description:String
    let price: String
    var body: some View {
        VStack {
            VStack(alignment: .trailing, spacing: 0.0) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                //                    .frame(height: UIScreen.main.bounds.height * 0.40)
                //                    .overlay(
                //                        VStack(alignment: .leading) {
                //                            Text(description)
                //                            .foregroundColor(.white)
                //                            .padding(8)
                //                            .lineLimit(2)
                //                        }, alignment: .bottomLeading
                //                    )
                    .overlay(
                        HStack {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "chevron.backward.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                            .padding(12), alignment: .top
                    )
            }
            VStack(spacing: 0.0) {
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                        //                        .foregroundColor(.white)
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("primary"))
                        Spacer()
                        Text(price)
                        //                        .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color("primary"))
                    }
                    .padding(.trailing, 5)
                    .padding(.bottom, 1)
                    .foregroundColor(.blue)
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .padding(.bottom, 4)
                }
                .padding(10)
                Divider()
                VStack(alignment: .leading) {
                    Text("Elige el tamaño de tu hamburguesa")
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(sizes){
                                s in
                                VStack {
                                    Text(s.description)
                                }.frame(width: UIScreen.main.bounds.width*0.26)
                                    .padding(.vertical, 5)
                                    .background(Color("primary"))
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                            }
                        }
                    }
                }.padding(10)
                Spacer()
                HStack(alignment: .center) {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 10)
                        Spacer()
                        Text("1")
                            .font(.title2)
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                        }
                        .padding(.trailing, 10)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.44, height: 40)
                    .background(Color("lightBlue"))
                    .cornerRadius(20)
                    Spacer()
                    Button {
//                        print("Presiona")
//                        if(Auth.auth().currentUser?.email != nil){
//                            print(Auth.auth().currentUser?.email ?? "No hay usuario")
//                        } else {
//                            print("Navegar")
//                            NavigationLink(destination: LoginView(), isActive: true, label:{ Text("Login")
//                            })
//                        }
                        
                    } label: {
                        Text("AGREGAR S/. 15.90")
                            .bold()
                            .foregroundColor(Color("primary"))
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.44,height: 40)
                    .background(Color("primaryYellow"))
                    .cornerRadius(20)
                }
                .padding(.horizontal, 10)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.vertical, 15)
                .background(Color("primary"))
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background( RoundedCornersShape(corners: [.topLeft, .topRight], radius: 15)
                .fill(.white))
            .padding(.top, -20)
        }
    }
}

struct BurgerDetail_Previews: PreviewProvider {
    static var previews: some View {
        BurgerDetail(image: "bembos1",title: "La Churrita", description: "Hamburguesa con tocino, salsa blanca, papas al hilo y no me acuerdo que más tiene XD", price: "S/. 18.50")
    }
}
