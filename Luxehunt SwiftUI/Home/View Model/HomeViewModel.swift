//
//  HomeViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation
import Combine
import Alamofire

class HomeViewModel: ObservableObject {

    private let apiClient = AppServerClient.sharedInstance

    @Published var categoryModel: [CategoryModel] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    func fetchCategories() {
        isLoading = true

        apiClient.getApi(url: Constants.api_category) { (envelope: CategoryListEnvelope) in
            DispatchQueue.main.async {
                // Optionally, you could check envelope.error here.
                self.categoryModel = envelope.data.category
                self.isLoading = false
                self.errorMessage = nil
            }
        } failure: { error in
            DispatchQueue.main.async {
                self.isLoading = false
                self.errorMessage = error
            }
        }
    }
}





