//
//  DealsViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//



import Foundation
import Combine
import Alamofire

class DealsViewModel: ObservableObject {

    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var currentPage: Int = 1
    private var canLoadMore: Bool = true

    var appServer = AppServerClient.sharedInstance

    // MARK: - Filters (stored)
    private var selectedCategory: String?
    private var searchText: String?

    // MARK: - Apply Filters (RESET + LOAD)
    func applyFilters(category: String?, search: String?) {
        selectedCategory = category
        searchText = search
        resetPagination()
        fetchDeals()
    }

    // MARK: - Load Next Page (Pagination)
    func loadNextPage() {
        guard !isLoading, canLoadMore else { return }
        fetchDeals()
    }

    // MARK: - Core API Call
    private func fetchDeals() {
        isLoading = true

        var url = "product/list?page=\(currentPage)"

        if let category = selectedCategory, !category.isEmpty {
            url += "&cat=\(category)"
        }

        if let search = searchText, !search.isEmpty {
            url += "&search=\(search)"
        }

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

    // MARK: - Reset Pagination
    private func resetPagination() {
        currentPage = 1
        canLoadMore = true
        products.removeAll()
    }
}



