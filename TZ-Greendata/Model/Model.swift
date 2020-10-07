//
//  Model.swift
//  TZ-Greendata
//
//  Created by MAC on 07.10.2020.
//  Copyright © 2020 Gera Volobuev. All rights reserved.
//


import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let results: [Person]
    let info: Info
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct Person: Codable {
    let gender: String
    let name: Name
    let location: Location
    let email: String
    let dob: Dob
    let picture: Picture
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
    var formatted: String {
        return "\(date.prefix(10)) (\(age))"
    }
}

// MARK: - Location
struct Location: Codable {
    let timezone: Timezone
}

// MARK: - Timezone
struct Timezone: Codable {
    let offset, timezoneDescription: String

    var local: String {
        let withoutSemicolons = offset.split(separator: ":")
        let hour = Int(withoutSemicolons[0]) ?? 0
        let timeNow = Calendar.current.date(byAdding: .hour, value: hour, to: Date()) ?? Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: timeNow)
        return "\(dateString) (offset: \(hour))"
    }
    
    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
    var fullName: String {
        return "\(first) \(last)"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
