//
//  DetailsVC.swift
//  Countries
//
//  Created by Esin Esen on 5.10.2022.
//

import UIKit
import Foundation
import WebKit

class DetailsVC: UIViewController {
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var navigator: UINavigationItem!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    static var code = ""
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(DetailsVC.code)?rapidapi-key=7ca4a07f94msh20744e683cd058cp162a9djsn73060d7f45cf"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
        
        if SavedVC.storedCountry.contains(where: { $0 == navigator.title}){
            saveButton.image = (UIImage(systemName: "star.fill"))
        }else {
            saveButton.image = (UIImage(systemName: "star"))
        }
    }

    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonCountryDetails = try? decoder.decode(CountryDetails.self, from: json) {
            navigator.title = jsonCountryDetails.data.name
            codeLabel.text = jsonCountryDetails.data.code
            id = jsonCountryDetails.data.wikiDataId ?? ""
            
            if let imageUrl = URL(string: jsonCountryDetails.data.flagImageUri ?? "") {
                    webView.load(URLRequest(url: imageUrl))
            }
        }
    }
    
    @IBAction func saveClicked(_ sender: Any) {
        if saveButton.image == UIImage(systemName: "star"){
            SavedVC.storedCountry.append(navigator.title ?? "")
            SavedVC.storedCountryCode.append(codeLabel.text ?? "")
            saveButton.image = UIImage(systemName: "star.fill")
        } else if saveButton.image == UIImage(systemName: "star.fill") {
            SavedVC.storedCountry.removeAll(where: {$0 == navigator.title})
            SavedVC.storedCountryCode.removeAll(where: {$0 == codeLabel.text})
            saveButton.image = UIImage(systemName: "star")
        }
        UserDefaults.standard.set(SavedVC.storedCountry, forKey: "saved")
        UserDefaults.standard.set(SavedVC.storedCountryCode, forKey: "savedCode")
        UserDefaults.standard.synchronize()
    }
    
    @IBAction func moreInfoClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.wikidata.org/wiki/\(id)")!)
    }
}
