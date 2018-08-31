//
//  Actor.swift
//  TableViewTransition
//
//  Created by Artur on 31/08/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//
import UIKit

struct Actor {
    
    let name: String?
    let born: String?
    let biography: String?
    private let imageName: String?
    private let wikiUrlString: String?
    
    var image: UIImage? {
        guard let imageName = imageName else { return nil }
        return UIImage(named: imageName)
    }
    
    var wikiUrl: URL? {
        guard let wikiUrlString = wikiUrlString else { return nil }
        return URL(string: wikiUrlString)
    }
    
    init(_ actorDictionary: NSDictionary) {
        self.name = actorDictionary["name"] as? String
        self.born = actorDictionary["born"] as? String
        self.biography = actorDictionary["biography"] as? String
        self.imageName = actorDictionary["imageName"] as? String
        self.wikiUrlString = actorDictionary["wikiUrlString"] as? String
    }
    
    
}
