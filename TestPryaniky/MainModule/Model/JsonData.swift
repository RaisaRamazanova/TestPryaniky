//
//  JsonData.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 13.08.2021.
//

import UIKit

import Foundation

typealias JsonDatas =  JsonData.Type

// MARK: - Json structs

struct JsonData: Codable {
    let view: [String]
    let data: [Datas]
}

struct Datas: Codable {
    let name: String
    let data: TextBlock
}

struct TextBlock: Codable {
    let text: String?
    let url: URL?
    let variants: [Variants]?
    let selectedId: Int?
}

struct Variants: Codable  {
    let id: Int
    let text: String
}
