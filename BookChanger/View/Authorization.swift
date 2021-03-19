//
//  Authorization.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct Authorization: View {
    @State var ainmation = true
    var body: some View {
        VStack {
            Spacer()
            AnimatedImage(name: "login.gif")
                .resizable()
                .frame(width: 300, height: 300)
                     
            Spacer()
            
            VStack (spacing: 10){
                Button(action: {}, label: {
                    Text("Войти")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: width - 30)
                        .background(Color.blue.cornerRadius(15))
                })
                
                Button(action: {}, label: {
                    Text("Зарегистрироваться")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: width - 30)
                        .background(Color.blue.cornerRadius(15))
                })

            }
        Spacer()
        }
    }
}

struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization()
    }
}
