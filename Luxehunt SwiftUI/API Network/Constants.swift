//
//  Constants.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation
import UIKit

public struct Constants {

    enum Environments: String {
        case prod = "Luxehunt Prod"
        case dev = "Luxehunt Staging"
       
        
        var BaseURL: String {
            switch self {
            case .prod: return "https://www.luxehunt.com/api/"
            case .dev: return "https://luxe-hunt.herokuapp.com/api/"
            }
        }
        
    }
    
    
    public static let api_category = "cat/all" // post
    public static let api_top_trending = "product/toptrending" // post
    public static let api_all_deals = "product/list" // post


}


