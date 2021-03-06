//
//  ViewController.swift
//  MMHS_Colleges
//
//  Created by Mobile Makers Academy on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var colleges : [College] = []
                            
    @IBOutlet weak var tabelView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let collegeOne = College(name: "Ohio State University", location: "Columbus, OH", image: UIImage(named: "Brutus"), color: UIColor.redColor(), webpage: "http://www.osu.edu", secondaryColor: UIColor.grayColor())
        let collegeTwo = College(name: "University of Dayton", location: "Dayton, OH", image: UIImage(named: "Default"), color: UIColor.redColor(), webpage: "http://www.UofD.edu", secondaryColor: UIColor.whiteColor())
        let collegeThree = College(name: "NorthWestern University", location: "Evanston, IL", image: UIImage(named: "NorthWestern_Image"), color: UIColor.purpleColor(), webpage: "http://www.NorthWesternUni.edu", secondaryColor: UIColor.whiteColor())
        let collegeFour = College(name: "Muskingum University", location: "New Concord, OH", image: UIImage(named: "Muskie"), color: UIColor.magentaColor(), webpage: "http://www.muskingum.edu", secondaryColor: UIColor.blackColor())
        colleges += [collegeOne, collegeTwo, collegeThree, collegeFour]

    }

    @IBAction func onButtonPressedAdd(sender: UIBarButtonItem)
    {
        let alert = UIAlertController(title: "Add a new college", message: nil, preferredStyle: .Alert)

        alert.addTextFieldWithConfigurationHandler({ textField in
            textField.placeholder = "Name of College"
            })
        alert.addTextFieldWithConfigurationHandler({ textField in
            textField.placeholder = "Location of College"
            })
        alert.addTextFieldWithConfigurationHandler({ textField in
            textField.placeholder = "Webpage for College"
            })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: ({ action in
            }))
        alert.addAction(cancelAction)
        let saveAction = UIAlertAction(title: "Add", style: .Default, handler: ({ action in
            let textFieldOne = alert.textFields[0] as UITextField
            let textFieldTwo = alert.textFields[1] as UITextField
            let college = College(name: textFieldOne.text, location: textFieldTwo.text, image: UIImage(named: "Default"), color:UIColor.whiteColor(), webpage: "Http://www.google.com", secondaryColor: UIColor.blackColor())

            self.colleges += college
            self.tabelView.reloadData()
            }))
        alert.addAction(saveAction)
        self.presentViewController(alert, animated: true, completion: nil)

    }

    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tabelView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell

        cell.textLabel.text = colleges[indexPath.row].name
        cell.imageView.image = colleges[indexPath.row].image
        return cell
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }

    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            tabelView.reloadData()
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!)
    {
        let detailVC = segue.destinationViewController as DetailViewController
        let indexPath = tabelView.indexPathForSelectedRow()
        detailVC.college = colleges[indexPath.row]
        detailVC.collegeArray = colleges
    }
}

