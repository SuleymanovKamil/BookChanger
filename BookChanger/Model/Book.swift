//
//  Book.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

//struct Book {
//    let name: String
//    let author: String
//    let ganre: String
//    let condition: Int
//}


class Book: ObservableObject, Identifiable {
    @Published var name:String
    @Published var author: String
    @Published  var ganre: String
    @Published var image: String
    @Published var condition: Int
    @Published var forSale: Bool
    @Published var forChange: Bool
    @Published var cost: String
    @Published var ofs: CGFloat = 0

    init(name: String, author: String, ganre: String, image: String?, condition: Int, forSale: Bool, forChange: Bool, cost: String){
        self.name = name
        self.author = author
        self.ganre = ganre
        self.image = image ?? ""
        self.condition = condition
        self.forSale = forSale
        self.forChange = forChange
        self.cost = cost 
    }
}
