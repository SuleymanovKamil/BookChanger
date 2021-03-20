//
//  BookView.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 21.03.2021.
//

import SwiftUI

struct BookView: View {
    @EnvironmentObject var store: Store
    @ObservedObject var book: Book
    
    var body: some View {
        ZStack {
            HStack {
                Image(uiImage: store.base64ToImage(book.image) ?? #imageLiteral(resourceName: "ImagePlaceHolder"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 130)
                
                VStack (alignment: .leading, spacing: 5){
  
                    VStack (alignment: .leading, spacing: 0){
                    Text(book.author)
                        .font(.headline)
                    
                    Text(book.name)
                        .font(.title2)
                        .bold()
                    }
                    
                    VStack (alignment: .leading, spacing: 2){
                        HStack {
                            Text("Жанр: ")
                                .font(.headline)
                            Text(book.ganre)
                                .font(.headline)
                        }
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
                                Text("\(book.cost)" + Locale.current.currencySymbol!)
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
