//
//  Models.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 24/03/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import Foundation

struct Kitchen: Identifiable {
    var id =  UUID()
    var kitchenID : String
    var name : String
    var chefName : String
    var gift : String
    var type : String
    var adress: String
    var story: String
    var specialities: [String]
    var kitchenPictureURL : String
    var chefPictureURL : String
    var picturesURL : [String]
}

struct Product: Identifiable {
    var id = UUID()
    var productID : String
    var name : String
    var pictureURL : String
    var price : String
    var ingredients : [String]
    var kitchenID : String
}
