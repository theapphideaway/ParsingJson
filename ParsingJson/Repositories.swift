//
//  Repositories.swift
//  ParsingJson
//
//  Created by ian schoenrock on 3/2/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class Repository: Decodable {
    
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}
