//
//  CategoryModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation


struct CategoryModel: Codable {
    let id, name: String
    let v: Int?
    let index: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case v = "__v"
        case index
    }
}

struct CategoryResponse: Codable {
    let error: Bool?
    let data: [CategoryModel]
}

