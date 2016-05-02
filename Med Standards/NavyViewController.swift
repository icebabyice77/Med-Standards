//
//  NavyViewController.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 5/31/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

struct navy {
    static var selection:String = ""
    static var link:String = ""
    
    static let waiverGuideTitle = "Navy Waiver Guide"
    static let waiverGuideDetail = "U.S. Navy Aeromedical Reference & Waiver Guide (29 Jan 2016)"
    static let waiverGuidePDF = "Navy Aeromedical Reference and Waiver Guide (29 Jan 2016)"

    static let usnManmedTitle = "Navy ManMed Chapter 15"
    static let usnManmedDetail = "Physical Exams & Standards (12 Aug 2005 + 8 Dec 2015 Updates)"
    static let usnManmedPDF = "USN ManMed Chapter 15 Physical Exams & Standards for Enlistment, Commission, & Special Duty (12 Aug 2005 + 8 Dec 2015 Updates)"

}

class NavyViewController: UITableViewController {
    
    let navyDocArray:NSArray = [navy.waiverGuideTitle, navy.usnManmedTitle]
    let navyDocDetailArray:NSArray = [navy.waiverGuideDetail, navy.usnManmedDetail]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navyDocArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (navyDocDetailArray[indexPath.row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: navyDocArray[indexPath.row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        
        title.appendAttributedString(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        navy.selection = ""
        
        navy.selection = navyDocArray[indexPath.row] as! String
        
        performSegueWithIdentifier("navyWebviewSegue", sender: nil)
        
    }
    
}
