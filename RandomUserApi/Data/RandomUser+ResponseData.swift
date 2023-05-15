//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by 홍정표 on 2023/05/15.
//

import Foundation

struct RandomUser: Codable, Identifiable{
    var id = UUID()
    var name: Name
    var photo: Photo
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self{
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    var profileImageUrl: URL{
        get{
            URL(string: photo.medium)!
        }
    }
}

struct Name: Codable, CustomStringConvertible{
    var title: String
    var first: String
    var last: String
    
    var description: String{
        return "\(title) \(first) \(last)"
    }
    
    static func getDummy() -> Self{
        return Name(title: "홍가네", first: "홍", last: "정표")
    }
}

struct Photo: Codable{
    var large: String
    var medium: String
    var thumbnail: String
    
    static func getDummy() -> Self{
        return Photo(large: "https://randomuser.me/api/portraits/women/86.jpg",
                     medium: "https://randomuser.me/api/portraits/women/86.jpg",
                     thumbnail: "https://randomuser.me/api/portraits/women/86.jpg")
    }
}

struct Info: Codable{
    var seed: String
    var resultsCount: Int
    var page: Int
    var version: String
    
    private enum CodingKeys: String, CodingKey{
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable {
    var results: [RandomUser]
    var info: Info
    
    private enum CodingKeys: String, CodingKey{
        case results, info
    }
    
    var descrption: String{
        return "result Count: \(results.count) / info: \(info.seed)"
    }
}

