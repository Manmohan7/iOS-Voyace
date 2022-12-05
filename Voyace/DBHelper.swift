//
//  DBHelper.swift
//  Voyace
//
//  Created by Manmohan Singh on 2022-12-05.
//

import UIKit

struct Hotels: Codable {
    let hotels: [Hotel]
}

/**
 This will be used to display the information of a single Hotel on the Hotel View
 */
struct Hotel: Codable {
    var name: String = ""
    var rating: String = ""
    var location: String = ""
    var images: [String] = []
    var description: String = ""
    var rooms: [Room]
}

/**
 This will be used to display the information of all the Rooms in a Hotel
 */
struct Room: Codable {
    var name: String = ""
    var image: String = ""
    var description: String = ""
    var fare: String = ""
}

class DBHelper {
    var hotels: [Hotel] {
        loadJson(filename: "data")!
    }
    
    private func loadJson(filename fileName: String) -> [Hotel]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Hotels.self, from: data)
                
                return jsonData.hotels
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
