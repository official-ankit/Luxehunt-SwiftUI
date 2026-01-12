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
    @Published var topTrendingProducts: [DataItem] = []
    @Published var allBannerData: [Banner] = []
    @Published var isLoadingTopTrending = false

    func fetchCategories() {
        isLoading = true

        apiClient.getApi(url: Constants.api_category) { (envelope: CategoryListEnvelope) in
            DispatchQueue.main.async {
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
    
    func fetchTopTrendingProducts() {
            isLoadingTopTrending = true
        apiClient.getApi(url: Constants.api_top_trending, success: { (response: TopTrendingModel) in
                DispatchQueue.main.async {
                    self.topTrendingProducts = response.data
                    self.isLoadingTopTrending = false
                }
            }, failure: { error in
                DispatchQueue.main.async {
                    self.errorMessage = error
                    self.isLoadingTopTrending = false
                }
            })
        }
    
    func fetchAllBanner(){
        apiClient.getApi(url: Constants.api_all_banner, success: { (response:BannerModel) in
            DispatchQueue.main.async{
                self.allBannerData = response.data.banner
                print("Banner=\(response)")
            }
        }, failure: { error in
            print(error)
        })
    }
}





