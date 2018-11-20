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
    
    var dataArray: JSON = []
    let identifire = "customCell"
    
    //MARK: - Functions
    override func loadView() {
        super.loadView()
        getJson()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
        if let lonStr = dataArray[indexPath.row]["lon"].rawString(){
            print("indexpath:\(lonStr)")
            //            locatio(vavalfas d sadhsad sa)
        }
    }
}
