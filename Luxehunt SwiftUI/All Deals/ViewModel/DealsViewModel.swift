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

    // MARK: - Published
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    // MARK: - Pagination
    private var currentPage: Int = 1
    private var canLoadMore: Bool = true

    var appServer = AppServerClient.sharedInstance

    // MARK: - Filters (Stored)
    private var selectedCategory: String?
    private var searchText: String?

    // NEW
    private var sortBrand: String?          // "asc" / "desc"
    private var sort: String?          // "low" / "high"
    private var selectedPriceRanges: [String] = [] // multiple values

    // MARK: - Apply Filters
    func applyFilters(
        category: String?,
        search: String?,
        sortBrand: String?,
        sortPrice: String?,
        priceRanges: [String]
    ) {
        self.selectedCategory = category
        self.searchText = search
        self.sortBrand = sortBrand
        self.sort = sortPrice
        self.selectedPriceRanges = priceRanges

        resetPagination()
        fetchDeals()
    }

    // MARK: - Pagination
    func loadNextPage() {
        guard !isLoading, canLoadMore else { return }
        fetchDeals()
    }

    // MARK: - Core API Call
    private func fetchDeals() {
        isLoading = true

        var url = "product/list?page=\(currentPage)"

        // Category
        if let category = selectedCategory, !category.isEmpty {
            url += "&cat=\(category)"
        }

        // Search
        if let search = searchText, !search.isEmpty {
            url += "&search=\(search)"
        }

        // Sort Brand
        if let sortBrand = sortBrand {
            url += "&sortBrand=\(sortBrand)"
        }

        // Sort Price
        if let sort = sort {
            url += "&sort=\(sort)"
        }

        // Price Filters (ARRAY)
        for price in selectedPriceRanges {
            url += "&price[]=\(price)"
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

    // MARK: - Reset
    func resetAllFilters() {
        selectedCategory = nil
        searchText = nil
        sortBrand = nil
        sort = nil
        selectedPriceRanges.removeAll()

        resetPagination()
        fetchDeals()
    }

    private func resetPagination() {
        currentPage = 1
        canLoadMore = true
        products.removeAll()
    }
}







