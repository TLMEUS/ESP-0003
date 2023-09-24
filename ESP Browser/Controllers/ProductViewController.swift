//
// This file contains the ProductViewController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: ProductViewController.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 05/24/2023
// File Last Modified: 09/17/2023
// File Copyright: 05/2023 By Troy L Marker Enterprises
//

import UIKit

class ProductViewController: UIViewController {
    

    @IBOutlet weak var skuTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabber = tabBarController as! BaseTabBarController
        skuTextField.text = String(describing: tabber.espData.productSKU)
        priceTextField.text = String(describing: tabber.espData.productPriceString)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let tabber = tabBarController as! BaseTabBarController
        tabber.espData.productSKU = skuTextField.text!
        let stringProductPrice = priceTextField.text!
        tabber.espData.productPriceDouble = (stringProductPrice as NSString).doubleValue
    }
    
    @IBAction func scanPressed(_ sender: UIButton) {
    }
    
    @IBAction func skuTextFieldChanged(_ sender: UITextField) {
        let tabber = tabBarController as! BaseTabBarController
        if skuTextField.text != nil {
            tabber.espData.productSKU = skuTextField.text!
        }
    }
    
    @IBAction func priceTextFieldChanged(_ sender: UITextField) {
        let tabber = tabBarController as! BaseTabBarController
        if priceTextField.text != nil {
            let stringProductPrice = priceTextField.text!
            tabber.espData.productPriceDouble = (stringProductPrice as NSString).doubleValue
        }
    }
}
