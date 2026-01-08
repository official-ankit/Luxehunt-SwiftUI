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
    @Published var products: [AllDealResponse] = []
       @Published var isLoading: Bool = false
       @Published var errorMessage: String?
    
    var appServer = AppServerClient.sharedInstance
  
    func fetchAllDeals(page: Int = 1) {
            isLoading = true

            let url = "product/list?page=\(page)"

        appServer.getApi(
                url: url,
                success: { (response: AllDealsModel) in
                    DispatchQueue.main.async {
                        self.products = response.data
                        print(self.products)
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
    
    }

