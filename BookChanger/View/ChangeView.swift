//
//  ChangeView.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct ChangeView: View {
    @StateObject var store = Store()
    
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
                
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(store.userBooks.indices, id: \.self) { index in
                            ZStack {
                                ZStack {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                                store.userBooks.remove(at: index)
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
                                        store.userBooks.remove(at: index)
                                }

                                BookView(book: store.userBooks[index])
                                    
                                    
                            }
                
                        }
                    }
                    .sheet(isPresented: $store.addBookPresent, content: {
                        AddBook()
                    })

                    Spacer()
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
            .environmentObject(Store())
    }
}
