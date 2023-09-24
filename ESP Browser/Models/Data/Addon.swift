//
// This file contains the AddonData.swift file for for project ESP-0003
//
// File Information:
// Project Name: ESP-0003
// Module Name: Models/Data
// File Name: AddonData.swift
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

struct Addon: Codable {
    let addonList: [AddonData]
}

struct AddonData: Codable {
    let colId: Int
    let colPid: Int
    let colTitle: String
    let colCost: Double
    let colSku: String
}
