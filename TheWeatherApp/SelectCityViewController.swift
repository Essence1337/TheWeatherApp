//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/18/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit
import SwiftyJSON

struct CitiesStruct: Decodable {
    
    let country: String
    let name: String
    let lat: String
    let lng: String
    
//    "country": "AD",
//    "name": "Sant Julià de Lòria",
//    "lat": "42.46372",
//    "lng": "1.49129"
}

class SelectCityViewController: UIViewController {
    
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var citiesSearchBar: UISearchBar!
    
    let identifire = "customCell"
    var dataArray: JSON = []
    var searchCity = [String]()
    var searching = false
    var foundItems: JSON = []
    
//MARK: - Functions
    override func loadView() {
        super.loadView()
        getJson()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesSearchBar.delegate = self
    }
    
//MARK: - JsonFunc
    func getJson() {
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        do{
            let jsonData = try JSON(data: Data(referencing: data!))
            dataArray = jsonData
        }catch {
            print("Error")
        }
        
        
    
    }
    
    func jsonVanila() {
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        print("1")
        do {
            let cities = try JSONDecoder().decode([CitiesStruct].self, from: data! as Data)
            print("2")
            print(cities[0].name)
        } catch let jsonError {
            print(jsonError)
        }
    }
    
}

//MARK: - Extensions
//UITableView
extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return foundItems.count
        } else {
            return dataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        
        if searching {
            cell.textLabel?.text = foundItems[indexPath.row]["name"].rawString()
        }else{
            if let str = dataArray[indexPath.row]["name"].rawString(){
            cell.textLabel?.text = str
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let latStr = dataArray[indexPath.row]["lat"].rawString(){
            print("indexpath:\(latStr)")
            //            locatio(vavalfas d sadhsad sa)
        }
        if let lngStr = dataArray[indexPath.row]["lng"].rawString(){
            print("indexpath:\(lngStr)")
            //            locatio(vavalfas d sadhsad sa)
        }
    }
}

//SearchBar
extension SelectCityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let searchText = searchBar.text
        let searchPredicate = NSPredicate(format: "name contains[cd] %@", searchText!)
        if let array = dataArray.arrayObject as? [[String:String]] {
            foundItems = JSON(array.filter{ searchPredicate.evaluate(with: $0) })
            searching = true
            citiesTableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        citiesTableView.reloadData()
    }
}


