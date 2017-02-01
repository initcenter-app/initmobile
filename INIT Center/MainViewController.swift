//
//  MainViewController.swift
//  INIT Center
//
//  Created by Shashidhar Jagatap on 01/02/17.
//  Copyright © 2017 Shashidhar Jagatap. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UIViewControllerTransitioningDelegate {

    @IBOutlet var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationImage() -> Void {
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {

                self.logoImage.isHidden = true
            
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 138, height: 38))
                imageView.image = UIImage(named: "init-center.png")
                imageView.contentMode = .scaleAspectFit
                
                self.navigationItem.titleView = imageView
                
                let button1 = UIBarButtonItem(image: UIImage(named: "settings"), style: .plain, target: self, action: #selector(self.moreOptions)) // action:#selector(Class.MethodName) for swift 3
                self.navigationItem.leftBarButtonItem  = button1
                let button2 = UIBarButtonItem(image: UIImage(named: "mailIcon"), style: .plain, target: self, action: #selector(self.contactUS)) // action:#selector(Class.MethodName) for swift 3
                self.navigationItem.rightBarButtonItem  = button2
                self.addAboutUSVC()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController = segue.destination as? MenuVC {
            destinationViewController.transitioningDelegate = self
        }
    }
    
    func moreOptions() -> Void {
        performSegue(withIdentifier: "openMenu", sender: nil)
    }
    
    func contactUS() -> Void {
        
    }
    
    func addAboutUSVC() -> Void {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let aboutUSVC = mainStoryboard.instantiateViewController(withIdentifier: "AboutUSViewController")
        addChildViewController(aboutUSVC)
        aboutUSVC.view.frame = self.view.frame;
        self.view.addSubview(aboutUSVC.view)
        aboutUSVC.didMove(toParentViewController: self)

    }

        func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return Animation(isPresenting: true)
        }
        
        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return Animation(isPresenting: false)
        }
        
        func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
            return nil
        }
        
        func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
            return nil
        }

}
