//
//  TopTrendingModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation

import Foundation

// MARK: - TopTrendingAPIResponse
struct TopTrendingModel: Decodable {
    let error: Bool
    let data: [DataItem]
}

// MARK: - DataItem
struct DataItem: Decodable, Identifiable {
    let id = UUID()
    let product: ProductDetail
    let count: String
}

// MARK: - ProductDetail
struct ProductDetail: Decodable, Identifiable {

    let id: String
    let marked_as_sold: [String]?
    let description: String?
    let brand: String?
    let title: String?
    let cloud_public_id: String?
    let isLuxe: Bool?
    let runDeal: Bool?
    let duties_included: Bool?
    let duties_not_included: Bool?
    let promo_code: String?
    let original_price: Double?
    let offer_price: Double?
    let original_link: String?
    let image: String?
    let category: String?
    let source_user_id: String?
    let uploaded_by: String?
    let createdAt: String?
    let expireAt: String?
    let updatedAt: String?
    let __v: Int?
    let details: [String]?
    let isSold: Bool?
    let luxepass_only: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case marked_as_sold
        case description
        case brand
        case title
        case cloud_public_id
        case isLuxe
        case runDeal
        case duties_included
        case duties_not_included
        case promo_code
        case original_price
        case offer_price
        case original_link
        case image
        case category
        case source_user_id
        case uploaded_by
        case createdAt
        case expireAt
        case updatedAt
        case __v
        case details
        case isSold
        case luxepass_only
    }
}

