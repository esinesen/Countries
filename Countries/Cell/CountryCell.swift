//
//  CountryCell.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import UIKit

class CountryCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var code = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "black")?.cgColor
        self.layer.cornerRadius = 10
    }
    
    func configure(model: Country) {
        self.nameLabel.text = model.name
        self.code = model.code ?? ""
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if saveButton.currentImage == UIImage(systemName: "star"){
            SavedVC.storedCountry.append(nameLabel.text ?? "")
            SavedVC.storedCountryCode.append(code)
            saveButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else if saveButton.currentImage == UIImage(systemName: "star.fill") {
            SavedVC.storedCountry.removeAll(where: {$0 == nameLabel.text})
            SavedVC.storedCountryCode.removeAll(where: {$0 == code})
            saveButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        UserDefaults.standard.set(SavedVC.storedCountry, forKey: "saved")
        UserDefaults.standard.set(SavedVC.storedCountryCode, forKey: "savedCode")
        UserDefaults.standard.synchronize()
    }
}
