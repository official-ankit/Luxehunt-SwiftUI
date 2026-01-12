//
//  BannerModel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 09/01/26.
//

import Foundation


struct BannerModel: Decodable {
    let error: Bool
    let data: BannerData
}

// MARK: - Data Container
struct BannerData: Decodable {
    let banner: [Banner]
}

// MARK: - Banner Model
struct Banner: Decodable {
    let id: String
    let title: String?
    let subtitle: String?
    let image: String?
    let targetURL: String?
    let cloudPublicID: String?
    let luxePassOnly: Bool?
//    let version: Int?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case title
        case subtitle
        case image
        case targetURL = "target_url"
        case cloudPublicID = "cloud_public_id"
        case luxePassOnly = "luxepass_only"
//        case version = "__v"
    }
}
