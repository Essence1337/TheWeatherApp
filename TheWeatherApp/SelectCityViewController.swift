//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/18/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit
import SwiftyJSON

class SelectCityViewController: UIViewController {
    
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var citiesSearchBar: UISearchBar!
    
    let identifire = "customCell"
    var searchCity = [String]()
    var searching = false
    var foundItems: JSON = []
    
//MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesSearchBar.delegate = self
    }
}

//MARK: - Extensions
extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return foundItems.count
        } else {
            return ParseJson.shared.cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        cell.textLabel?.text = ParseJson.shared.cities[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latStr = ParseJson.shared.cities[indexPath.row].lat
            print("indexpath:\(latStr)")
            //            locatio(vavalfas d sadhsad sa)
        
        let lngStr = ParseJson.shared.cities[indexPath.row].lat
            print("indexpath:\(lngStr)")
            //            locatio(vavalfas d sadhsad sa)

    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //
    //        let searchText = searchBar.text
    //        let searchPredicate = NSPredicate(format: "name contains[cd] %@", searchText!)
    //        if let array = dataArray.arrayObject as? [[String:String]] {
    //            foundItems = JSON(array.filter{ searchPredicate.evaluate(with: $0) })
    //            searching = true
    //            citiesTableView.reloadData()
    //        }
    //    }
    //
    //    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    //        searching = false
    //        searchBar.text = ""
    //        citiesTableView.reloadData()
    //    }
    
}



