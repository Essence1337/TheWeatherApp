//
//  CitiesViewController.swift
//  TheWeatherApp
//
//  Created by Тимур Кошевой on 11/21/18.
//  Copyright © 2018 Тимур Кошевой. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    @IBAction func buttonTaped(_ sender: Any) {
        let selectCityVC = SelectCityViewController()
        selectCityVC.jsonVanila()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
