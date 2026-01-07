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
    // The API also returns "index" (Double/Int) and "__v" (Int).
    // We can ignore them safely. Add fields if you need sorting by index.

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}

// MARK: - API response wrappers

struct CategoryListData: Decodable {
    let category: [CategoryModel]
}

struct CategoryListEnvelope: Decodable {
    let error: Bool
    let data: CategoryListData
}
