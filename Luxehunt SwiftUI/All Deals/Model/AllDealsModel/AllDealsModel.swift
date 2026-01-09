//
//  AllDealsModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//

import Foundation


// MARK: - Welcome
struct AllDealsModel: Decodable {
    let error: Bool
    let data: AllDealResponse
}

// MARK: - Datum
struct AllDealResponse: Decodable {
    let products: [Product]
//    let count: Count
}

enum Count: String, Decodable {
    case na = "NA"
}

// MARK: - Product
struct Product: Decodable {
    let id: String
//    let markedAsSold: [String]
    let description: String?
    let brand, title: String
//    let isLuxe: Bool?
//    let runDeal: Bool?
//    let dutiesIncluded, dutiesNotIncluded: Bool
//    let promoCode: String?
//    let originalPrice, offerPrice: Int?
//    let originalLink: String?
    let image: String
//    let category, sourceUserID, uploadedBy, createdAt: String?
//    let expireAt, updatedAt: String?
//    let v: Int
////    let details:
//    let isSold: Bool
//    let luxepassOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
//        case markedAsSold = "marked_as_sold"
        case description, brand, title
//        case cloudPublicID = "cloud_public_id"
//        case isLuxe, runDeal
//        case dutiesIncluded = "duties_included"
//        case dutiesNotIncluded = "duties_not_included"
//        case promoCode = "promo_code"
//        case originalPrice = "original_price"
//        case offerPrice = "offer_price"
//        case originalLink = "original_link"
//        case image, category
//        case sourceUserID = "source_user_id"
//        case uploadedBy = "uploaded_by"
//        case createdAt, expireAt, updatedAt
//        case v = "__v"
//        case  isSold
//        case luxepassOnly = "luxepass_only"
        case image
    }
}


