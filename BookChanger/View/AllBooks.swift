//
//  AllBooks.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct AllBooks: View {
    @StateObject var store = Store()
    
    var body: some View {
        NavigationView {
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
                                .offset(x: store.userBooks[index].ofs)
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
                })

                Spacer()
            }
            .environmentObject(store)
            .navigationBarTitle("Книги рядом")
            .navigationBarItems(leading:
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "magnifyingglass")
                                            .font(.title)
                                            .foregroundColor(.black)
                                    }))
        }
    }
    
    func onChan(value: DragGesture.Value, index: Int) {
        if value.translation.width < 0 && store.userBooks[index].ofs != -70{
            store.userBooks[index].ofs = value.translation.width
        }
    }
    
    func onEn (value: DragGesture.Value, index: Int) {
        if -value.translation.width >= 50 {
            store.userBooks[index].ofs = -70
        } else {
            store.userBooks[index].ofs = 0
        }
    }
}

struct AllBooks_Previews: PreviewProvider {
    static var previews: some View {
        AllBooks()
    }
}
