//
//  DealsViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//

import Foundation
import Combine
import Alamofire



class DealsViewModel:ObservableObject{
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    private var currentPage: Int = 1
    private var canLoadMore: Bool = true
    
    var appServer = AppServerClient.sharedInstance
  
    func fetchDealList() {
            guard !isLoading, canLoadMore else { return }

            isLoading = true
            let url = "product/list?page=\(currentPage)"

            appServer.getApi(
                url: url,
                success: { (response: AllDealsModel) in
                    DispatchQueue.main.async {

                        let newProducts = response.data.products
                        if newProducts.isEmpty {
                            self.canLoadMore = false
                        } else {
                            self.products.append(contentsOf: newProducts)
                            self.currentPage += 1
                        }

                        self.isLoading = false
                    }
                },
                failure: { error in
                    DispatchQueue.main.async {
                        self.errorMessage = error
                        self.isLoading = false
                    }
                }
            )
        }

        // MARK: - Reset
        private func resetPagination() {
            currentPage = 1
            canLoadMore = true
            products.removeAll()
        }
    }

