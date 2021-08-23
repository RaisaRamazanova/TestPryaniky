//
//  SelectorTableViewCell.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 23.08.2021.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    // MARK: - properties

 
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var cellViewModel: JsonCellViewModel? {
        didSet {
            firstLabel.text = cellViewModel?.cellTitle
            secondLabel.text = cellViewModel?.cellTitle
            thirdLabel.text = cellViewModel?.cellTitle
        }
    }

    // MARK: - override function
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        firstLabel.text = nil
        secondLabel.text = nil
        thirdLabel.text = nil
    }

    // MARK: - function
    
    func initView() {
        backgroundColor = .clear
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
}
