//
//  UIViewExtension.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/24/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

//extension UIView {
//
//    @discardableResult   // 1
//    func xibSetup() -> UIView? {   // 2
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        let contentView  = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
//
////        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else {    // 3
////            // xib not loaded, or its top view is of the wrong type
////            return nil
////        }
//        self.addSubview(contentView)     // 4
//        contentView.translatesAutoresizingMaskIntoConstraints = false   // 5
//        contentView.layoutAttachAll(to: self)   // 6
//        return contentView   // 7
//    }
//
//    func layoutAttachAll(to view: UIView) {
////        let view = superview
//        layoutAttachTop(to: view)
//        layoutAttachBottom(to: view)
//        layoutAttachLeading(to: view)
//        layoutAttachTrailing(to: view)
//    }
//
//
//    func layoutAttachAll(margin : CGFloat = 0.0) {
//        let view = superview
//        layoutAttachTop(to: view, margin: margin)
//        layoutAttachBottom(to: view, margin: margin)
//        layoutAttachLeading(to: view, margin: margin)
//        layoutAttachTrailing(to: view, margin: margin)
//    }
//
//    /// attaches the top of the current view to the given view's top if it's a superview of the current view, or to it's bottom if it's not (assuming this is then a sibling view).
//    /// if view is not provided, the current view's super view is used
//    @discardableResult
//    func layoutAttachTop(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
//
//        let view: UIView? = to ?? superview
//        let isSuperview = view == superview
//        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: isSuperview ? .top : .bottom, multiplier: 1.0, constant: margin)
//        superview?.addConstraint(constraint)
//
//        return constraint
//    }
//
//    /// attaches the bottom of the current view to the given view
//    @discardableResult
//    func layoutAttachBottom(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
//
//        let view: UIView? = to ?? superview
//        let isSuperview = (view == superview) || false
//        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: isSuperview ? .bottom : .top, multiplier: 1.0, constant: -margin)
//        if let priority = priority {
//            constraint.priority = priority
//        }
//        superview?.addConstraint(constraint)
//
//        return constraint
//    }
//
//    /// attaches the leading edge of the current view to the given view
//    @discardableResult
//    func layoutAttachLeading(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
//
//        let view: UIView? = to ?? superview
//        let isSuperview = (view == superview) || false
//        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: isSuperview ? .leading : .trailing, multiplier: 1.0, constant: margin)
//        superview?.addConstraint(constraint)
//
//        return constraint
//    }
//
//    /// attaches the trailing edge of the current view to the given view
//    @discardableResult
//    func layoutAttachTrailing(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
//
//        let view: UIView? = to ?? superview
//        let isSuperview = (view == superview) || false
//        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: isSuperview ? .trailing : .leading, multiplier: 1.0, constant: -margin)
//        if let priority = priority {
//            constraint.priority = priority
//        }
//        superview?.addConstraint(constraint)
//
//        return constraint
//    }
//
//
//
//}


extension UIView{

//    func xibSetup() {
//        let view = loadFromNib()
//        addSubview(view)
//        stretch(view: view)
//    }
    
//    2. Loads the view from the nib in the bundle
    /// Method to init the view from a Nib.
    ///
    /// - Returns: Optional UIView initialized from the Nib of the same class name.
//    func loadFromNib<T: UIView>() -> T {
//        let selfType = type(of: self)
//        let bundle = Bundle(for: selfType)
//        let nibName = String(describing: selfType)
//        let nib = UINib(nibName: nibName, bundle: bundle)
//
//        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
//            fatalError("Error loading nib with name \(nibName) ")
//        }
//
//        return view
//    }
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    
//    3. Resizes the loaded view, ready for use
    /// Stretches the input view to the UIView frame using Auto-layout
    ///
    /// - Parameter view: The view to stretch.
    func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
