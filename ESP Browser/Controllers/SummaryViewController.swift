//
// This file contains the SummaryViewController.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Controllers
// File Name: SummaryViewController.swift
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

class SummaryViewController: UIViewController {

    @IBOutlet weak var summaryProductSKU: UITextField!
    @IBOutlet weak var summaryProductPrice: UITextField!
    @IBOutlet weak var summaryCategoryID: UITextField!
    @IBOutlet weak var summaryCategoryName: UITextField!
    @IBOutlet weak var summaryPlanID: UITextField!
    @IBOutlet weak var summaryPlanName: UITextField!
    @IBOutlet weak var summaryPlanTerm: UITextField!
    @IBOutlet weak var summaryPlanSKU: UITextField!
    @IBOutlet weak var summaryPlanCost: UITextField!
    @IBOutlet weak var summaryAddonID: UITextField!
    @IBOutlet weak var summaryAddonTitle: UITextField!
    @IBOutlet weak var summaryAddonCost: UITextField!
    @IBOutlet weak var summaryAddonSKU: UITextField!
    @IBOutlet weak var summaryProductDollars: UITextField!
    @IBOutlet weak var summaryPlanDollars: UITextField!
    @IBOutlet weak var summaryAddonDollars: UITextField!
    @IBOutlet weak var summaryCategoryPercent: UITextField!
    @IBOutlet weak var summaryTotalDollars: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tabber = tabBarController as! BaseTabBarController
        var total: Double
        var addons: Double
        total = tabber.espData.productPriceDouble
        addons = (tabber.espData.planAddonCost + tabber.espData.planPlanCost) * 1.0
        total = total + (addons * (1.0 - tabber.espData.productCatPercent))
        summaryProductSKU.text = String(describing: tabber.espData.productSKU)
        summaryProductPrice.text = String(describing: tabber.espData.productPriceDouble)
        summaryCategoryID.text = String(describing: tabber.espData.planCategoryID)
        summaryCategoryName.text = String(describing: tabber.espData.planCategoryName)
        summaryPlanID.text =  String(describing: tabber.espData.planPlanID)
        summaryPlanName.text = String(describing: tabber.espData.planPlanName)
        summaryPlanTerm.text = String(describing: tabber.espData.planPlanTerm)
        summaryPlanSKU.text = String(describing: tabber.espData.planPlanSKU)
        summaryPlanCost.text = String(describing: tabber.espData.planPlanCost)
        summaryAddonID.text = String(describing: tabber.espData.planAddonID)
        summaryAddonTitle.text = String(describing: tabber.espData.planAddonTitle)
        summaryAddonCost.text = String(describing: tabber.espData.planAddonCost)
        summaryAddonSKU.text = String(describing: tabber.espData.planAddonSKU)
        summaryProductDollars.text = String(describing: tabber.espData.productPriceDouble)
        summaryPlanDollars.text = String(describing: tabber.espData.planPlanCost)
        summaryAddonDollars.text = String(describing: tabber.espData.planAddonCost)
        summaryCategoryPercent.text = String(describing: tabber.espData.productCatPercent)
        summaryTotalDollars.text = String(format: "%5.2f", total)
    }
}
