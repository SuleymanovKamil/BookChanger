//
//  ViewModel.swift
//  BookChanger
//
//  Created by Камиль Сулейманов on 19.03.2021.
//

import SwiftUI

class Store: ObservableObject {
    
    
    //add new book props
    @Published var addBookPresent = false
    
    //imagePicker props
    @Published var showImagePicker = false
    @Published var bookImage: UIImage?
    @Published var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    
    //user books array
    @Published var userBooks = [
        Book(name: "Дневник Гуантанамо", author: "Мохаммед ульд Слахи", ganre: "Биография", image: "", condition: 4, forSale: true, forChange: true, cost: "100")
    ]
    
    
    func convertImageToBase64String (image: UIImage?) -> String {
        return image!.jpegData(compressionQuality: 0.1)!.base64EncodedString()
    }
    
        func base64ToImage(_ base64String: String) -> UIImage? {
            guard let imageData = Data(base64Encoded: base64String) else { return nil }
            return UIImage(data: imageData)
        }
}
