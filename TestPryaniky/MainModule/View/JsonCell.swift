//
//  TestView+Extension.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 13.08.2021.
//

import UIKit

class JsonCell: UITableViewCell {
    // MARK: - properties

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: JsonCellViewModel? {
        didSet {
            titleLabel.text = cellViewModel?.titleOfCell
            productImage.image = cellViewModel?.imageURL?.image
        }
    }

    // MARK: - override function
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        productImage.image = nil
    }

    // MARK: - function
    
    func initView() {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
}
