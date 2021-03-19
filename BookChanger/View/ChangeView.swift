//
//  ChangeView.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct ChangeView: View {
    @State var conditinal = 4
    var body: some View {
        NavigationView {
            
            VStack (alignment: .leading) {
   
                VStack (alignment: .leading, spacing: 2){
                    HStack {
                        Text("Местоположение")
                            .font(.headline)
                        
                        Text("Махачкала")
                        
                    }
                    
                    HStack {
                        Text("Удобный район для обмена:")
                            .font(.headline)
                        
                        Text("Центр города")
                        
                    }
                    
                    HStack {
                        Text("Удобное время для обмена:")
                            .font(.headline)
                        
                        Text("после 18 часов")
                        
                    }
                }
                
                Button(action: {}, label: {
                    Text("Преложить обмен")
                        .foregroundColor(.white)
                        .padding(5)
                        .frame(width: 200)
                        .background(Color.blue.cornerRadius(10))
                })

           
                Text("Список книг:")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                ScrollView {
                    HStack {
                            Image("book")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                            
                        VStack (alignment: .leading, spacing: 5){
                                Text("Дневник Гуантанамо")
                                    .font(.title2)
                                    .bold()
                            Text("Мохаммед ульд Слахи")
                                .font(.headline)
                                Text("Жанр: Биография")
                                    .font(.headline)
                                HStack {
                                    Text("Состояние: ")
                                        .font(.headline)
                                    
                                    ForEach(0..<5) {number in
                                        Image(systemName: number <= conditinal ? "star.fill" : "star")
                                            .renderingMode(.original)
                                            .onTapGesture {
                                                conditinal = number
                                            }
                                    }
                                }
                                
                            }
                        Spacer()
                    }
                }
                
                Spacer()
            }
            .padding(.leading)
            .navigationBarTitle("Камиль")
            .navigationBarItems(trailing:
                                    Button(action: {}, label: {
                                        Image(systemName: "plus")
                                            .font(.title)
                                            .foregroundColor(.black)
                                    }))
        }
       
    }
}

struct ChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeView()
    }
}
