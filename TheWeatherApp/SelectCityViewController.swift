//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/18/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit

class SelectCityViewController: UIViewController {
    
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var citiesSearchBar: UISearchBar!
    
    let identifire = "customCell"
    var searchCity = [String]()
    var searching = false
    var foundCities: [CitiesStruct] = []
    
//MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//MARK: - Extensions
extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return foundCities.count
        } else {
            return ParseJson.shared.cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        if searching {
            cell.textLabel?.text = foundCities[indexPath.row].name
            return cell

        } else {
            cell.textLabel?.text = ParseJson.shared.cities[indexPath.row].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if searching {
            let latStr = foundCities[indexPath.row].lat
            print("Latitude: \(latStr)")

            let lngStr = foundCities[indexPath.row].lng
            print("Longitude: \(lngStr)")
        } else {
        let latStr = ParseJson.shared.cities[indexPath.row].lat
            print("Latitude: \(latStr)")
        
        let lngStr = ParseJson.shared.cities[indexPath.row].lng
            print("Longitude: \(lngStr)")
        }
    }
    
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
            let searchText = searchBar.text
            searching = true
            DispatchQueue.global(qos: .userInteractive).async {
                self.foundCities = ParseJson.shared.cities.filter{$0.name.hasPrefix(searchText!)}
                DispatchQueue.main.async {
                    self.citiesTableView.reloadData()
                }
            }
        }
    
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
            searchBar.text = ""
            citiesTableView.reloadData()
        }
    
}



