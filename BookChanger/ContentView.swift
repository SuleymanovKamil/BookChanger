//
//  ContentView.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyBooks()
            .preferredColorScheme(.light)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
