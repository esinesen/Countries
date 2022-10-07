//
//  FavoritesVC.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import UIKit

class SavedVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var storedCountry = UserDefaults.standard.object(forKey: "saved") as? [String] ?? [String]()
    static var storedCountryCode = UserDefaults.standard.object(forKey: "savedCode") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
}

extension SavedVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "savedCell", for: indexPath as IndexPath) as! SavedCell
        let countryName = SavedVC.storedCountry[indexPath.row]
        let countryCode = SavedVC.storedCountryCode[indexPath.row]
        cell.configure(name: countryName, code: countryCode)
        
        if SavedVC.storedCountry.contains(where: { $0 == cell.nameLabel.text}){
            cell.saveButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else {
            cell.saveButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SavedVC.storedCountry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = collectionView.dequeueReusableCell(withReuseIdentifier: "savedCell", for: indexPath as IndexPath) as! SavedCell
        selectedItem.configure(name: SavedVC.storedCountry[indexPath.row], code: SavedVC.storedCountryCode[indexPath.row])
        DetailsVC.code = selectedItem.codeLabel.text!
    }
}
