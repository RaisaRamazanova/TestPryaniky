//
//   MainViewModel.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 12.08.2021.
//

import UIKit

class JsonViewModel: NSObject {
    // MARK: - properties
    
    var indexDetailVCTitle: Int = 0
    private var jsonService: JsonServiceProtocol
    var reloadTableView: (() -> Void)?
    var jsonCellViewModels = [JsonCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    // MARK: - init
    
    init(jsonService: JsonServiceProtocol = JsonService()) {
        self.jsonService = jsonService
    }
    
    // MARK: - functions
    
    func getJsons() {
        jsonService.getJsons { success, model, error in
            if success, let json = model {
                self.fetchJsonData(json: json)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchJsonData(json: JsonData) {
        var vms = [JsonCellViewModel]()
        for view in json.view {
            for data in json.data {
                if data.name == view {
                    vms.append(createCellModel(datas: data))
                }
            }
        }
        jsonCellViewModels = vms
    }
    
    func createCellModel(datas: Datas) -> JsonCellViewModel {
        var title = ""
        var selectedId = 1
        var titleOfVariants = [String]()
        let imageURL = UIImageView()

        if datas.name == "selector" {
            selectedId = datas.data.selectedId!
            for selectedItem in datas.data.variants! {
                titleOfVariants.append(selectedItem.text)
            }
        }
        if datas.name == "picture" {
            title = datas.data.text!
            imageURL.image = loadImage(url: datas.data.url!)
        }
        if datas.name == "hz" {
            title = datas.data.text!
        }
        return JsonCellViewModel(viewName: datas.name, titleOfCell: title, imageURL: imageURL, selectedVariant: selectedId, titleOfVariants: titleOfVariants)
    }
    
    func loadImage(url: URL) -> UIImage {
        var image = UIImage()
        if let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)!
        }
        return image
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> JsonCellViewModel {
        return jsonCellViewModels[indexPath.row]
    }
}
