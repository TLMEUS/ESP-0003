//
// This file contains the CategoryViewController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: CategoryViewController.swift
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

class CategoryViewController: UIViewController {
    
    var categoryManager = CategoryManager()
    var categoryList: [CategoryData] = []
    var buttons: [ESPButton] = []
      
    override func viewDidLoad(){
        super.viewDidLoad()
        categoryManager.delegate = self
        categoryManager.fetchCategories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        let tabber = tabBarController as! BaseTabBarController
        tabber.espData.productSKU = ""
        tabber.espData.productPriceString = ""
        tabber.espData.productPriceDouble = 0.0
        tabber.espData.productCatPercent = 0.0
        tabber.espData.planCategoryID = 0
        tabber.espData.planCategoryName = ""
        tabber.espData.planPlanID = 0
        tabber.espData.planPlanName = ""
        tabber.espData.planPlanTerm = ""
        tabber.espData.planPlanSKU = 0
        tabber.espData.planPlanCost = 0.0
        tabber.espData.planAddonID = 0
        tabber.espData.planAddonTitle = ""
        tabber.espData.planAddonCost = 0.0
        tabber.espData.planAddonSKU = ""
    }
    
    func resetButtons() {
        buttons.forEach{ button in
            button.backgroundColor = .systemRed
        }
    }
}

extension CategoryViewController: CategoryManagerDelegate {
    func didLoadCategory(_ categoryManager: CategoryManager, categoryList: [CategoryData]) {
        DispatchQueue.main.async {
            let margins = self.view.layoutMarginsGuide
            var count: CGFloat = 0
            for categoryItem in categoryList {
                let button = ESPButton()
                button.setTitle(categoryItem.colName, for: .normal)
                button.backgroundColor = .systemRed
                button.myData = categoryItem.colId
                self.view.addSubview(button)
                button.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
                button.topAnchor.constraint(equalTo: margins.topAnchor, constant: (count * 60)).isActive = true
                button.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
                button.heightAnchor.constraint(equalToConstant: 50).isActive = true
                button.translatesAutoresizingMaskIntoConstraints = false
                button.layer.cornerRadius = 10
                button.addAction(UIAction(handler: {_ in
                    self.resetButtons()
                    button.backgroundColor = .systemBlue
                    let tabber = self.tabBarController as! BaseTabBarController
                    tabber.espData.planCategoryID = categoryItem.colId
                    tabber.espData.planCategoryName = categoryItem.colName
                    tabber.espData.productCatPercent = categoryItem.colTsPercent
                }), for: .touchUpInside)
                count += 1
                self.buttons.append(button)
            }
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
