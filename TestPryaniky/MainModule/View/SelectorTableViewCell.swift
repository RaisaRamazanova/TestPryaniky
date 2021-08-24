//
//  SelectorTableViewCell.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 23.08.2021.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    // MARK: - properties

    @IBAction func firstButton(_ sender: UIButton) {
        setOptionSelected(1)
    }
    @IBAction func secondButton(_ sender: UIButton) {
        setOptionSelected(2)
    }
    @IBAction func thirdButton(_ sender: UIButton) {
        setOptionSelected(3)
    }
    
    
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
            setOptionSelected((cellViewModel?.selectedVariant!) ?? 1)
            firstLabel.text = cellViewModel?.titleOfVariants[0]
            secondLabel.text = cellViewModel?.titleOfVariants[1]
            thirdLabel.text = cellViewModel?.titleOfVariants[2]
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
    
    func setOptionSelected(_ isButtonSelected:Int) {
        if isButtonSelected == 1 {
            buttonIsSelected(firstButton: firstButton, secondButton: secondButton, thirdButton: thirdButton)
            labelFont(firstL: firstLabel, secondL: secondLabel, thirdL: thirdLabel)
        }
        if isButtonSelected == 2 {
            buttonIsSelected(firstButton: secondButton, secondButton: firstButton, thirdButton: thirdButton)
            labelFont(firstL: secondLabel, secondL: firstLabel, thirdL: thirdLabel)
        }
        if isButtonSelected == 3 {
            buttonIsSelected(firstButton: thirdButton, secondButton: secondButton, thirdButton: firstButton)
            labelFont(firstL: thirdLabel, secondL: secondLabel, thirdL: firstLabel)
        }
    }
    
    func labelFont(firstL: UILabel, secondL: UILabel, thirdL: UILabel) {
        firstL.font =  firstL.font.withSize(18)
        secondL.font =  secondL.font.withSize(16)
        thirdL.font =  thirdL.font.withSize(16)
    }
    
    func buttonIsSelected(firstButton: UIButton, secondButton: UIButton, thirdButton: UIButton) {
        firstButton.isSelected = true
        secondButton.isSelected = false
        thirdButton.isSelected = false
    }
}
