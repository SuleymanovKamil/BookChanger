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
    @State var cost = ""
    @State var image = ""
    
    var body: some View {
        ScrollView (showsIndicators: false){
            VStack {
                Text("Добавить новую книгу")
                    .font(.title2)
                    .bold()
                    .padding(.top, 20)
                
                Group{
                    TextField("Название", text: $name)
                        .padding(8)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 0.5))
                        .padding(.horizontal)
                    
                    TextField("Автор", text: $author)
                        .padding(8)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 0.5))
                        .padding(.horizontal)
                    
                    TextField("Жанр", text: $genre)
                        .padding(8)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 0.5))
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
                
                
                Group{
                    Toggle("Обмен", isOn: $forChange)
                        .padding(.horizontal)
                        .onChange(of: forChange, perform: { value in
                            if forChange == false{
                            forSale = true
                            }
                        })
                    
                    Toggle("Продажа", isOn: $forSale)
                        .padding(.horizontal)
                        .onChange(of: forSale, perform: { value in
                            if forChange == false && forSale == false{
                            forChange = true
                            }
                        })
                    
                    TextField("Цена", text: $cost)
                        .padding(8)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 0.5))
                        .padding(.horizontal)
                        .keyboardType(.numberPad)
                        .opacity(forSale ? 1 : 0)
                    
                }
                
                VStack (spacing: 15) {
                    Text("Фотография книги")
                        .font(.headline)
                    Image(uiImage: store.bookImage ?? #imageLiteral(resourceName: "ImagePlaceHolder") )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 130)
                        .overlay(Rectangle().stroke(lineWidth: 0.5))
                    
                    
                    Button(action: {
                        store.showImagePicker.toggle()
                    }, label: {
                        Text("Добавить фото")
                            .foregroundColor(.blue)
                            .padding(10)
                            .frame(width: 200)
                        
                    })
                    .fullScreenCover(isPresented: $store.showImagePicker) {
                        ImagePickerView(selectedImage: $store.bookImage, sourceType: $store.imagePickerSourceType).environmentObject(store)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    store.userBooks.append(Book(name: name, author: author, ganre: genre, image: store.convertImageToBase64String(image: store.bookImage), condition: conditinal, forSale: forSale, forChange: forChange, cost: cost))
                    store.addBookPresent.toggle()
                }, label: {
                    Text("Добавить")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: width - 30)
                        .background(!buttonDedable() ? Color.gray.cornerRadius(15) : Color.blue.cornerRadius(15))
                })
                .disabled(!buttonDedable())

                Spacer()
            }
            .preferredColorScheme(.light)
           
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    func buttonDedable () -> Bool {
        return name !=  "" && author != "" && genre != ""
    }
}

struct AddBook_Previews: PreviewProvider {
    static var previews: some View {
        AddBook()
            .environmentObject(Store())
    }
}
