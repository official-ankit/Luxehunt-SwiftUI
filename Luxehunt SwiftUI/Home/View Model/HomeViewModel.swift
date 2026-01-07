//
//  HomeViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
    
    private let apiClient = AppServerClient.sharedInstance
        
        @Published var categoryModel: [CategoryModel] = []
        @Published var errorMessage: String?
        
        func fetchCategories() {
            apiClient.getApi(url: Constants.api_category,
                             success: { (response: CategoryResponse) in
                DispatchQueue.main.async {
                    self.categoryModel = response.data
                }
            }, failure: { error in
                DispatchQueue.main.async {
                    self.errorMessage = error
                }
            })
        }
    }





