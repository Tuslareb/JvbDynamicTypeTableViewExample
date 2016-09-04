//
//  StaticTableViewController.swift
//  JvbDynamicTypeTableView
//
//  Created by Joost van Breukelen on 01-09-16.
//  Copyright © 2016 Joost van Breukelen. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController {
    
    //this is an outlet collection which holds all the labels in the 'correct' section
    @IBOutlet var labelsThatWeWantToBeConformToDynamicType: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //support dynamic row height. For a static tableView we also need to implement and override 'heightForRowAtIndexPath'. Setting the rowHeight property won't do here.
        tableView.estimatedRowHeight = 44

        
        if #available(iOS 10.0, *){
            
            for label in labelsThatWeWantToBeConformToDynamicType{
                
                label.adjustsFontForContentSizeCategory = true
            }
            
        }
        else{
            
            //add observer for dynamic type (for iOS 9 and below)
            NotificationCenter.default.addObserver(self,
                        selector: #selector(changeInPreferredContentSize),
                        name: NSNotification.Name.UIContentSizeCategoryDidChange,
                        object: nil)
    
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //to get the expected self-sizing behavior in a static UITableView, we can't just set the rowheight property like we did in the dynamic UITableView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    //this wil be called as soon as a notification of a change in font size is received.
    func changeInPreferredContentSize(notification: NSNotification){
        
        //every label in our outlet collection will be adjusted to the new preferred font size
        for label in labelsThatWeWantToBeConformToDynamicType{
            label.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        }

    }
    
    deinit {
        //remove observer
        NotificationCenter.default.removeObserver(self)
    }


   
}
