//
//  WhyInitTableViewCell.swift
//  INIT Center
//
//  Created by Shashidhar Jagatap on 01/02/17.
//  Copyright © 2017 Shashidhar Jagatap. All rights reserved.
//

import UIKit

class WhyInitTableViewCell: UITableViewCell,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var categoryTableview: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //categoryTableview.register(WhyInitDetailTableViewCell.self, forCellReuseIdentifier: "WhyInitDetailTableViewCell")

//        categoryTableview.register(UINib(nibName: "WhyInitDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "WhyInitDetailTableViewCell")
        
//        categoryTableview.delegate = self
//        categoryTableview.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:WhyInitDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WhyInitDetailTableViewCell", for: indexPath) as! WhyInitDetailTableViewCell
            return cell
        }else{
            let cell:WhyInitDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "WhyInitDetailTableViewCell", for: indexPath) as! WhyInitDetailTableViewCell
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0 {
            return 100
        }
        return 280
    }
}
