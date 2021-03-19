//
//  AddBook.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct AddBook: View {
    @EnvironmentObject var store: Store
    @State var name = ""
    @State var author = ""
    @State var genre = ""
    @State var conditinal = 1
    @State var forChange = true
    @State var forSale = false
    @State var cost = 0
    
    var body: some View {
        VStack {
            Text("Добавить новую книгу")
                .font(.title2)
                .bold()
                .padding(.top, 20)
            
            Group{
            TextField("Название", text: $name)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.cornerRadius(10))
                .padding(.horizontal)
            
            TextField("Автор", text: $author)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.cornerRadius(10))
                .padding(.horizontal)
            
            TextField("Жанр", text: $genre)
                .padding()
                .foregroundColor(.black)
                .background(Color.gray.cornerRadius(10))
                .padding(.horizontal)
            }
            
            HStack {
                Text("Состояние: ")
                    .font(.headline)
                
                ForEach(1..<6) {number in
                    Image(systemName: number <= conditinal ? "star.fill" : "star")
                        .renderingMode(.original)
                        .onTapGesture {
                            conditinal = number
                        }
                }
                Spacer()
            }
            .padding(.leading)
            
            Toggle("Обмен", isOn: $forChange)
                .padding(.horizontal)
                .onChange(of: forChange, perform: { value in
                    forSale.toggle()
                })
            
            Toggle("Продажа", isOn: $forSale)
                .padding(.horizontal)
            
          
                TextField("Цена", text: $genre)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.gray.cornerRadius(10))
                    .padding(.horizontal)
                    .keyboardType(.numberPad)
                    .opacity(forSale ? 1 : 0)
           
            
            Spacer()
            
            Button(action: {
                store.myBooks.append(Book(name: name, author: author, ganre: genre, condition: conditinal, forSale: forSale, forChange: forChange, cost: cost))
                store.addBookPresent.toggle()
            }, label: {
                Text("Добавить")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: width - 30)
                    .background(Color.blue.cornerRadius(15))
            })

            
            Spacer()
        }
        .preferredColorScheme(.light)
    }
}

struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBook()
    }
}
