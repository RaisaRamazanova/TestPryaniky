//
//  JsonCellViewModel.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 16.08.2021.
//

import UIKit

// MARK: - ViewModel structs

struct JsonCellViewModel {
    var viewName: String = ""
    var titleOfCell: String = ""
    var imageURL: UIImageView?
    var selectedVariant: Int?
    var titleOfVariants: [String] = []
}
