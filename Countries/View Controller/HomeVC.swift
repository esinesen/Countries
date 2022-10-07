//
//  HomeVC.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import UIKit
import Foundation

class HomeVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?offset=0&limit=10&rapidapi-key=7ca4a07f94msh20744e683cd058cp162a9djsn73060d7f45cf"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countries += jsonCountries.data
            collectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath as IndexPath) as! CountryCell
        let country = countries[indexPath.row]
        cell.configure(model: country)
        
        if SavedVC.storedCountry.contains(where: { $0 == cell.nameLabel.text}){
            cell.saveButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }else {
            cell.saveButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath as IndexPath) as! CountryCell
        selectedItem.configure(model: countries[indexPath.row])
        DetailsVC.code = selectedItem.codeLabel.text!
    }
}
