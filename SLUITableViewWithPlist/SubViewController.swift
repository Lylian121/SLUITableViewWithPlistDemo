//
//  SubViewController.swift
//  SLUITableViewWithPlist
//
//  Created by 施乐 on 16/3/15.
//  Copyright © 2016年 Shile seal. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    
    var indexPath:NSIndexPath?
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textLabel.text = "\(indexPath)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
