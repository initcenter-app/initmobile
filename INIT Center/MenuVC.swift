//
//  MenuVC.swift
//  SOSideMenu
//
//  Created by Hitesh on 11/16/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var tblMenu: UITableView!
    var menuOption:NSMutableArray!
    
    @IBOutlet var trailingSpaceConstant: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        menuOption = ["About Us","Courses","To Corporates","Connect"]
    }

    @IBAction func actionMenu(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        self.openSegue("openMenu", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = menuOption.object(at: indexPath.row) as? String
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }

}


protocol MenuDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?)
    func openMenu()
}

extension MenuVC : MenuDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?) {
        dismiss(animated: true){
         
        }
    }
    func openMenu(){
        performSegue(withIdentifier: "openMenu", sender: nil)
    }
}

