//
//  ScrollAnimationView.swift
//  INIT Center
//
//  Created by Shashidhar Jagatap on 01/02/17.
//  Copyright © 2017 Shashidhar Jagatap. All rights reserved.
//

import UIKit

class ScrollAnimationView: UIView {

    var backImageView:UIImageView!
    var headerImageView:UIImageView!
    var titleLabel:UILabel!
    var subTitleLabel:UILabel!
    var scrollView:UIScrollView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame) // calls designated initializer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func scrollWithFrame(_ frame:CGRect,backGroudImage backImageName:String, headerImageURL:String, title:String, subTitle:String) -> AnyObject {
        self.frame = frame;
        self.backgroundColor = UIColor.white
        
        self.backImageView = UIImageView(frame: CGRect(x: 0, y: -0.5*frame.size.height, width: frame.size.width, height: frame.size.height*1.5))
        self.backImageView.image = UIImage(named: backImageName)
        self.backImageView.contentMode = UIViewContentMode.scaleAspectFill
        
        self.headerImageView = UIImageView(frame: CGRect(x: frame.size.width*0.5-70*0.5, y: 0.50*frame.size.height, width: 70, height: 70))
        self.headerImageView.image = UIImage(named: headerImageURL)
        self.headerImageView.layer.masksToBounds = true
        self.headerImageView.layer.cornerRadius =  self.headerImageView.frame.size.width/2;
        self.headerImageView.isUserInteractionEnabled = true
        
        self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0.6*frame.size.height, width: frame.size.width, height: frame.size.height*0.2))
        self.titleLabel.textAlignment = NSTextAlignment.center
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.titleLabel.text = title;
        
        self.subTitleLabel = UILabel(frame: CGRect(x: 0, y: 0.75*frame.size.height, width: frame.size.width, height: frame.size.height*0.2))
        self.subTitleLabel.textAlignment = NSTextAlignment.center;
        self.subTitleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        self.subTitleLabel.text = subTitle;
        self.titleLabel.textColor = UIColor.darkGray
        self.subTitleLabel.textColor = UIColor.orange
        
        self.addSubview(self.backImageView)
        self.addSubview(self.headerImageView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleLabel)
        self.clipsToBounds = true
        
        return self
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let newOffset = change?[.newKey] as? CGPoint {
            self.updateSubViewsWithScrollOffset(newOffset: newOffset)

        }
    }
    
    func updateSubViewsWithScrollOffset(newOffset:CGPoint) -> Void {
        let destinaOffset:CGFloat = -64
        var newchangeOffeset:CGFloat = 0.0
        let startChangeOffset = -self.scrollView.contentInset.top
        if newOffset.y<startChangeOffset {
            newchangeOffeset =  startChangeOffset
        }else if newOffset.y>destinaOffset {
            newchangeOffeset = destinaOffset
        }else{
            newchangeOffeset = newOffset.y
        }

        
        let newOffsets = CGPoint(x: newOffset.x, y: newchangeOffeset)
        
        let subviewOffset:CGFloat = self.frame.size.height - 40
        let newY = -newOffsets.y-self.scrollView.contentInset.top
        let d = destinaOffset-startChangeOffset;
        let alpha = 1-(newOffsets.y-startChangeOffset)/d;
        let imageReduce = 1-(newOffsets.y-startChangeOffset)/(d*2);
        self.subTitleLabel.alpha = alpha;
        self.titleLabel.alpha = alpha;
        self.frame = CGRect(x: 0, y: newY, width: self.frame.size.width, height: self.frame.size.height)
        self.backImageView.frame = CGRect(x: 0, y: -0.5*self.frame.size.height+(1.5*self.frame.size.height-64)*(1-alpha), width: self.backImageView.frame.size.width, height: self.backImageView.frame.size.height)
        
        let t = CGAffineTransform(translationX: 0,y: (subviewOffset-0.35*self.frame.size.height)*(1-alpha))
        

        self.headerImageView.transform = t.scaledBy(x: imageReduce, y: imageReduce);

        self.titleLabel.frame = CGRect(x: 0, y: 0.6*self.frame.size.height+(subviewOffset-0.45*self.frame.size.height)*(1-alpha), width: self.frame.size.width, height: self.frame.size.height*0.2)
        self.subTitleLabel.frame = CGRect(x: 0, y: 0.75*self.frame.size.height+(subviewOffset-0.45*self.frame.size.height)*(1-alpha), width: self.frame.size.width, height: self.frame.size.height*0.1)
        
     }
  
    override func willMove(toSuperview newSuperview: UIView?) {
        self.scrollView .addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.new, context: nil)
        self.scrollView.contentInset = UIEdgeInsets(top: self.frame.size.height, left: 0, bottom: 0, right: 0)
        self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    }
}


