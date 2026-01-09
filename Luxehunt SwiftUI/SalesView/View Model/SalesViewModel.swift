//
//  SalesViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 09/01/26.
//

import Foundation
import Combine
import Alamofire



class SalesViewModel:ObservableObject{
    
    var networkManager = AppServerClient.sharedInstance
    @Published var salesData:[Sale] = []
    
    
    
    func fetchSalesList(){
        networkManager.getApi(url: Constants.api_all_sales, success: { (response:SalesModel) in
            DispatchQueue.main.async {
                self.salesData = response.data.promos
            }
           
        }, failure: { error in
            print(error)
        })
    }
    
    
    
}
