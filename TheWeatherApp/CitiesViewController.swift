//
//  CitiesViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/21/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {
    
    let selectCityVC = SelectCityViewController()
    
    @IBAction func fromStructTapped(_ sender: Any) {
        let str = ParseJson.shared.cities[0].name
        print(str)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
