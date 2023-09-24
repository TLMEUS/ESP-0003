//
// This file contains the AddonViewController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: AddonViewController.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 06/20/2023
// File Last Modified: 09/17/2023
// File Copyright: 06/2023 By Troy L Marker Enterprises
//

import UIKit

class AddonViewController: UIViewController {
    
    var addonManager = AddonManager()
    var buttons: [ESPButton] = []

    override func viewDidLoad(){
        super.viewDidLoad()
        let tabber = self.tabBarController as! BaseTabBarController
        addonManager.delegate = self
        addonManager.fetchAddons(parent: tabber.espData.planCategoryID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabber = self.tabBarController as! BaseTabBarController
        if view.subviews.count > 0
        {
            view.subviews.forEach({ $0.removeFromSuperview()})
        }
        addonManager.fetchAddons(parent: tabber.espData.planCategoryID)
    }
    
    func resetButtons() {
        buttons.forEach{ button in
            button.backgroundColor = .systemRed
        }
    }
}

extension AddonViewController: AddonManagerDelegate {
    func didLoadAddon(_ addonManager: AddonManager, addonList: [AddonData]) {
        DispatchQueue.main.async {
            let margins = self.view.layoutMarginsGuide
            var count: CGFloat = 0
            for addonItem in addonList {
                //let tabber = self.tabBarController as! BaseTabBarController
                let button = ESPButton()
                button.setTitle("\(addonItem.colTitle)\n$\(addonItem.colCost)", for: .normal)
                button.titleLabel?.lineBreakMode = .byCharWrapping
                button.titleLabel?.textAlignment = .center
                button.backgroundColor = .systemRed
                button.myData = addonItem.colId
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
                    tabber.espData.planAddonID = addonItem.colId
                    tabber.espData.planAddonTitle = addonItem.colTitle
                    tabber.espData.planAddonCost = addonItem.colCost
                    tabber.espData.planAddonSKU = addonItem.colSku
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
