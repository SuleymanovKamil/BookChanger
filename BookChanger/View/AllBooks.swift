//
//  AllBooks.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct AllBooks: View {
    @State var conditinal = 4
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
 
                HStack {
                        Image("book")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                        
                    VStack (alignment: .leading, spacing: 5){
                            Text("Дневник Гуантанамо")
                                .font(.headline)
                                .bold()
                        Text("Мохаммед ульд Слахи")
                            .font(.subheadline)
                            Text("Жанр: Биография")
                                .font(.subheadline)
                            HStack {
                                Text("Состояние: ")
                                    .font(.subheadline)
                                
                                ForEach(0..<5) {number in
                                    Image(systemName: number <= conditinal ? "star.fill" : "star")
                                        .renderingMode(.original)
                                        .font(.subheadline)
                                }
                               
                            }
                            
                        }
                    
                    Spacer()
                }
                .padding(.leading)

                Spacer()
            }

            .navigationBarTitle("Книги рядом")
            .navigationBarItems(leading:
                                    Button(action: {}, label: {
                                        Image(systemName: "magnifyingglass")
                                            .font(.title)
                                            .foregroundColor(.black)
                                    }))
        }
    }
}

struct AllBooks_Previews: PreviewProvider {
    static var previews: some View {
        AllBooks()
    }
}
