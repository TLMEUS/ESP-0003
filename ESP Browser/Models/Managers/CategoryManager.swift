//
// This file contains the CategoryManager.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Managers
// File Name: CategoryManager.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 05/24/2023
// File Last Modified: 09/17/2023
// File Copyright: 05/2023 By Troy L Marker Enterprises
//

import Foundation

protocol CategoryManagerDelegate {
    func didLoadCategory(_ categoryManager: CategoryManager, categoryList: [CategoryData])
    func didFailWithError(error: Error)
}

struct CategoryManager {
    let apiURL = "http://api.esp.tlme.us"
    var delegate: CategoryManagerDelegate?
    
    func fetchCategories() {
        let urlString = "\(apiURL)/category"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            //var request = URLRequest(url: url)
            //request.setValue("HTTP_X_API_KEY", forHTTPHeaderField: "87c9521ee5d040978a4509f647434")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {  (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let categories = self.parseJSON(safeData) {
                        self.delegate?.didLoadCategory(self, categoryList: categories)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ categoryData: Data) -> [CategoryData]? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode([CategoryData].self, from: categoryData)
            return result
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
