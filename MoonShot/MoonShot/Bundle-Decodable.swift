//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Rashad Surratt on 10/31/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file) in the bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Cannot load \(file) from bundle at this tinme.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Couldn't deocode \(file) from this bundle")
        }
        
        return loaded
    }
}
