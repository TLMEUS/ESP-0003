//
// This file contains the PlanManager.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Managers
// File Name: PlanManager.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 06/02/2023
// File Last Modified: 09/17/2023
// File Copyright: 06/2023 By Troy L Marker Enterprises
//

import Foundation

protocol PlanManagerDelegate {
    func didLoadPlan(_ planManger: PlanManager, planList: [PlanData])
    func didFailWithError(error: Error)
}

struct PlanManager {
    let apiURL = "http://api.esp.tlme.us"
    var delegate: PlanManagerDelegate?
    
    func fetchPlans(parent: Int) {
        let urlString = "\(apiURL)/plan/\(parent)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let plans = self.parseJSON(safeData) {
                        self.delegate?.didLoadPlan(self, planList: plans)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ planData: Data) -> [PlanData]? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode([PlanData].self, from: planData)
            return result
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
