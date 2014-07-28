//
//  College.swift
//  MMHS_Colleges
//
//  Created by Mobile Makers Academy on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name : String = ""
    var location : String = ""
    var image = UIImage()
    var color = UIColor()
    var webpage : String = ""
    var secondaryColor = UIColor()

    convenience init (name: String, location: String, image: UIImage, color: UIColor, webpage: String, secondaryColor: UIColor)
    {
        self.init()
        self.name = name
        self.location = location
        self.image = image
        self.color = color
        self.webpage = webpage
        self.secondaryColor = secondaryColor
    }
}
