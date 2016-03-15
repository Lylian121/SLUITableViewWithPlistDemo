//
//  ViewController.swift
//  SLUITableViewWithPlist
//
//  Created by 施乐 on 16/3/15.
//  Copyright © 2016年 Shile seal. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {

    var sections:NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Plist的存取需要使用沙盒
//        let documents = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true) as NSArray
//        let document = documents[0] as! String
//        let path = document.stringByAppendingString("Setting.plist")

        //如果是在项目目录，用mainBundle
        
        self.title = "设置"
        
        let path = NSBundle.mainBundle().pathForResource("Setting.plist", ofType: nil)!
        print("\(path)")
        
        if let sections = NSArray(contentsOfFile: path){
            self.sections = sections
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections!.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections![section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("TableViewCell") as! TableViewCell
        let dict = ((sections![indexPath.section] as! NSArray)[indexPath.row] as! [String:NSObject])
        
        if let imageUrl = dict["imageUrl"]{
            cell.imageView?.image = UIImage(named: imageUrl as! String)
        }
        if let textLabel = dict["text"]{
            cell.textLabel!.text = textLabel as! String
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel!.tag = 1
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section\(section)"
    }

    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer\(section)"
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let subViewController = self.storyboard?.instantiateViewControllerWithIdentifier("SubViewController") as! SubViewController
        subViewController.navigationItem.title = (self.tableView(self.tableView, cellForRowAtIndexPath: indexPath).viewWithTag(1) as! UILabel).text
        //subViewController.textLabel.text = "xxxxxxxx"  错误，因为subViewController还没有load，textLabel不存在
        subViewController.indexPath = indexPath
        self.navigationController?.pushViewController(subViewController, animated: true)
    }
    
}

