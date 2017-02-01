//
//  ViewController.swift
//  INIT Center
//
//  Created by Shashidhar Jagatap on 01/02/17.
//  Copyright © 2017 Shashidhar Jagatap. All rights reserved.
//

import UIKit

let IS_IPAD:Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)

class AboutUSViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
              var headerView = ScrollAnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)

        tableview.register(UINib(nibName: "AboutUSTableViewCell", bundle: nil), forCellReuseIdentifier: "AboutUSTableViewCell")
        tableview.register(UINib(nibName: "WhyInitTableViewCell", bundle: nil), forCellReuseIdentifier: "WhyInitTableViewCell")
        tableview.register(UINib(nibName: "ConnectNowTableViewCell", bundle: nil), forCellReuseIdentifier: "ConnectNowTableViewCell")
        
        tableview.delegate = self
        tableview.dataSource = self
        
        let frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: IS_IPAD ? 400.0:300.0)
        headerView = headerView.scrollWithFrame(frame, backGroudImage: "aboutus", headerImageURL: "logo", title: "", subTitle: "") as! ScrollAnimationView
        headerView.scrollView = tableview
        self.view.addSubview(headerView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:AboutUSTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AboutUSTableViewCell", for: indexPath) as! AboutUSTableViewCell
            return cell
        }else if indexPath.row == 1 {
            let cell:WhyInitTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WhyInitTableViewCell", for: indexPath) as! WhyInitTableViewCell
            return cell
        }else {
            let cell:ConnectNowTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ConnectNowTableViewCell", for: indexPath) as! ConnectNowTableViewCell
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 120
        }else if indexPath.row == 1 {
            return 420
        }else {
            return 60
        }
    }
    
    func rotated() {
        let when = DispatchTime.now() + 0.1
        DispatchQueue.main.asyncAfter(deadline: when) {

        let frame = CGRect(x: 0, y:0, width: self.view.frame.size.width, height: IS_IPAD ? 400.0:300.0)
        self.headerView = self.headerView.scrollWithFrame(frame, backGroudImage: "aboutus", headerImageURL: "logo", title: "", subTitle: "") as! ScrollAnimationView
            self.headerView.scrollView = self.tableview
        }
    }
}

