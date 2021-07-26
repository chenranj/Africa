//
//  VideoModel.swift
//  Africa
//
//  Created by Chenran Jin on 7/25/21.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
