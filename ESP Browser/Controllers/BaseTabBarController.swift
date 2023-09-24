//
// This file contains the BaseTabBarController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: BaseTabBarController.swift
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

class BaseTabBarController: UITabBarController {

    struct ESPData {
        var productSKU: String = ""
        var productPriceString: String = ""
        var productPriceDouble: Double = 0.0
        var productCatPercent: Double = 0.0
        var planCategoryID: Int = 0
        var planCategoryName: String = ""
        var planPlanID:Int = 0
        var planPlanName: String = ""
        var planPlanTerm: String = ""
        var planPlanSKU: Int = 0
        var planPlanCost: Double = 0.0
        var planAddonID: Int = 0
        var planAddonTitle: String = ""
        var planAddonCost: Double = 0.0
        var planAddonSKU: String = ""
    }
    
    var espData = ESPData(productSKU: "", productPriceString: "", planCategoryID: 0, planCategoryName: "", planPlanID: 0, planPlanName: "", planPlanTerm: "", planPlanSKU: 0, planAddonID: 0, planAddonTitle: "", planAddonSKU: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
