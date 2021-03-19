//
//  MainView.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct MyBooks: View {
    @StateObject var store = Store()
  
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(store.myBooks.indices, id: \.self) { index in
                        
                        ZStack  {

                            ZStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                              
                                            store.myBooks.remove(at: index)
            
                                    }
                                           , label: {
                                        Image(systemName: "trash.circle.fill")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 40, height: 40)
                                       
                                    })
                                    
                                }
                                .padding(.trailing, 20)
                                    
                                
                            }
                         
                            .onTapGesture {
                                    store.myBooks.remove(at: index)
                                    
                                
                            }

                            BookView(book: store.myBooks[index])
                                .offset(x: store.myBooks[index].ofs)
                                .gesture(
                                    DragGesture().onChanged{ value in
                                        onChan(value: value, index: index)
                                        
                                    }
                                    .onEnded{ value in
                                        onEn(value: value, index: index)
                                       
                                    }
                                )
                        }
            
                    }
                }
                .sheet(isPresented: $store.addBookPresent, content: {
                    AddBook()
                        .environmentObject(store)
                })

                Spacer()
            }

            .navigationBarTitle("Мои книги")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        store.addBookPresent.toggle()
                                    }, label: {
                                        Image(systemName: "plus")
                                            .font(.title)
                                            .foregroundColor(.black)
                                    }))
        }
    }
    
    func onChan(value: DragGesture.Value, index: Int) {
        if value.translation.width < 0 && store.myBooks[index].ofs != -70{
            store.myBooks[index].ofs = value.translation.width
        }
    }
    
    func onEn (value: DragGesture.Value, index: Int) {
        if -value.translation.width >= 50 {
            store.myBooks[index].ofs = -70
        } else {
            store.myBooks[index].ofs = 0
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MyBooks()
    }
}

struct BookView: View {

    @ObservedObject var book: Book
    
    var body: some View {
        ZStack {
 
            HStack {
                Image("book")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 130)
                
                VStack (alignment: .leading, spacing: 5){
                    
                
                    VStack (alignment: .leading, spacing: 0){
                    Text(book.author)
                        .font(.headline)
                    
                    Text(book.name)
                        .font(.title2)
                        .bold()
                    }
                    
                    VStack (alignment: .leading, spacing: 2){
                    Text("Жанр: " + book.ganre)
                        .font(.headline)
                    HStack {
                        Text("Состояние: ")
                            .font(.headline)
                        
                        ForEach(0..<5) {number in
                            Image(systemName: number < book.condition ? "star.fill" : "star")
                                .renderingMode(.original)
                                .font(.subheadline)
           
                        }
                    }
                    
                    HStack (spacing: 20){
                        HStack (spacing: 2){
                            Text("Обмен:")
                                .font(.headline)
                            Image(systemName: book.forChange ? "checkmark.circle.fill" : "xmark.circle")
                                .foregroundColor(book.forChange ? .green : .red)
                        }
                        
                        HStack (spacing: 2){
                            Text("Продажа:")
                                .font(.headline)
                            
                            if book.forSale {
                                Text("\(book.cost)₽")
                            } else {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.red)
                            }
                        }
                    }
                    }
                }
                Spacer()
            }
            
            .padding(.leading)
        }
        .background(Color.white)
        .offset(x: book.ofs)
    }
}
