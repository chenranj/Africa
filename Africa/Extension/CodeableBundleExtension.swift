//
//  CodeableBundleExtension.swift
//  Africa
//
//  Created by Chenran Jin on 7/25/21.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
//        MARK: LOCATE THE JSON FILE
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
//        MARK: CREATE A PROPERTY FROM THE DATA
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to lead \(file) from bundle")
        }
        
//        MARK: CREATE A DECODER
        let decoder = JSONDecoder()
        
//        MARK: CREATE A PROPERTY FOR THE DECODE DATA
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
