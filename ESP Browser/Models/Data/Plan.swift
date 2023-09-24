//
// This file contains the PlanData.swift file for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Data
// File Name: PlanData.swift
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

struct Plan: Codable {
    let planList: [PlanData]
}

struct PlanData: Codable {
    let colId: Int
    let colPid: Int
    let colName: String
    let colMin: Double
    let colMax: Double
    let colTier1term: String
    let colTier1cost: Double
    let colTier1sku: Int
    let colTier2term: String
    let colTier2cost: Double
    let colTier2sku: Int
}
