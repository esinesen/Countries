//
//  SavedCell.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import UIKit

class SavedCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(named: "black")?.cgColor
        self.layer.cornerRadius = 10
    }
    
    func configure(name: String, code: String) {
        self.nameLabel.text = name
        self.codeLabel.text = code
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if saveButton.currentImage == UIImage(systemName: "star"){
            SavedVC.storedCountry.append(nameLabel.text ?? "")
            SavedVC.storedCountryCode.append(codeLabel.text ?? "")
            saveButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else if saveButton.currentImage == UIImage(systemName: "star.fill") {
            SavedVC.storedCountry.removeAll(where: {$0 == nameLabel.text})
            SavedVC.storedCountryCode.removeAll(where: {$0 == codeLabel.text})
            saveButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        UserDefaults.standard.set(SavedVC.storedCountry, forKey: "saved")
        UserDefaults.standard.set(SavedVC.storedCountryCode, forKey: "savedCode")
        UserDefaults.standard.synchronize()
    }
}
