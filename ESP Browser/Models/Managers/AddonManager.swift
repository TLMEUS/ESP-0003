//
// This file contains the AddonManager.swift file for PROJECT ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Managers
// File Name: AddonManager.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 06/18/2023
// File Last Modified: 09/17/2023
// File Copyright: 06/2023 By Troy L Marker Enterprises
//

import Foundation

protocol AddonManagerDelegate {
    func didLoadAddon(_ addonManager: AddonManager, addonList: [AddonData])
    func didFailWithError(error: Error)
}

struct AddonManager {
    let apiURL = "http://api.esp.tlme.us"
    var delegate: AddonManagerDelegate?
    
    func fetchAddons(parent: Int) {
        let urlString = "\(apiURL)/addon/\(parent)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {  (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let addons = self.parseJSON(safeData) {
                        self.delegate?.didLoadAddon(self, addonList: addons)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ addonData: Data) -> [AddonData]? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode([AddonData].self, from: addonData)
            return result
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
