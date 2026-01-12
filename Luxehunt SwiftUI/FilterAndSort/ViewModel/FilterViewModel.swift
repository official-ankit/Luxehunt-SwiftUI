//
//  FilterViewModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import Foundation
import Combine
import Alamofire

class FilterViewModel:ObservableObject{
    let networkManager = AppServerClient.sharedInstance
    @Published var filterData: FilterModel?
    
    func postRequestBrnad(){
        let param = ["category": "" ]
        networkManager.api(url: Constants.api_designer, param: param as [String : Any], method: .post, success: { (response: FilterModel) in
            DispatchQueue.main.async { [self] in
            self.filterData = response
                print(filterData ?? [])
            }

            
        }, failure: { error in
            
            
        })
    }
}
