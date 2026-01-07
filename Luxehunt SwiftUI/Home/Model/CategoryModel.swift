//
//  CategoryModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation


struct CategoryModel: Decodable, Identifiable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

// MARK: - CategoryData
struct CategoryResponse: Decodable {
    let category: [CategoryModel]
}
