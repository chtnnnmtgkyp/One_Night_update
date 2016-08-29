//
//  BoardView.swift
//  One_Night
//
//  Created by bui manh tri on 8/28/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit

class BoardView: UIView, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    var view:UIView!
    var singleTap = UITapGestureRecognizer()
    var singleTap2 = UITapGestureRecognizer()
    var singleTap3 = UITapGestureRecognizer()
    var singleTap4 = UITapGestureRecognizer()
    
    @IBOutlet var view_1: UIView!
    @IBOutlet var view_2: UIView!
    @IBOutlet var view_3: UIView!
    @IBOutlet var view_4: UIView!
    
    var back: UIImageView!
    var front: UIImageView!
    var back2: UIImageView!
    var front2: UIImageView!
    var back3: UIImageView!
    var front3: UIImageView!
    var back4: UIImageView!
    var front4: UIImageView!
    
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    
    var showingBack = true
    var showingBack2 = true
    var showingBack3 = true
    var showingBack4 = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        view_1.layer.borderWidth = 1.7
        view_1.layer.borderColor = UIColor.whiteColor().CGColor
        
        view_2.layer.borderWidth = 1.7
        view_2.layer.borderColor = UIColor.whiteColor().CGColor
        
        view_3.layer.borderWidth = 1.7
        view_3.layer.borderColor = UIColor.whiteColor().CGColor
        
        view_4.layer.borderWidth = 1.7
        view_4.layer.borderColor = UIColor.whiteColor().CGColor
        
        let randomIndex = Int(arc4random_uniform(UInt32(ViewController.gobal.ArrayList.count)))
        print("random: \(randomIndex)")
        front = UIImageView(image: UIImage(named: ViewController.gobal.ArrayList[randomIndex]))
        ViewController.gobal.ArrayList.removeAtIndex(randomIndex)
        back = UIImageView(image: UIImage(named: "BackCard.jpg"))
        front!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        back!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        singleTap = UITapGestureRecognizer(target: self, action: #selector(BoardView.tapped))
        singleTap.numberOfTapsRequired = 1
        view_1.addGestureRecognizer(singleTap)
        view_1.userInteractionEnabled = true
        view_1.addSubview(back)
        
        let randomIndex2 = Int(arc4random_uniform(UInt32(ViewController.gobal.ArrayList.count)))
        front2 = UIImageView(image: UIImage(named: ViewController.gobal.ArrayList[randomIndex2]))
        ViewController.gobal.ArrayList.removeAtIndex(randomIndex2)
        back2 = UIImageView(image: UIImage(named: "BackCard.jpg"))
        front2!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        back2!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        singleTap2 = UITapGestureRecognizer(target: self, action: #selector(BoardView.tapped2))
        singleTap2.numberOfTapsRequired = 1
        view_2.addGestureRecognizer(singleTap2)
        view_2.userInteractionEnabled = true
        view_2.addSubview(back2)
    
        let randomIndex3 = Int(arc4random_uniform(UInt32(ViewController.gobal.ArrayList.count)))
        front3 = UIImageView(image: UIImage(named: ViewController.gobal.ArrayList[randomIndex3]))
        ViewController.gobal.ArrayList.removeAtIndex(randomIndex3)
        back3 = UIImageView(image: UIImage(named: "BackCard.jpg"))
        front3!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        back3!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        singleTap3 = UITapGestureRecognizer(target: self, action: #selector(BoardView.tapped3))
        singleTap3.numberOfTapsRequired = 1
        view_3.addGestureRecognizer(singleTap3)
        view_3.userInteractionEnabled = true
        view_3.addSubview(back3)
        
        let randomIndex4 = Int(arc4random_uniform(UInt32(ViewController.gobal.ArrayList.count)))
        front4 = UIImageView(image: UIImage(named: ViewController.gobal.ArrayList[randomIndex4]))
        ViewController.gobal.ArrayList.removeAtIndex(randomIndex4)
        back4 = UIImageView(image: UIImage(named: "BackCard.jpg"))
        front4!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        back4!.frame = CGRectMake(0,0,view.frame.size.width/3,view.frame.size.height/3)
        singleTap4 = UITapGestureRecognizer(target: self, action: #selector(BoardView.tapped4))
        singleTap4.numberOfTapsRequired = 1
        view_4.addGestureRecognizer(singleTap4)
        view_4.userInteractionEnabled = true
        view_4.addSubview(back4)
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "BoardView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    func tapped() {
        if (showingBack) {
            UIView.transitionFromView(back, toView: front, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack = false
        } else {
            UIView.transitionFromView(front, toView: back, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack = true
            singleTap.numberOfTapsRequired = 0
            
            if btn2.enabled == false && ViewController.gobal.loadImage2 == 0{
                btn2.enabled = true
            }
            if btn3.enabled == false && ViewController.gobal.loadImage3 == 0{
                btn3.enabled = true
            }
            if btn4.enabled == false && ViewController.gobal.loadImage4 == 0{
                btn4.enabled = true
            }
            view_2.userInteractionEnabled = true
            view_3.userInteractionEnabled = true
            view_4.userInteractionEnabled = true
            
            view_1.layer.borderColor = UIColor.blackColor().CGColor
        }
    }
    
    func tapped2() {
        if (showingBack2) {
            UIView.transitionFromView(back2, toView: front2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack2 = false
        } else {
            UIView.transitionFromView(front2, toView: back2, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack2 = true
            singleTap2.numberOfTapsRequired = 0
            
            if btn1.enabled == false && ViewController.gobal.loadImage == 0{
                btn1.enabled = true
            }
            if btn3.enabled == false && ViewController.gobal.loadImage3 == 0{
                btn3.enabled = true
            }
            if btn4.enabled == false && ViewController.gobal.loadImage4 == 0{
                btn4.enabled = true
            }
            view_1.userInteractionEnabled = true
            view_3.userInteractionEnabled = true
            view_4.userInteractionEnabled = true
            view_2.layer.borderColor = UIColor.blackColor().CGColor
        }
    }
    
    func tapped3() {
        if (showingBack3) {
            UIView.transitionFromView(back3, toView: front3, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack3 = false
        } else {
            UIView.transitionFromView(front3, toView: back3, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack3 = true
            singleTap3.numberOfTapsRequired = 0
            
            if btn1.enabled == false && ViewController.gobal.loadImage == 0{
                btn1.enabled = true
            }
            if btn2.enabled == false && ViewController.gobal.loadImage2 == 0{
                btn2.enabled = true
            }
            if btn4.enabled == false && ViewController.gobal.loadImage4 == 0{
                btn4.enabled = true
            }
            view_1.userInteractionEnabled = true
            view_2.userInteractionEnabled = true
            view_4.userInteractionEnabled = true
            view_3.layer.borderColor = UIColor.blackColor().CGColor
        }
    }
    
    func tapped4() {
        if (showingBack4) {
            UIView.transitionFromView(back4, toView: front4, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack4 = false
        } else {
            UIView.transitionFromView(front4, toView: back4, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack4 = true
            singleTap4.numberOfTapsRequired = 0
            
            if btn1.enabled == false && ViewController.gobal.loadImage == 0{
                btn1.enabled = true
            }
            if btn2.enabled == false && ViewController.gobal.loadImage2 == 0{
                btn2.enabled = true
            }
            if btn3.enabled == false && ViewController.gobal.loadImage3 == 0{
                btn3.enabled = true
            }
            view_1.userInteractionEnabled = true
            view_2.userInteractionEnabled = true
            view_3.userInteractionEnabled = true
            view_4.layer.borderColor = UIColor.blackColor().CGColor
        }
    }
    

    
    @IBAction func btnLoadImage(sender: AnyObject) {
        
    }
}
