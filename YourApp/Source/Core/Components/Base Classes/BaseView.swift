//
//  BaseView.swift
//

import Foundation
import UIKit


class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupConstraints()
    }
    
    required convenience init(coder: NSCoder) {
        self.init(frame:CGRectZero)
    }
    
    func setup() {
    }
    
}


extension BaseView {
    
    func setupConstraints() {
    }
    
}