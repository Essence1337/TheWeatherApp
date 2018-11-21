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
    var dataArray: JSON = []
    var searchCity = [String]()

//MARK: - Functions
    override func loadView() {
        super.loadView()
        getJson()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        huynia()
    }
    
    func huynia(){
        let searchText = "y"
        let searchPredicate = NSPredicate(format: "name contains[cd] %@", searchText)
        if let array = dataArray.arrayObject as? [[String:String]] {
            let foundItems = JSON(array.filter{ searchPredicate.evaluate(with: $0) })
            print(foundItems)
        }
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
    
}

//MARK: - Extensions
//UITableView
extension SelectCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        if let str = dataArray[indexPath.row]["name"].rawString(){
            cell.textLabel?.text = str
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
        
    }
}


