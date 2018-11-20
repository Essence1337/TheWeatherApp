//
//  ViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/18/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{

    
    var tableView = UITableView()
    var dataArray: JSON = []
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        self.tableView = UITableView(frame: view.bounds, style: .plain)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "custoCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        view.addSubview(self.tableView)
        let path = Bundle.main.path(forResource: "cities", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        if let jsonData = data {
            do{
                let jsonData = try JSON(data: Data(referencing: data!))
                dataArray = jsonData
            }catch is Error {}
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custoCell", for: indexPath)
//        let cell:UITableViewCell = UITableViewCell()
        if let str = dataArray[indexPath.row]["name"].rawString(){
            cell.textLabel?.text = str
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let str = dataArray[indexPath.row]["lat"].rawString(){
            print("indexpath:\(str)")
//            locatio(vavalfas d sadhsad sa)
        }
        
    }
    
    
    
}
