//
//  DoppelgangerView.swift
//  One_Night
//
//  Created by bui manh tri on 7/15/16.
//  Copyright © 2016 TriBM. All rights reserved.
//

import UIKit

class DoppelgangerView: UIView {
    
    @IBOutlet var lblText: UILabel!
    
    var view:UIView!
    
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
        self.lblText.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.lblText.numberOfLines = 7
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "DoppelgangerView", bundle:bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
    
    
    
}
