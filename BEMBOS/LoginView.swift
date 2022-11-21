//
//  LoginView.swift
//  BEMBOS
//
//  Created by qury on 18/11/22.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var screenHeight = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            VStack {
                Text("Bienvenido a Bembos")
            }.frame(height: screenHeight * 0.15)
            VStack(spacing: 15.0) {
                Button(action: { login() }) {
                    GeneralButton(title: "Ingresar con Google", bgColor: .white, textColor: Color("primary"))
                }
                Button(action: { login() }) {
                    GeneralButton(title: "Ingresar con Facebook", bgColor: .white, textColor: Color("primary"))
                }
            }
            Text("or")
            VStack(spacing: 20.0) {
                TextField("Correo",
                          text: $email,
                          prompt: Text("Ingrese su correo").foregroundColor(.white))
                    .foregroundColor(Color.white)
                    .cornerRadius(12)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 1)
                    )
                SecureField("Contraseña",
                            text: $password,
                            prompt: Text("Ingrese su contraseña").foregroundColor(.white))
                    .foregroundColor(Color.white)
                    .cornerRadius(15)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 1)
                    )
                Button(action: { login() }) {
                    GeneralButton(title: "Ingresar", bgColor: .white, textColor: Color("primary"))
                }
//                Button(action: { login() }) {
//                    GeneralButton(title: "Registrar", bgColor: Color("primary"), textColor:.white )
//                }
            }
            Spacer()
        }
        .overlay(
            Image("splashScreen")
                .resizable()
                .scaledToFit()
                .fixedSize()
            )
        .frame(width: .infinity, height: screenHeight)
        .padding()
//        .background(Color("primary"))
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
