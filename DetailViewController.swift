//
//  DetailViewController.swift
//  MMHS_Colleges
//
//  Created by Richard Fellure on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var locationButton: UIButton!

    var college : College!
    var collegeArray : [College]!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.title = college.name
        imageView.image = college.image
        locationButton.setTitle(college.location, forState: .Normal)
        view.backgroundColor = college.color
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        let mapVC = segue.destinationViewController as MapViewController
        mapVC.college = college
        mapVC.colleges = collegeArray
    }

}
