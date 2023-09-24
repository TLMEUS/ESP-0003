//
// This file contains the CategoryViewController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: PlanViewController.swift
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

class PlanViewController: UIViewController {
    
    var planManager = PlanManager()
    var buttons: [ESPButton] = []

    override func viewDidLoad(){
        super.viewDidLoad()
        let tabber = self.tabBarController as! BaseTabBarController
        planManager.delegate = self
        planManager.fetchPlans(parent: tabber.espData.planCategoryID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabber = self.tabBarController as! BaseTabBarController
        if view.subviews.count > 0
        {
            view.subviews.forEach({ $0.removeFromSuperview()})
        }
        planManager.fetchPlans(parent: tabber.espData.planCategoryID)
    }
    
    func resetButtons() {
        buttons.forEach{ button in
            button.backgroundColor = .systemRed
        }
    }
}

extension PlanViewController: PlanManagerDelegate {
    func didLoadPlan(_ planManager: PlanManager, planList: [PlanData]) {
        DispatchQueue.main.async {
            let margins = self.view.layoutMarginsGuide
            var count: CGFloat = 0
            for planItem in planList {
                let tabber = self.tabBarController as! BaseTabBarController
                if (tabber.espData.productPriceDouble >= planItem.colMin && tabber.espData.productPriceDouble <= planItem.colMax) {
                    let button = ESPButton()
                    if planItem.colTier1term != "" {
                        button.setTitle("\(planItem.colName)\n\(planItem.colTier1term) term - $\(planItem.colTier1cost)", for: .normal)
                    } else {
                        button.setTitle("\(planItem.colName)\n$\(planItem.colTier1cost)", for: .normal)
                    }
                    button.titleLabel?.lineBreakMode = .byCharWrapping
                    button.titleLabel?.textAlignment = .center
                    button.backgroundColor = .systemRed
                    button.myData = planItem.colId
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
                        tabber.espData.planPlanID = planItem.colId
                        tabber.espData.planPlanName = planItem.colName
                        tabber.espData.planPlanTerm = planItem.colTier1term
                        tabber.espData.planPlanSKU = planItem.colTier1sku
                        tabber.espData.planPlanCost = planItem.colTier1cost
                    }), for: .touchUpInside)
                    count += 1
                    self.buttons.append(button)
                    
                    if planItem.colTier2term != "" {
                        let button1 = ESPButton()
                        button1.setTitle("\(planItem.colName)\n\(planItem.colTier2term) term - $\(planItem.colTier2cost)", for: .normal)
                        button1.titleLabel?.lineBreakMode = .byCharWrapping
                        button1.titleLabel?.textAlignment = .center
                        button1.backgroundColor = .systemRed
                        button1.myData = planItem.colId
                        self.view.addSubview(button1)
                        button1.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
                        button1.topAnchor.constraint(equalTo: margins.topAnchor, constant: (count * 60)).isActive = true
                        button1.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
                        button1.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
                        button1.heightAnchor.constraint(equalToConstant: 50).isActive = true
                        button1.translatesAutoresizingMaskIntoConstraints = false
                        button1.layer.cornerRadius = 10
                        button1.addAction(UIAction(handler: {_ in
                            self.resetButtons()
                            button1.backgroundColor = .systemBlue
                            let tabber = self.tabBarController as! BaseTabBarController
                            tabber.espData.planPlanID = planItem.colId
                            tabber.espData.planPlanName = planItem.colName
                            tabber.espData.planPlanTerm = planItem.colTier2term
                            tabber.espData.planPlanSKU = planItem.colTier2sku
                            tabber.espData.planPlanCost = planItem.colTier2cost
                        }), for: .touchUpInside)
                        count += 1
                        self.buttons.append(button1)
                    }
                }
            }
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
