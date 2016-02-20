//
//  BaseVC.swift
//

import UIKit


class BaseVC: UIViewController {
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
}