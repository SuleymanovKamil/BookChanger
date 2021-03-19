//
//  ViewModel.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

class Store: ObservableObject {
    
    @Published var addBookPresent = false
    
    @Published var myBooks = [
        Book(name: "Дневник Гуантанамо", author: "Мохаммед ульд Слахи", ganre: "Биография", condition: 4, forSale: false, forChange: true, cost: 0)
    ]
}
