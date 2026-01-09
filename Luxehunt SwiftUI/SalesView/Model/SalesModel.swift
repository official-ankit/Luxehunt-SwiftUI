//
//  SalesModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 09/01/26.
//

import Foundation

struct SalesModel: Decodable {
    let error: Bool
    let data: SalesData
}

// MARK: - Data Container
struct SalesData: Decodable {
    let promos: [Sale]
}

// MARK: - Sale Model
struct Sale: Decodable, Identifiable {
    let id: String
    let title: String
    let head: String?
    let targetURL: String?
    let luxepassOnly: Bool?
    let createdAt: String?
    let updatedAt: String?
    let v: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case head
        case targetURL = "target_url"
        case luxepassOnly = "luxepass_only"
        case createdAt
        case updatedAt
        case v = "__v"
    }
}
