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
    
    // MARK: - Filters
    var selectedCategory: String?
    var searchText: String?
    
    // MARK: - Fetch All Deals
//    func fetchDealList() {
//        fetchDealListWithFilters(category: nil, search: nil)
//    }
    
    // MARK: - Fetch Deals with Filters
    func fetchDealListWithFilters(category: String?, search: String?) {
        guard !isLoading, canLoadMore else { return }
        isLoading = true
        
        var url = "product/list?page=\(currentPage)"
        
        // Apply category filter if available
        if let category = category, !category.isEmpty {
            url += "&cat=\(category)"
        }
        
        // Apply search filter if available
        if let search = search, !search.isEmpty {
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
    func resetPagination() {
        currentPage = 1
        canLoadMore = true
        products.removeAll()
    }
    
    // MARK: - Apply Filters & Fetch
    func applyFilters(category: String?, search: String?) {
        selectedCategory = category
        searchText = search
        resetPagination()
        fetchDealListWithFilters(category: selectedCategory, search: searchText)
    }
}


