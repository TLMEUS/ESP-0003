//
// This file contains the CategoryData.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Data
// File Name: CategoryData.swift
// File Version: 1.0.0
// Author: Troy L. Marker
// Language: Swift 5
// iOS Target: 16.4
//
// File Authored: 05/27/2023
// File Last Modified: 09/17/2023
// File Copyright: 05/2023 By Troy L Marker Enterprises
//

import Foundation

struct Category: Codable {
    let categoryList: [CategoryData]
}

struct CategoryData: Codable {
    let colId: Int
    let colName: String
    let colTsFlag: Bool
    let colTsPercent: Double
}
